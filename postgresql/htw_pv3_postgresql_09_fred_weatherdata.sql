/*
Import open_FRED weatherdata


__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- open_FRED Weatherdata 2015
DROP TABLE IF EXISTS    pv3.openfred_weatherdata_2015_htw CASCADE;
CREATE TABLE            pv3.openfred_weatherdata_2015_htw (
    "timestamp"     timestamp NOT NULL,
    lat             double precision,
    lon             double precision,
    wind_speed      double precision,
    temp_air        double precision,
    dhi             double precision,
    dirhi           double precision,
    dni             double precision,
    p               double precision,
    ghi             double precision,
    CONSTRAINT openfred_weatherdata_2015_htw_pkey PRIMARY KEY (timestamp) );

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v1','setup','pv3','openfred_weatherdata_2015_htw','htw_pv3_postgresql_09_fred_weatherdata.sql','Setup table');

-- Metadata
COMMENT ON TABLE pv3.openfred_weatherdata_2015_htw IS '{
    "name": "openfred_series",
    "title": "coastDat3_COSMO-CLM_MERRA2 - open_FRED Weatherdata",
    "id": "https://openenergy-platform.org/dataedit/view/climate/openfred_series",
    "description": "This is an atmospheric hindcast for Western Europe and the North Atlantic using COSMO-CLM version 5.0 with spectral nudging from 2002-2017. MERRA2 reanalysis data are used as forcing. Additionally transient and monthly aerosol data of the MACv2 climatology are prescribed. The model uses a rotated grid with 566 x 481 grid points and a grid point distance of 0.0625 degrees, the rotated North pole is located at 162.0 W, 39.25 N. The published data excludes the sponge zone and have 526 x 441 grid points. In rotated coordinates the published simulation data extends from 22.64 W to 10.18 E, 11.2 S to 16.3 N, in geographical coordinates this corresponds to about 12 W to 30 E, 39 N to 60 N.",
    "language": [
        "en-GB",
        "de-DE"
    ],
    "keywords": [
        "COSMO-CLM",
        "hindcast",
        "MERRA2",
        "Open Data",
        "regional modelling",
        "renewable energy"
    ],
    "publicationDate": "2020-02-06",
    "context": {
        "homepage": "https://reiner-lemoine-institut.de/open_fred-open-feed-time-series-based-renewable-energy-database/",
        "documentation": null,
        "sourceCode": "https://github.com/open-fred",
        "contact": "ronny.petrik@hzg.de",
        "grantNo": "0324006A-C",
        "fundingAgency": "Bundesministerium für Wirtschaft und Energie (BMWi)",
        "fundingAgencyLogo": null,
        "publisherLogo": null
    },
    "spatial": {
        "location": "52.46911239624024° N, 13.56728458404541° O",
        "extent": null,
        "resolution": "0.0625° (~6.6 km)"
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01",
            "end": "2015-31-12",
            "resolution": "30 minutes",
            "alignment": null,
            "aggregationType": null
        }
    },
    "sources": [
        {
            "title": "MERRA2",
            "description": "Modern-Era Retrospective analysis for Research and Applications, Version 2",
            "path": "https://gmao.gsfc.nasa.gov/reanalysis/MERRA-2/data_access/",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "noaa_globe",
            "description": "Global Land One-km Base Elevation Project (GLOBE)",
            "path": "http://www.ngdc.noaa.gov/mgg/topo/globe.html",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "ecjrc_glc2000",
            "description": "Global Land Cover 2000",
            "path": "http://www.ngdc.noaa.gov/mgg/topo/globe.html",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "nasa_aerosols",
            "description": "GACP aerosol optical thickness and Angstrom exponent dataset",
            "path": "https://gacp.giss.nasa.gov/data/time_ser/",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "gldb",
            "description": "Global Lake Database (GLDB)",
            "path": "https://www.adv-sci-res.net/16/57/2019/",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "copernicus_clc",
            "description": "Copernicus Land Monitoring Services - CORINE Land Cover (CLC) - CLC 2012",
            "path": "https://land.copernicus.eu/pan-european/corine-land-cover/clc-2012?tab=download",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "fao_hwsd",
            "description": "Harmonised World Soil Database",
            "path": "http://www.fao.org/soils-portal/soil-survey/soil-maps-and-databases/harmonized-world-soil-database-v12/en/",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        },
        {
            "title": "modis_albedo",
            "description": "Filled Land Surface Albedo Product",
            "path": "https://www.umb.edu/spectralmass/terra_aqua_modis/modis_brdf_albedo_product_mcd43",
            "licenses": [
                {
                    "name": null,
                    "title": null,
                    "path": null,
                    "instruction": null,
                    "attribution": null
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "ODC-By-1.0",
            "title": "Open Data Commons Attribution License v1.0",
            "path": "https://opendatacommons.org/licenses/by/1.0/",
            "instruction": "https://opendatacommons.org/licenses/by/summary/index.html",
            "attribution": "© Helmholtz-Zentrum Geesthacht"
        }
    ],
    "contributors": [
        {
            "title": "Ludee",
            "email": "Ludwig.Huelk@rl-institut.de",
            "date": "2020-02-06",
            "object": "metadata",
            "comment": "Create metadata"
        },
        {
            "title": "Jonas Huber",
            "email": "Jonas.Huber@rl-institut.de",
            "date": "2020-02-06",
            "object": "metadata",
            "comment": "Update metadata"
        },
        {
            "title": "Ludee",
            "email": "Ludwig.Huelk@rl-institut.de",
            "date": "2020-02-19",
            "object": "metadata",
            "comment": "Update license information"
        },
        {
            "title": "Ludee",
            "email": "Ludwig.Huelk@rl-institut.de",
            "date": "2020-04-30",
            "object": "metadata",
            "comment": "Update metadata information"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "climate.openfred_series",
            "path": "https://openenergy-platform.org/dataedit/view/climate/openfred_series",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
                    {
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": null
                    },
                    {
                        "name": "lat",
                        "description": "Latitude",
                        "type": "double precision",
                        "unit": "°"
                    },
                    {
                        "name": "lon",
                        "description": "Longitude",
                        "type": "double precision",
                        "unit": "°"
                    },
                    {
                        "name": "wind_speed",
                        "description": "Wind speed",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "temp_air",
                        "description": "Air temperature",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "dhi",
                        "description": "tbd",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "dirhi",
                        "description": "tbd",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "dni",
                        "description": "tbd",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "p",
                        "description": "air_pressure",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "ghi",
                        "description": "tbd",
                        "type": "double precision",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "id"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            "timespan_id"
                        ],
                        "reference": {
                            "resource": "climate.openfred_timespans",
                            "fields": [
                                "id"
                            ]
                        }
                    },
                    {
                        "fields": [
                            "location_id"
                        ],
                        "reference": {
                            "resource": "climate.openfred_locations",
                            "fields": [
                                "id"
                            ]
                        }
                    },
                    {
                        "fields": [
                            "variable_id"
                        ],
                        "reference": {
                            "resource": "climate.openfred_variables",
                            "fields": [
                                "id"
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": null,
                "decimalSeparator": "."
            }
        }
    ],
    "review": {
        "path": "https://github.com/OpenEnergyPlatform/data-preprocessing/issues/47",
        "badge": "Gold"
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.1",
        "metadataLicense": {
            "name": "CC0-1.0",
            "title": "Creative Commons Zero v1.0 Universal",
            "path": "https://creativecommons.org/publicdomain/zero/1.0/"
        }
    },
    "_comment": {
        "metadata": "Metadata documentation and explanation (https://github.com/OpenEnergyPlatform/organisation/wiki/metadata)",
        "dates": "Dates and time must follow the ISO8601 including time zone (YYYY-MM-DD or YYYY-MM-DDThh:mm:ss±hh)",
        "units": "Use a space between numbers and units (100 m)",
        "languages": "Languages must follow the IETF (BCP47) format (en-GB, en-US, de-DE)",
        "licenses": "License name must follow the SPDX License List (https://spdx.org/licenses/)",
        "review": "Following the OEP Data Review (https://github.com/OpenEnergyPlatform/data-preprocessing/wiki)",
        "null": "If not applicable use (null)"
    }
}';

-- Import data
COPY pv3.openfred_weatherdata_2015_htw FROM 'C:\data\pv3_data_2015\openfred_weatherdata_2015_htw.csv' DELIMITER ',' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v1','import','pv3','openfred_weatherdata_2015_htw','htw_pv3_postgresql_09_fred_weatherdata.sql','Import data');

-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 2;
