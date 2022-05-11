import sys
import os
import getpass
import pandas as pd
import numpy as np
import json
from sqlalchemy import *
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker
import plotly.graph_objs as go
import plotly.offline as pltly
import colorlover as cl
import seaborn as sns

version = 'v1 (jupyter)'
project = 'pv3'


def postgres_session():
    """SQLAlchemy session object with valid connection to reeem database"""

    print('Please provide connection parameters to database:\n' +
          'Hit [Enter] to take defaults')
    host = 'localhost'  # input('host (default 130.226.55.43): ')
    port = input('port (default 5432): ')  # '5435' or '5432'
    database = 'sonnja_db'  # input("database name (default 'reeem'): ")
    user = 'sonnja'  # input('user (default postgres): ')
    # password = input('password: ')
    password = getpass.getpass(prompt='password: ',
                               stream=sys.stderr)
    con = create_engine(
        'postgresql://' + '%s:%s@%s:%s/%s' % (user,
                                              password,
                                              host,
                                              port,
                                              database)).connect()
    print('Password correct! Database connection established.')
    return con


# start session
con = postgres_session()

# Database select (SQL)
sql = text("""SELECT obj_description('pv3.htw_weatherdata_2015'::regclass);""")
meta_str = pd.read_sql_query(sql, con).loc[0, 'obj_description']
print(meta_str)

# Database select (SQL)
sql = text("""
    SELECT  timestamp, g_hor_si, g_gen_cmp11, ev_beleuchtung   -- column
    FROM    pv3.htw_weatherdata_2015  -- table
    """)
df = pd.read_sql_query(sql, con)
df = df.set_index('timestamp')

# Plot
ax = df.plot(figsize=(12, 4), lw=0.25)

# Resample
df_reH = df.resample('1H').mean()
ax = df_reH.plot(figsize=(12, 4), lw=0.75)
