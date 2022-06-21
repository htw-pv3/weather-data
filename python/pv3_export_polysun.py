#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
HTW-PV3 - Export weather data for Polysun

Export weather data for Polysun

SPDX-License-Identifier: AGPL-3.0-or-later
"""

__copyright__ = "© Ludwig Hülk"
__license__ = "GNU Affero General Public License Version 3 (AGPL-3.0)"
__url__ = "https://www.gnu.org/licenses/agpl-3.0.en.html"
__author__ = "Ludee;"
__version__ = "v0.0.1"

from irradiation import calculate_diffuse_irradiation
from settings import write_to_csv
from settings import HTW_LAT, HTW_LON

import pandas as pd


def export_htw_polysun(df_weather, filename, resolution, parameter_name):
    """
    Export weather data for Polysun

    Parameters
    ----------
    df_weather : DataFrame
        Weather data
    filename : str
        Name of csv file
    resolution : str
        Resolution for time series: Minute (M), Hour (H)
    parameter_name :
        Name of column with GHI for diffuse irradiation
    Returns
    -------
    file : csv
        Calculated weather data in Polysun format
    """

    # Calculate diffuse irradiation
    df_irradiance = calculate_diffuse_irradiation(df_weather, parameter_name,
                                                  HTW_LAT,
                                                  HTW_LON)

    # Set resolution for time index in seconds
    if resolution == 'M':
        s = 60
        steps = 525600
    elif resolution == 'H':
        s = 3600
        steps = 8760

    time = list(zip(range(steps), [s * i for i in range(steps)]))
    polysun = {}
    polysun = {'# Time [s]': dict(time)}

    polysun.update(
        df_weather.loc[:,
        ['g_hor_si', 't_luft', 'v_wind', 'h_luft']].reset_index(
            drop=True).to_dict())

    df_polysun = pd.DataFrame.from_dict(polysun)
    df_polysun = df_polysun.merge(df_irradiance['dhi'].reset_index(drop=True),
                                  left_index=True, right_index=True)

    df_polysun['Lh [W/m²]'] = 0  # Lh Langwellenstrahlung[Wh / m2]

    # Rename columns
    column_names = {'g_hor_si': 'Gh [W/m²]',  # Gh Globalstrahlung [Wh/m2]
                    'dhi': 'Dh [W/m²]',  # Dh Diffusstrahlung [Wh/m2]
                    't_luft': 'Tamb [°C]',  # Tamb Umgebungstemperatur [°C]
                    'v_wind': 'Wind [m/s]',  # Vwnd Windgeschwindigkeit [m/s]
                    'h_luft': 'Humidity [%]',  # Hrel Luftfeuchtigkeit [%]
                    }
    df_polysun = df_polysun.rename(columns=column_names)

    df_polysun = df_polysun.loc[:,
                 ['# Time [s]', 'Gh [W/m²]', 'Dh [W/m²]', 'Tamb [°C]',
                  'Lh [W/m²]', 'Wind [m/s]', 'Humidity [%]']]

    df_polysun = df_polysun.round(1)

    write_to_csv(f'./data/{filename}', df_polysun, append=False,
                 index=False)

    # Add header rows
    polysun_first_row = '# Station: HTW Berlin, PVlib\n'
    polysun_second_row = f'# Latitude: {HTW_LAT:.4f} Longitude: {HTW_LON:.4f} altitude: 81m\n'
    polysun_third_row = '#'

    # Write to file
    with open(f'./data/{filename}', "r+") as text_file:
        content = text_file.read()
        text_file.seek(0, 0)
        text_file.write(
            polysun_first_row + polysun_second_row + polysun_third_row + '\n' + content)

    print(f'Data saved to file /data/{filename}.')
    return df_irradiance
