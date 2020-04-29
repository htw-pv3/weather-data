/*
Setup tables and import data from CSV

Dieses Skript erstellt alle notwendigen Datenbanktabellen und importiert die Daten aus den CSV-Dateien. 
Der Speicherort des Datenordners "pv3_data_2015" ist 'C:\data\pv3_data_2015\'

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- Weatherdata 2015
DROP TABLE IF EXISTS    pv3.htw_weatherdata_2015 CASCADE;
CREATE TABLE            pv3.htw_weatherdata_2015 (
    "timestamp"     timestamp without time zone NOT NULL,
    g_hor_cmp6      integer,
    g_hor_si        double precision,
    g_gen_cmp11     double precision,
    g_gen_si        integer,
    ev_beleuchtung  double precision,
    v_wind          double precision,
    d_wind          integer,
    t_luft          double precision,
    h_luft          double precision,
    p_luft          double precision,
    i_niederschlag  double precision,
    CONSTRAINT htw_weatherdata_2015_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.htw_weatherdata_2015 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','htw_weatherdata_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.htw_weatherdata_2015 FROM 'C:\data\pv3_data_2015\htw_wetter_weatherdata_2015.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','htw_weatherdata_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- WR 1
DROP TABLE IF EXISTS    pv3.einleuchtend_wrdata_2015_wr1 CASCADE;
CREATE TABLE            pv3.einleuchtend_wrdata_2015_wr1 (
    "timestamp"     timestamp without time zone NOT NULL,
    wrnref          varchar(3),
    u_pv            double precision,
    i_pv            double precision,
    p_dc            double precision,
    f               double precision,
    u_ac            double precision,
    i_ac            double precision,
    p_ac            double precision,
    e_delta_wr      double precision,
    e_delta_z       double precision,
    e_total_wr      double precision,
    e_total_z       double precision,
    eta_wr          double precision,
    t_wr            double precision,
    t_pv            double precision,
    r_iso           double precision,
    time_total      double precision,
    time_feedin     double precision,
    status          double precision,
    fehler          double precision,
    istberechnet    double precision,
    pr              double precision,
    CONSTRAINT einleuchtend_wrdata_2015_wr1_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.einleuchtend_wrdata_2015_wr1 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','einleuchtend_wrdata_2015_wr1','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.einleuchtend_wrdata_2015_wr1 FROM 'C:\data\pv3_data_2015\einleuchtend_wrdata_2015_wr1.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','einleuchtend_wrdata_2015_wr1','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- WR 2
DROP TABLE IF EXISTS    pv3.einleuchtend_wrdata_2015_wr2 CASCADE;
CREATE TABLE            pv3.einleuchtend_wrdata_2015_wr2 (
    "timestamp"     timestamp without time zone NOT NULL,
    wrnref          varchar(3),
    u_pv            double precision,
    i_pv            double precision,
    p_dc            double precision,
    f               double precision,
    u_ac            double precision,
    i_ac            double precision,
    p_ac            double precision,
    e_delta_wr      double precision,
    e_delta_z       double precision,
    e_total_wr      double precision,
    e_total_z       double precision,
    eta_wr          double precision,
    t_wr            double precision,
    t_pv            double precision,
    r_iso           double precision,
    time_total      double precision,
    time_feedin     double precision,
    status          double precision,
    fehler          double precision,
    istberechnet    double precision,
    pr              double precision,
    CONSTRAINT einleuchtend_wrdata_2015_wr2_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.einleuchtend_wrdata_2015_wr2 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','einleuchtend_wrdata_2015_wr2','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.einleuchtend_wrdata_2015_wr2 FROM 'C:\data\pv3_data_2015\einleuchtend_wrdata_2015_wr2.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','einleuchtend_wrdata_2015_wr2','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- WR 3
DROP TABLE IF EXISTS    pv3.einleuchtend_wrdata_2015_wr3 CASCADE;
CREATE TABLE            pv3.einleuchtend_wrdata_2015_wr3 (
    "timestamp"     timestamp without time zone NOT NULL,
    wrnref          varchar(3),
    u_pv            double precision,
    i_pv            double precision,
    p_dc            double precision,
    f               double precision,
    u_ac            double precision,
    i_ac            double precision,
    p_ac            double precision,
    e_delta_wr      double precision,
    e_delta_z       double precision,
    e_total_wr      double precision,
    e_total_z       double precision,
    eta_wr          double precision,
    t_wr            double precision,
    t_pv            double precision,
    r_iso           double precision,
    time_total      double precision,
    time_feedin     double precision,
    status          double precision,
    fehler          double precision,
    istberechnet    double precision,
    pr              double precision,
    CONSTRAINT einleuchtend_wrdata_2015_wr3_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.einleuchtend_wrdata_2015_wr3 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','einleuchtend_wrdata_2015_wr3','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.einleuchtend_wrdata_2015_wr3 FROM 'C:\data\pv3_data_2015\einleuchtend_wrdata_2015_wr3.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','einleuchtend_wrdata_2015_wr3','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- WR 4
DROP TABLE IF EXISTS    pv3.einleuchtend_wrdata_2015_wr4 CASCADE;
CREATE TABLE            pv3.einleuchtend_wrdata_2015_wr4 (
    "timestamp"     timestamp without time zone NOT NULL,
    wrnref          varchar(3),
    u_pv            double precision,
    i_pv            double precision,
    p_dc            double precision,
    f               double precision,
    u_ac            double precision,
    i_ac            double precision,
    p_ac            double precision,
    e_delta_wr      double precision,
    e_delta_z       double precision,
    e_total_wr      double precision,
    e_total_z       double precision,
    eta_wr          double precision,
    t_wr            double precision,
    t_pv            double precision,
    r_iso           double precision,
    time_total      double precision,
    time_feedin     double precision,
    status          double precision,
    fehler          double precision,
    istberechnet    double precision,
    pr              double precision,
    CONSTRAINT einleuchtend_wrdata_2015_wr4_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.einleuchtend_wrdata_2015_wr4 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','einleuchtend_wrdata_2015_wr4','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.einleuchtend_wrdata_2015_wr4 FROM 'C:\data\pv3_data_2015\einleuchtend_wrdata_2015_wr4.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','einleuchtend_wrdata_2015_wr4','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- WR 5
DROP TABLE IF EXISTS    pv3.einleuchtend_wrdata_2015_wr5 CASCADE;
CREATE TABLE            pv3.einleuchtend_wrdata_2015_wr5 (
    "timestamp"     timestamp without time zone NOT NULL,
    wrnref          varchar(3),
    u_pv            double precision,
    i_pv            double precision,
    p_dc            double precision,
    f               double precision,
    u_ac            double precision,
    i_ac            double precision,
    p_ac            double precision,
    e_delta_wr      double precision,
    e_delta_z       double precision,
    e_total_wr      double precision,
    e_total_z       double precision,
    eta_wr          double precision,
    t_wr            double precision,
    t_pv            double precision,
    r_iso           double precision,
    time_total      double precision,
    time_feedin     double precision,
    status          double precision,
    fehler          double precision,
    istberechnet    double precision,
    pr              double precision,
    CONSTRAINT einleuchtend_wrdata_2015_wr5_pkey PRIMARY KEY (timestamp) );

-- Metadata
COMMENT ON TABLE pv3.einleuchtend_wrdata_2015_wr5 IS '{
    "metadata": "ToDo"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','einleuchtend_wrdata_2015_wr5','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.einleuchtend_wrdata_2015_wr5 FROM 'C:\data\pv3_data_2015\einleuchtend_wrdata_2015_wr5.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','einleuchtend_wrdata_2015_wr5','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- Time
DROP TABLE IF EXISTS    pv3.time_2015 CASCADE;
CREATE TABLE            pv3.time_2015 (
    "timestamp"     timestamp without time zone PRIMARY KEY,
    "date"          date,
    "time"          time without time zone);

-- Metadata
COMMENT ON TABLE pv3.time_2015 IS '{
    "title": "HTW Wetterstation - Timeseries 2015",
    "description": "Complete timeseries for the year 2015",
    "language": [ "eng", "ger" ],
    "spatial": 
        {"location": "Berlin",
        "extent": "none",
        "resolution": "none"},
    "temporal": 
        {"reference_date": "2015",
        "start": "2015-01-01",
        "end": "2015-12-31",
        "resolution": "minute"},
    "sources": [
        {"name": "HTW Wetterstation",
        "description": "Wetterstation der Hochschule für Technik und Wirtschaft Berlin (HTW Berlin)",
        "url": "http://wetter.htw-berlin.de",
        "license": "none",
        "copyright": "© 2017 - wetter.htw-berlin.de"} ],
    "license": 
        {"id": "none",
        "name": "none",
        "version": "none",
        "url": "none",
        "instruction": "none",
        "copyright": "none"},
    "contributors": [
        {"name": "Ludwig Hülk", "email": "none", "date": "2016-05-04", "comment": "Download data from webserver"},
        {"name": "Ludwig Hülk", "email": "none", "date": "2017-06-14", "comment": "Create metadata"},
        {"name": "Ludwig Hülk", "email": "none", "date": "2018-06-17", "comment": "Update metadata"} ],
    "resources": [
        {"name": "pv3.time_2015",
        "format": "PostgreSQL",
        "fields": [
            {"name": "timestamp", "description": "YYYY-MM-DD hh:mm:ss", "unit": "none"},
            {"name": "date", "description": "YYYY-MM-DD", "unit": "none"},
            {"name": "time", "description": "hh:mm:ss", "unit": "none"} ] } ],
    "metadata_version": "1.3"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','time_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.time_2015 FROM 'C:\data\pv3_data_2015\htw_wetter_time_2015.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','time_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');


-- Sun
DROP TABLE IF EXISTS    pv3.sun_2015 CASCADE;
CREATE TABLE            pv3.sun_2015 (
    date        date PRIMARY KEY,
    sunrise     time without time zone,
    sunset      time without time zone);

-- Metadata
COMMENT ON TABLE pv3.sun_2015 IS '{
    "title": "HTW Wetterstation - Sunrise and Sunset 2015",
    "description": "Times of sunrise and sunset times for the year 2015",
    "language": [ "eng", "ger" ],
    "spatial": 
        {"location": "Berlin",
        "extent": "none",
        "resolution": "none"},
    "temporal": 
        {"reference_date": "2015",
        "start": "2015-01-01",
        "end": "2015-12-31",
        "resolution": "day"},
    "sources": [
        {"name": "HTW Wetterstation",
        "description": "Wetterstation der Hochschule für Technik und Wirtschaft Berlin (HTW Berlin)",
        "url": "http://wetter.htw-berlin.de",
        "license": "none",
        "copyright": "© 2017 - wetter.htw-berlin.de"} ],
    "license": 
        {"id": "none",
        "name": "none",
        "version": "none",
        "url": "none",
        "instruction": "none",
        "copyright": "none"},
    "contributors": [
        {"name": "Ludwig Hülk", "email": "none", "date": "2016-05-04", "comment": "Download data from webserver"},
        {"name": "Ludwig Hülk", "email": "none", "date": "2017-06-14", "comment": "Create metadata"},
        {"name": "Ludwig Hülk", "email": "none", "date": "2018-06-17", "comment": "Update metadata"} ],
    "resources": [
        {"name": "pv3.sun_2015",
        "format": "PostgreSQL",
        "fields": [
            {"name": "date", "description": "DD.MM.YYYY", "unit": "none"},
            {"name": "sunrise", "description": "hh:mm:ss", "unit": "none"},
            {"name": "sunset", "description": "hh:mm:ss", "unit": "none"} ] } ],
    "metadata_version": "1.3"}';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','sun_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Setup table');

-- Import data
COPY pv3.sun_2015 FROM 'C:\data\pv3_data_2015\htw_wetter_sun_2015.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','import','pv3','sun_2015','htw_pv3_postgresql_5_setup_tables_and_import_data.sql','Import data from CSV');

-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 16;
