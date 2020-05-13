# Openmod visualisation tutorial

Authors: Bryn Pickering, Stefan Pfenninger

License: MIT

## About

A tutorial on how to visualise data with Python, consisting of three Jupyter Notebooks:

* [01-matplotlib.ipynb](01-matplotlib.ipynb) shows how to use matplotlib, the workhorse of plotting in Python, together with pandas and seaborn.
* [01-matplotlib-exercise.ipynb](01-matplotlib-exercise.ipynb) contains a single exercise on the basics of matplotlib, intended to cover the first half of the `01-matplotlib.ipynb` notebook.
* [02-web-based.ipynb](02-web-based.ipynb) introduces Plotly and Bokeh, modern web-based libraries which make it very easy to create interactive visualisations.
* [03-touching-up.ipynb](03-touching-up.ipynb) shows how to save vector graphics from matplotlib, Plotly or Bokeh for final touching up in a separate tool, for example the free and open-source [Inkscape](http://inkscape.org/).
* [04-maps.ipynb](04-maps.ipynb) shows some ways to plot maps.

## Setup

### 1. Install the Anaconda Python distribution

Download the Anaconda Python distribution and run the downloaded installer:

https://www.anaconda.com/download/

Make sure you download the Python 3 version.

### 2. Create an environment

Once Anaconda is installed, create a new conda environment with the required packages, by running the following command in a terminal (Linux or macOS) or a command-line window (Windows), making sure you run this command inside the directory containing our ``requirements.yml`` file:

```bash
conda env create -f requirements.yml
```

### 3. Ensure that you can successfully run a Jupyter Notebook

If you are unfamiliar with the Jupyter Notebook, have a look at [this quick start guide](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/index.html), in particular the section on [running the notebook](https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/execute.html).

__During the tutorial session we will not have time to solve installation problems, so make sure that you are able to run the Jupyter Notebook _before you arrive_.__

## Data

We are using data made available from the Open Power System Data project for this tutorial. These datasets can be found in the `data` subdirectory and are based on the following download links:

* [time_series_60min_singleindex.csv](https://data.open-power-system-data.org/index.php?package=time_series&version=2017-07-09&action=customDownload&resource=3&filter%5B_contentfilter_utc_timestamp%5D%5Bfrom%5D=2011-01-01&filter%5B_contentfilter_utc_timestamp%5D%5Bto%5D=2016-12-31&filter%5BRegion%5D%5B%5D=CZ&filter%5BRegion%5D%5B%5D=DE&filter%5BRegion%5D%5B%5D=DK&filter%5BRegion%5D%5B%5D=SE&filter%5BVariable%5D%5B%5D=solar&filter%5BVariable%5D%5B%5D=wind&filter%5BVariable%5D%5B%5D=wind_offshore&filter%5BVariable%5D%5B%5D=wind_onshore&filter%5BAttribute%5D%5B%5D=generation&downloadCSV=Download+CSV)
* [conventional_power_plants_DE.csv](http://data.open-power-system-data.org/conventional_power_plants/2017-03-03/conventional_power_plants_DE.csv)
* [conventional_power_plants_EU.csv](http://data.open-power-system-data.org/conventional_power_plants/2017-03-03/conventional_power_plants_EU.csv)

## Other libraries we don't cover here

* d3 (e.g. [mpld3](https://mpld3.github.io/))
* [airbnb superset](https://github.com/airbnb/superset)
* [vega](https://vega.github.io/vega/)
* [altair](https://altair-viz.github.io/)
