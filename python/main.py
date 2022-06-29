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

from settings import postgres_session, query_database, query_database_metadata
from pv3_export_polysun import export_htw_polysun, export_fred_polysun
from pv3_export_pvsol import export_htw_pvsol
from plot import create_info_dict, create_plot, save_plot_as_file

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

version = 'v1'
project = 'pv3'

if __name__ == "__main__":
    # Start database session
    con = postgres_session()

    # Select data
    schema = 'pv3'
    table = 'htw_weatherdata_2015'
    df_htw = query_database(con, schema, table)
    df_htw_hour = df_htw.resample('1H').mean()

    # read open_FRED weatherdata from sonnja_db
    schema = 'pv3'
    table = 'openfred_weatherdata_2015_htw'
    df_fred = query_database(con, schema, table)

    # Export data Polysun
    fn_polysun = 'pv3_htw_polysun_1min_2015.csv'
    df_irradiance_min = export_htw_polysun(df_htw, fn_polysun, 'M', 'g_hor_si')

    fn_polysun_1h = 'pv3_htw_polysun_1h_2015.csv'
    df_irradiance_hour = export_htw_polysun(df_htw_hour, fn_polysun_1h, 'H', 'g_hor_si')

    fn_polysun_fred = 'pv3_fred_polysun_1h_2015.csv'
    export_fred_polysun(df_fred, fn_polysun_fred, 'H')

    # Export data PVSOL
    fn_pvsol = 'pv3_htw_pvsol_1min_2015.csv'
    export_htw_pvsol(df_htw, fn_pvsol)

    fn_pvsol_1h = 'pv3_htw_pvsol_1h_2015.csv'
    export_htw_pvsol(df_htw_hour, fn_pvsol_1h)


    # Plot Minute
    idict_min = create_info_dict('min', 'Minute im Jahr')
    mfig_weatherdata_min = create_plot(idict_min, df_irradiance_min)
    save_plot_as_file(idict_min, mfig_weatherdata_min)

    # Plot Hour
    idict_hour = create_info_dict('hour', 'Stunde im Jahr')
    mfig_weatherdata_hour = create_plot(idict_hour, df_irradiance_hour)
    save_plot_as_file(idict_hour, mfig_weatherdata_hour)
