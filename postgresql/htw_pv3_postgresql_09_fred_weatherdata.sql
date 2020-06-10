/*
MA3 open_FRED weatherdata


__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- open_FRED Weatherdata 2015
DROP TABLE IF EXISTS    pv3.fred_weatherdata_2015 CASCADE;
CREATE TABLE            pv3.fred_weatherdata_2015 (
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
    CONSTRAINT fred_weatherdata_2015_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.fred_weatherdata_2015 IS '{
    "title": "open_FRED Weatherdata 2015",
    "description": "Weatherdata for 2015 for weather cell HTW",
    "language": [ "eng" ],
    "sources": [
        {"name": "open_FRED", 
        "description": "", 
        "url": "https://reiner-lemoine-institut.de/open_fred-open-feed-time-series-based-renewable-energy-database/",
        "license": "tba", 
        "copyright": "tba"} ],
    "spatial": [
        {"location": "52.46911239624024° N, 13.56728458404541° O",
        "extent": "none",
        "resolution": "none"} ],
    "temporal": [
        {"reference_date": "2015",
        "start": "2015-01-01",
        "end": "2015-31-12",
        "resolution": "30 minutes"} ],
    "license": [
        {"id": "none",
        "name": "none",
        "version": "none",
        "url": "none",
        "instruction": "none",
        "copyright": "tba"} ],
    "contributors": [
        {"name": "Ludwig Hülk", "email": "none", "date": "2018-06-27", "comment": "Create metadata"} ],
    "resources": [
        {"name": "pv3.fred_weatherdata_2015",
        "format": "PostgreSQL",
        "fields": [
        {"name": "timestamp", "description": "Timestamp without time zone", "unit": "none" },
        {"name": "lat", "description": "", "unit": ""},
        {"name": "lon", "description": "", "unit": ""},
        {"name": "wind_speed", "description": "", "unit": ""},
        {"name": "temp_air", "description": "", "unit": ""},
        {"name": "dhi", "description": "", "unit": ""},
        {"name": "dirhi", "description": "", "unit": ""},
        {"name": "dni", "description": "", "unit": ""},
        {"name": "p", "description": "", "unit": ""},
        {"name": "ghi", "description": "", "unit": ""} ] }],
    "metadata_version": "1.3"}';

-- Import data
COPY pv3.fred_weatherdata_2015 FROM 'C:\data\pv3_data_2015\fred_data_2015_htw.csv' DELIMITER ',' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','fred_weatherdata_2015','htw_pv3_postgresql_09_fred_weatherdata.sql','Setup table');

-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 1;
