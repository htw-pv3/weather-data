#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
HTW-PV3 - Weather Data - Plot

Create an InfoDict and use for plotting

SPDX-License-Identifier: AGPL-3.0-or-later
"""

__copyright__ = "© Ludwig Hülk"
__license__ = "GNU Affero General Public License Version 3 (AGPL-3.0)"
__url__ = "https://www.gnu.org/licenses/agpl-3.0.en.html"
__author__ = "Ludee;"
__version__ = "v0.0.1"


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


def create_info_dict(name, i_xaxis):
    info_dict = {}
    info_dict['Filename'] = ['{}_{}_htw_weatherdata'.format(
        pd.to_datetime('today').strftime("%Y-%m-%d"), name)]
    info_dict['Value'] = ['Bestrahlungsstärke']
    info_dict['Unit'] = ['W/m²']
    info_dict['Y-Axis'] = [
        '{} in {}'.format(*info_dict['Value'], *info_dict['Unit'])]
    info_dict['X-Axis'] = [i_xaxis]
    info_dict['Title'] = ['Solarstrahlung']
    # meta_str = query_database_metadata(con, schema, table)
    # info_dict['Metadata'] = [meta_str]

    return info_dict


def create_plot(info_dict, df):
    sns.set_palette("husl")
    mfig = plt.figure(figsize=(12, 5))
    ax = plt.subplot()
    plt.title(*info_dict['Title'], fontsize=16)
    plt.ylabel(*info_dict['Y-Axis'])
    plt.xlabel(*info_dict['X-Axis'])
    df.loc[:, ['dni', 'dhi']].plot(ax=ax,
                                                  lw=0.5,
                                                  markeredgewidth=3)
    ax.set_ylim(ymin=0)

    return mfig


def save_plot_as_file(info_dict, mfig):
    plotname = 'data/{}.png'.format(*info_dict['Filename'])
    mfig.savefig(plotname, bbox_inches='tight')
    print("Plot saved to file:", plotname)
