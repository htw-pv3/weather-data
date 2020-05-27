/*
Data analysis and data gaps

Zu beantwortende Fragen:
-- Anzahl der fehlenden Daten (Lücken) in den Wetter- und WR-Daten
0. Anzahl Soll-Messwerte
1. Anzahl Lücken in Wetterdaten (gesamt)
2. Anzahl Lücken in WR-Daten (gesamt)
3. Anzahl Lücken in Wetterdaten und WR-Daten
4. Anzahl Lücken in Wetterdaten (zusammenhängend)
5. Anzahl Lücken in WR-Daten (zusammenhängend)
6. Anzahl Lücken in Wetterdaten am Tag
7. Anzahl Lücken in WR-Daten am Tag
8. Anzahl Lücken in Wetterdaten und WR-Daten
9. Anzahl Lücken in Wetterdaten und WR-Daten am Tag

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- Lücken in Wetterdaten
DROP VIEW IF EXISTS pv3.pv3_gaps_weather_view CASCADE;
CREATE VIEW         pv3.pv3_gaps_weather_view AS
    SELECT *
    FROM pv3.pv3_time_sun_weather_2015_mview
    WHERE g_hor_si IS NULL
    ORDER BY t_timestamp;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_gaps_weather_view','htw_pv3_postgresql_7_data_analysis.sql','Wetterlücken');


-- Anzahl der Lücken in Wetterdaten
DROP VIEW IF EXISTS pv3.pv3_gaps_count_weather_view CASCADE;
CREATE VIEW         pv3.pv3_gaps_count_weather_view AS
    SELECT  'weather' AS name,
            COUNT(*) AS count
    FROM pv3.pv3_time_sun_weather_2015_mview
    WHERE g_hor_si IS NULL;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_gaps_count_weather_view','htw_pv3_postgresql_7_data_analysis.sql','Anzahl Wetterlücken');


-- Anzahl der Lücken in WR-Daten
DROP VIEW IF EXISTS pv3.pv3_gaps_count_wr_view CASCADE;
CREATE VIEW         pv3.pv3_gaps_count_wr_view AS
    SELECT  'WR1' AS wrnref,
            COUNT(*) AS count
    FROM pv3.pv3_time_sun_weather_wr1_2015_mview
    WHERE wrnref IS NULL

    UNION ALL
    SELECT  'WR2' AS wrnref,
            COUNT(*) AS count
    FROM pv3.pv3_time_sun_weather_wr2_2015_mview
    WHERE wrnref IS NULL

    UNION ALL
    
    ;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_gaps_count_wr_view','htw_pv3_postgresql_7_data_analysis.sql','Anzahl WR-Lücken');



-- Tabelle für zusammenhängende Lücken
DROP TABLE IF EXISTS pv3.pv3_related_gaps CASCADE;
CREATE TABLE         pv3.pv3_related_gaps (
    id          serial PRIMARY KEY,
    dataset     text,
    gap_count   integer,
    date        date,
    ts_start    timestamp,
    ts_end      timestamp,
    sunrise     time without time zone,
    sunset      time without time zone,
    during_day  text);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v1','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Table for related gaps');


-- Zusammenhängende Lücken in Wetterdaten
INSERT INTO pv3.pv3_related_gaps (dataset,gap_count,date,ts_start,ts_end)
    WITH    gap_weather(timestamp) AS (
                SELECT t_timestamp, date
                FROM pv3.pv3_time_sun_weather_2015_mview 
                WHERE   g_hor_cmp6 IS NULL
                        OR g_hor_si IS NULL
                        OR g_gen_cmp11 IS NULL
                        OR g_gen_si IS NULL),
            group_weather AS (
                SELECT 
                    timestamp,
                    date,
                    ROW_NUMBER() OVER (ORDER BY timestamp) AS rn,
                    (timestamp - (ROW_NUMBER() OVER (ORDER BY timestamp) * interval '1 minute')) AS grp 
                FROM gap_weather)
    SELECT
        'weather' AS dataset,
        COUNT(*) AS gap_cnt,
        date AS date,
        MIN(timestamp) AS ts_start,
        MAX(timestamp) AS ts_end
    FROM group_weather
    GROUP BY grp, date
    ORDER BY ts_start ASC;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Zusammenhängende Lücken in Wetterdaten');


-- Zusammenhängende Lücken in WR-Data
INSERT INTO pv3.pv3_related_gaps (dataset,gap_count,date,ts_start,ts_end)
    WITH    gap_wr(timestamp) AS (
                SELECT timestamp, date
                FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
                WHERE wr1_wrnref IS NULL),
            group_wr AS (
                SELECT 
                    timestamp,
                    date,
                    ROW_NUMBER() OVER (ORDER BY timestamp) AS rn,
                    (timestamp - (ROW_NUMBER() OVER (ORDER BY timestamp) * interval '1 minute'))  AS grp
                FROM gap_wr)
    SELECT
        'wr' AS dataset,
        COUNT(*) AS gap_cnt,
        date AS date,
        MIN(timestamp) AS ts_start,
        MAX(timestamp) AS ts_end
    FROM group_wr
    GROUP BY grp, date
    ORDER BY ts_start ASC;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Zusammenhängende Lücken in WR-Daten');


-- Zusammenhängende Lücken in Wetterdaten und WR-Data
INSERT INTO pv3.pv3_related_gaps (dataset,gap_count,date,ts_start,ts_end)
    WITH    gap_data_day(timestamp) AS (
                SELECT timestamp, date
                FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
                WHERE g_hor_si IS NULL
                    AND wr1_wrnref IS NULL),
            group_data_day AS (
                SELECT 
                    timestamp,
                    date,
                    ROW_NUMBER() OVER (ORDER BY timestamp) AS rn,
                    (timestamp - (ROW_NUMBER() OVER (ORDER BY timestamp) * interval '1 minute'))  AS grp
                FROM gap_data_day)
    SELECT
        'weather and wr' AS dataset,
        COUNT(*) AS gap_cnt,
        date AS date,
        MIN(timestamp) AS ts_start,
        MAX(timestamp) AS ts_end
    FROM group_data_day
    GROUP BY grp, date
    ORDER BY ts_start ASC;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Zusammenhängende Lücken in Wetterdaten und WR-Daten');


-- Zusammenhängende Lücken in Wetterdaten und WR-Data am Tag
INSERT INTO pv3.pv3_related_gaps (dataset,gap_count,date,ts_start,ts_end)
    WITH    gap_data_day(timestamp) AS (
                SELECT timestamp, date
                FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
                WHERE 
                
                ,
            group_data_day AS (
                SELECT 
                    timestamp,
                    date,
                    ROW_NUMBER() OVER (ORDER BY timestamp) AS rn,
                    (timestamp - (ROW_NUMBER() OVER (ORDER BY timestamp) * interval '1 minute'))  AS grp
                FROM gap_data_day)
    SELECT
        'weather and wr at daytime' AS dataset,
        COUNT(*) AS gap_cnt,
        date AS date,
        MIN(timestamp) AS ts_start,
        MAX(timestamp) AS ts_end
    FROM group_data_day
    GROUP BY grp, date
    ORDER BY ts_start ASC;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Zusammenhängende Lücken in Wetterdaten und WR-Daten am Tag');


-- Gap am Tag oder Nacht
UPDATE pv3.pv3_related_gaps AS g
    SET     sunrise = s.sunrise,
            sunset = s.sunset
    FROM    pv3.sun_2015 AS s
    WHERE   g.date = s.date;

UPDATE pv3.pv3_related_gaps AS g
    SET     during_day = CASE
        WHEN ts_start::time < sunrise OR ts_end::time > sunset THEN 'FALSE'
        ELSE 'TRUE'
        END;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Zusammenhängende Lücken am Tag');


-- Export Result
COPY (SELECT * FROM pv3.pv3_related_gaps ORDER BY id) TO 'C:\data\pv3_data_2015\calculation\pv3_related_gaps.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v3','output','pv3','pv3_related_gaps','htw_pv3_postgresql_7_data_analysis.sql','Find gaps');



-- Questions & Answers
DROP MATERIALIZED VIEW IF EXISTS pv3.data_analysis_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.data_analysis_mview AS
    SELECT 
        0 AS id,
        'Anzahl Soll-Messwerte' AS question,
        'SELECT count(*) FROM pv3.pv3_time_sun_weather_allwr_2015_mview' AS query,
        sub.cnt AS solution
    FROM (
        SELECT count(*) AS cnt 
        FROM pv3.pv3_time_sun_weather_allwr_2015_mview) AS sub

UNION ALL
    SELECT 
        1 AS id,
        'Anzahl Lücken in Wetterdaten (gesamt)' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        2 AS id,
        'Anzahl Lücken in WR-Daten (gesamt)' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        3 AS id,
        'Anzahl Lücken in Wetterdaten und WR-Daten' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        4 AS id,
        'Anzahl Lücken in Wetterdaten (zusammenhängend)' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt
          FROM pv3.pv3_related_gaps
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        5 AS id,
        'Anzahl Lücken in WR-Daten (zusammenhängend)' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt
          FROM pv3.pv3_related_gaps
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        6 AS id,
        'Anzahl Lücken in Wetterdaten am Tag' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview
          WHERE 
          AS sub

UNION ALL
    SELECT 
        7 AS id,
        'Anzahl Lücken in WR-Daten am Tag' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE 
          AS sub

UNION ALL
    SELECT 
        8 AS id,
        'Anzahl Lücken in Wetterdaten und WR-Daten' AS question,
        'SELECT ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE 
          ) AS sub

UNION ALL
    SELECT 
        9 AS id,
        'Anzahl Lücken in Wetterdaten und WR-Daten am Tag' AS question,
        'SELECT count(*) FROM ' AS query,
        sub.cnt AS solution
    FROM (SELECT count(*) AS cnt 
          FROM pv3.pv3_time_sun_weather_allwr_2015_mview 
          WHERE ) AS sub;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','data_analysis_mview','htw_pv3_postgresql_7_data_analysis.sql','Answer questions');

-- export
SELECT * FROM pv3.data_analysis_mview;
COPY (SELECT * FROM pv3.data_analysis_mview ORDER BY id) TO 'C:\data\pv3_data_2015\calculation\data_analysis_mview.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';


-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 11;
