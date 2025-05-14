/*
SQL query examples

Create a table with different time stamps formats.
Needs schema ma3 from file 03_schema_setup!

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- Testtabelle mit den verschiedenen Timestamp-Formaten
DROP TABLE IF EXISTS    pv3.timestamp_test CASCADE;
CREATE TABLE            pv3.timestamp_test (
    id          integer PRIMARY KEY,
    year        integer,
    value       double precision,
    timestamp1  timestamp without time zone,
    timestamp2  timestamp with time zone,
    timestamp3  timestamp,
    timestamp4  time without time zone,
    timestamp5  time with time zone,
    comment     text );

-- Erzeuge Beispieldaten
INSERT INTO pv3.timestamp_test VALUES (
    1,
    2017,
    0,
    now(),
    now(),
    now(),
    now(),
    now(),
    'now');

-- Zeige alle Daten an
SELECT      *
FROM        pv3.timestamp_test
ORDER BY id;

-- Erzeuge weitere Beispieldaten
INSERT INTO pv3.timestamp_test (id,year,value,timestamp1,comment)VALUES (
    2,
    2017,
    5,
    now(),
    'now');

-- Verändere Daten
UPDATE pv3.timestamp_test
    SET value = 3
    WHERE id = 1;

-- metadata
COMMENT ON TABLE pv3.timestamp_test IS '{
    "title": "Timestamp test table",
    "description": "Table with different timestamp formats",
    "language": [ "eng" ],
    "sources": [
        {"name": "none", "description": "none", "url": "none", "license": "none", "copyright": "none"} ],
    "spatial": [
        {"location": "52.455778° N, 13.523917° O",
        "extent": "none",
        "resolution": "none"} ],
    "temporal": [
        {"reference_date": "none",
        "start": "2015-01-01",
        "end": "2015-31-12",
        "resolution": "minute"} ],
    "license": [
        {"id": "none",
        "name": "none",
        "version": "none",
        "url": "none",
        "instruction": "none",
        "copyright": "none"} ],
    "contributors": [
        {"name": "Ludee", "email": "none", "date": "2017-06-14", "comment": "Create metadata"},
        {"name": "Ludee", "email": "none", "date": "2018-05-02", "comment": "Update metadata"} ],
    "resources": [
        {"name": "pv3.timestamp_test",
        "format": "PostgreSQL",
        "fields": [
            {"name": "id", "description": "Unique identifier", "unit": "none" },
            {"name": "year", "description": "Reference year", "unit": "none" },
            {"name": "value", "description": "Example value", "unit": "none" },
            {"name": "timestamp1", "description": "Timestamp without time zone", "unit": "none" },
            {"name": "timestamp2", "description": "Timestamp with time zone,", "unit": "none" },
            {"name": "timestamp3", "description": "Timestamp,", "unit": "none" },
            {"name": "timestamp4", "description": "Time without time zone,", "unit": "none" },
            {"name": "timestamp5", "description": "Time with time zone,", "unit": "none" },
            {"name": "comment", "description": "Comment", "unit": "none" }] }],
    "metadata_version": "1.3"}';
