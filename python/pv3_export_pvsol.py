#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
HTW-PV3 - Export weather data for PVSOL premium

Export weather data for PVSOL

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


def export_htw_pvsol(df_weather, filename):
    """
    Export weather data for PVSOL

    Parameters
    ----------
    df_weather : DataFrame
        Weather data
    filename : str
        Name of csv file
    Returns
    -------
    file : csv
        Calculated weather data in correct format
    """

    # Add header rows
    # 1. enthält den Namen des Standorts.
    # 2. enthält Breitengrad, Längengrad, Höhe über NN, Zeitzone und ein Flag.
    # 3. bleibt leer
    # 4. Kopfzeile für Messwerte, mit 4 Spalten:
        # Ta - Umgebungstemperatur in °C
        # Gh - Globalstrahlung horizontal in Wh/m²
        # FF - Windgeschwindigkeit in m/s
        # RH - relative Luftfeuchtigkeit in %
    pvsol_first_row = 'PV3 - HTW Wetter - g_hor_si Stundenmittelwerte 2015\n'
    pvsol_second_row = f'{HTW_LAT:.4f},-{HTW_LON:.4f},81,-1,-30\n'
    pvsol_third_row = '\n'
    pvsol_fourth_row = 'Ta\tGh\tFF\tRH\n'

    with open(f'./data/{filename}', "w") as text_file:
        text_file.write(
            pvsol_first_row + pvsol_second_row + pvsol_third_row + pvsol_fourth_row)

    # Rename columns
    column_names = {'g_hor_si': 'Gh [W/m²]',
                   't_luft': 'Ta [°C]',
                   'v_wind': 'FF [m/s]',
                   'h_luft': 'RH [%]'
                   }
    df_pvsol = df_weather.loc[:, ['t_luft', 'g_hor_si',  'v_wind', 'h_luft']].reset_index(drop=True)
    df_pvsol = df_pvsol.rename(columns=column_names)
    df_pvsol = df_pvsol.round(1)

    # Write to file
    write_to_csv(f'./data/{filename}', df_pvsol,
                 index=False, sep='\t')

    print(f'Data saved to file /data/{filename}.')
