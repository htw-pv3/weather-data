#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
HTW-PV3 - Irradiation

Calculate solar position and diffuse irradiation.

pvlib.solarposition.spa_python - https://pvlib-python.readthedocs.io/en/stable/reference/generated/pvlib.solarposition.spa_python.html
pvlib.irradiance.erbs - https://pvlib-python.readthedocs.io/en/stable/reference/generated/pvlib.irradiance.erbs.html

SPDX-License-Identifier: AGPL-3.0-or-later
"""

__copyright__ = "© Ludwig Hülk"
__license__ = "GNU Affero General Public License Version 3 (AGPL-3.0)"
__url__ = "https://www.gnu.org/licenses/agpl-3.0.en.html"
__author__ = "Ludee;"
__version__ = "v0.0.1"

from pvlib.solarposition import spa_python
from pvlib.irradiance import erbs

import pandas as pd


def calculate_diffuse_irradiation(df, parameter_name, lat, lon):
    """
    Calculate diffuse irradiation

    Parameters
    ----------
    df : DataFrame
        Global Horizontal Irradiance (GHI)
    parameter_name : str
        Name of column with GHI
    lat : float
        Latitude
    lon : float
        Longitude
    Returns
    -------
    df_irradiance : DataFrame
        Calculated
            dni: the modeled direct normal irradiance in W/m^2.
            dhi: the modeled diffuse horizontal irradiance in W/m^2.
            kt: ratio of global to extraterrestrial irradiance on a horizontal plane.
    """

    # Calculate solar position from time index
    df_solarposition = spa_python(df.index, lat, lon)

    # Calculate dhi and dni from parameter
    df_irradiance = erbs(ghi=df.loc[:, parameter_name],
                         zenith=df_solarposition.zenith,
                         datetime_or_doy=df.index.dayofyear)

    # Setup DataFrame
    df_irradiance = pd.DataFrame(df_irradiance)

    return df_irradiance
