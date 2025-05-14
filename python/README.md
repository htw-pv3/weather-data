# Weather-Data - Python

This project contains Python scripts to process, plot and export weather data.

## Set System Paths
open console "cmd.exe" as admin
```bash
echo %path%
set PATH=%PATH%;D:\Anaconda3;D:\Anaconda3\Scripts\
```

## Check conda & python
```bash
conda --version
```
"conda 4.9.2"

```bash
conda search --full-name python
python --version
```

"Python 3.8.10"

## Check Conda-Environments
```bash
conda info --envs
conda create --help
```

## Start Conda-Environment
```bash
activate d_py310_pv3
```

## Create Environment

### From File
```bash
cd D:\git\github\htw-pv3\weather-data\python
conda env create -f requirements.yml
activate d_py310_pv3
conda install colorlover -c conda-forge
``` 

### Manual
```bash
conda create --name d_py310_pv3 python=3.10
activate d_py310_pv3
conda install jupyter
conda install matplotlib
conda install pandas
conda install plotly
conda install sqlalchemy
conda install seaborn
conda install xlrd
conda install openpyxl
conda install psycopg2
conda install colorlover -c conda-forge
``` 


## Start  Conda-Environment
```bash
activate d_py38_pv3vis
```

## Start Jupyter Notebook
```bash
D:
cd D:\git\github\htw-pv3\weather-data\python
jupyter notebook
```

## Close Jupyter Notebook
- Strg + c

## Close Conda-Environment
```bash
deactivate
```

## Delete Conda-Environment
```bash
conda remove --name d_py310_pv3 --all
```


## Check existing packages
```bash
conda list
conda list --explicit
```

## Search for other packages
```bash
conda search <package>
```

## Install package
```bash
conda install -c pvlib pvlib
```

## Remove package
```bash
conda remove --name d_py38_pv3 sqlalchemy
```

## Install package from file
```bash
pip install -e <name>
```
