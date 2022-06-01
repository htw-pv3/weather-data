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
from pv3_export_polysun import export_htw_polysun

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

    # Export data
    fn_polysun = 'pv3_htw_polysun_1min_2015.csv'
    df_irradiance_min = export_htw_polysun(df_htw, fn_polysun, 'M', 'g_hor_si')

    file_name_polysun_1h = 'pv3_htw_polysun_1h_2015.csv'
    df_htw_hour = df_htw.resample('1H').mean()
    df_irradiance_hour = export_htw_polysun(df_htw_hour, file_name_polysun_1h,
                                            'H',
                                            'g_hor_si')

    # Plot Minute
    info_dict = {}
    info_dict['Filename'] = ['{}_htw_weatherdata'.format(
        pd.to_datetime('today').strftime("%Y-%m-%d"))]
    info_dict['Value'] = ['Bestrahlungsstärke']
    info_dict['Unit'] = ['W/m²']
    info_dict['Y-Axis'] = [
        '{} in {}'.format(*info_dict['Value'], *info_dict['Unit'])]
    info_dict['X-Axis'] = ['Minute im Jahr']
    info_dict['Title'] = ['Solarstrahlung']
    meta_str = query_database_metadata(con, schema, table)
    info_dict['Metadata'] = [meta_str]

    sns.set_palette("husl")
    mfig_weatherdata_min = plt.figure(figsize=(12, 5))
    ax = plt.subplot()
    plt.title(*info_dict['Title'], fontsize=16)
    plt.ylabel(*info_dict['Y-Axis'])
    plt.xlabel(*info_dict['X-Axis'])
    df_irradiance_min.loc[:, ['dni', 'dhi']].plot(ax=ax,
                                                  lw=0.5,
                                                  markeredgewidth=3)
    ax.set_ylim(ymin=0)

    # Plot Hour
    info_dict = {}
    info_dict['Filename'] = ['{}_htw_weatherdata'.format(
        pd.to_datetime('today').strftime("%Y-%m-%d"))]
    info_dict['Value'] = ['Bestrahlungsstärke']
    info_dict['Unit'] = ['W/m²']
    info_dict['Y-Axis'] = [
        '{} in {}'.format(*info_dict['Value'], *info_dict['Unit'])]
    info_dict['X-Axis'] = ['Stunde im Jahr']
    info_dict['Title'] = ['Solarstrahlung']
    meta_str = query_database_metadata(con, schema, table)
    info_dict['Metadata'] = [meta_str]

    sns.set_palette("husl")
    mfig_weatherdata_hour = plt.figure(figsize=(12, 5))
    ax = plt.subplot()
    plt.title(*info_dict['Title'], fontsize=16)
    plt.ylabel(*info_dict['Y-Axis'])
    plt.xlabel(*info_dict['X-Axis'])
    df_irradiance_min.loc[:, ['dni', 'dhi']].resample('1H').mean().plot(ax=ax,
                                                                        lw=0.5,
                                                                        markeredgewidth=3)
    ax.set_ylim(ymin=0)

    # Save plots as file
    plotname = 'data/{}_min_mfig.png'.format(*info_dict['Filename'])
    mfig_weatherdata_min.savefig(plotname, bbox_inches='tight')
    print("Plot saved to file:", plotname)

    plotname = 'data/{}_hour_mfig.png'.format(*info_dict['Filename'])
    mfig_weatherdata_hour.savefig(plotname, bbox_inches='tight')
    print("Plot saved to file:", plotname)
