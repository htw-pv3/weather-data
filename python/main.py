#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
HTW-PV3 - Weather Data - Main file

Export weather data for PVSOL and Polysun

SPDX-License-Identifier: AGPL-3.0-or-later
"""

__copyright__ = "© Ludwig Hülk"
__license__ = "GNU Affero General Public License Version 3 (AGPL-3.0)"
__url__ = "https://www.gnu.org/licenses/agpl-3.0.en.html"
__author__ = "Ludee;"
__version__ = "v0.0.1"

from settings import postgres_session, query_database
from pv3_export_polysun import export_htw_polysun

import pandas as pd
from sqlalchemy import *

version = 'v1 (jupyter)'
project = 'pv3'

if __name__ == "__main__":
    # Start database session
    con = postgres_session()

    # Select data
    schema = 'pv3'
    table = 'pv3_weather_2015_filled_mview'
    df_htw = query_database(con, schema, table)

    # Export data
    fn_polysun = 'pv3_htw_polysun_1min_2015.csv'
    export_htw_polysun(df_htw, fn_polysun, 'M', 'g_hor_si')

    file_name_polysun_1h = 'pv3_htw_polysun_1h_2015.csv'
    df_db_htw_weather_1h = df_htw.resample('1H').mean()
    export_htw_polysun(df_db_htw_weather_1h, file_name_polysun_1h, 'H',
                       'g_hor_si')