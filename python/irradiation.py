
from pvlib.irradiance import clearness_index, get_extra_radiation

import pandas as pd
from datetime import timedelta
from collections import OrderedDict
import pvlib
from pvlib import tools
import numpy as np


def calculate_diffuse_irradiation(df, parameter_name, lat, lon):
    """
    Returns
    -------
    """
    # calculate dhi and dni for htw weatherdata
    df_solarpos = pvlib.solarposition.spa_python(df.index, lat, lon)

    df_irradiance = pvlib.irradiance.erbs(ghi=df.loc[:, parameter_name],
                                          zenith=df_solarpos.zenith,
                                          datetime_or_doy=df.index.dayofyear)
    df_irradiance = pd.DataFrame(df_irradiance)

    return df_irradiance