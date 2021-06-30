/*
Fill Gaps in weatherdata and WR-data

Auffüllen der Daten.
Grundlage ist der JOIN pv3.pv3_time_sun_weather_allwr_2015_mview

__copyright__   = "© Reiner Lemoine Institut"
__license__ = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__     = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__  = "Ludwig Hülk"
*/


-- Erstellung der Datenlücken-Methoden
DROP TABLE IF EXISTS    pv3.pv3_gap_method CASCADE; 
CREATE TABLE            pv3.pv3_gap_method (    
    id              integer PRIMARY KEY,
    name            text,
    beschreibung    text,
    kommentar       text);

INSERT INTO pv3.pv3_gap_method VALUES 
    (0, 'Null', '=0', 'NULL -> 0'),
    (1, 'Null', '=0', 'NULL bei Nacht -> 0'),
    (2, 'Durchschnitt', 'Den Mittelwert eintragen', 'Stündlich, 10 Minuten'),
    (3, 'Interpolation', 'Lineare Interpolation', ''),
    (4, 'Letzer Wert', 'Letzen Wert fortschreiben', ''),
    (5, 'Übertragung', 'Aus anderem Tag übertragen', ''),
    (6, 'Ausrechnen', 'Anhand anderer Parameter berechnen', '');

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v1','setup','pv3','pv3_gap_method','htw_pv3_postgresql_7_data_analysis.sql','Create table with fill methods');

-- Zeige alle Daten an
SELECT      *
FROM        pv3.pv3_gap_method
ORDER BY id;


-- Erstelle Tabelle zum Befüllen
DROP TABLE IF EXISTS pv3.pv3_weather_allwr_2015_filled CASCADE;
CREATE TABLE         pv3.pv3_weather_allwr_2015_filled AS
    SELECT  * 
    FROM    pv3.pv3_time_sun_weather_allwr_2015_mview
    ORDER BY timestamp;

ALTER TABLE pv3.pv3_weather_allwr_2015_filled
    ADD PRIMARY KEY (timestamp),
    ADD COLUMN "is_gap" BOOLEAN DEFAULT FALSE,
    ADD COLUMN "is_gap_weather" BOOLEAN DEFAULT FALSE,
    ADD COLUMN "is_gap_wr" BOOLEAN DEFAULT FALSE,
    ADD COLUMN "is_during_day" BOOLEAN,
    ADD COLUMN "gap_method" integer REFERENCES pv3.pv3_gap_method(id),
    ADD COLUMN "is_filled" BOOLEAN DEFAULT FALSE,
    ADD COLUMN "is_filled_weather" BOOLEAN DEFAULT FALSE,
    ADD COLUMN "is_filled_wr" BOOLEAN DEFAULT FALSE;


-- Suche Lücken

-- Lücke
UPDATE pv3.pv3_weather_allwr_2015_filled
    SET     is_gap = TRUE
    WHERE   g_hor_si IS NULL
            OR wr1_wrnref IS NULL;

-- Lücke in Wetterdaten
UPDATE pv3.pv3_weather_allwr_2015_filled
    SET     is_gap_weather = TRUE
    WHERE   g_hor_si IS NULL;

-- Lücke in WR-Daten
UPDATE pv3.pv3_weather_allwr_2015_filled
    SET     is_gap_wr = TRUE
    WHERE   wr1_wrnref IS NULL;

-- Lücke am Tag
UPDATE pv3.pv3_weather_allwr_2015_filled
    SET     is_during_day = CASE
        WHEN time::time < sunrise OR time::time > sunset THEN FALSE
        ELSE TRUE
        END;


-- Überprüfe Lücken
    SELECT  1 AS id, 'Lücken Gesamt' AS name,
            count(CASE WHEN is_gap THEN 1 END) AS cnt,
            count(CASE WHEN is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  2 AS id, 'Lücken Wetter' AS name,
            count(CASE WHEN is_gap_weather THEN 1 END) AS cnt,
            count(CASE WHEN is_filled_weather THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  3 AS id, 'Lücken WR' AS name,
            count(CASE WHEN is_gap_wr THEN 1 END) AS cnt,
            count(CASE WHEN is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  4 AS id, 'Minuten am Tag' AS name,
            count(CASE WHEN is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_during_day AND is_gap AND NOT is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  5 AS id, 'Lücken am Tag' AS name,
            count(CASE WHEN is_gap AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap AND is_during_day AND is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  6 AS id, 'Lücken am Tag (Wetter)' AS name,
            count(CASE WHEN is_gap_weather AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap_weather AND is_during_day AND is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  7 AS id, 'Lücken am Tag (WR)' AS name,
            count(CASE WHEN is_gap_wr AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap_wr AND is_during_day AND is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    ORDER BY id;

SELECT      gap_method, COUNT(gap_method)
FROM        pv3.pv3_weather_allwr_2015_filled
GROUP BY    gap_method;


-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','setup','pv3','pv3_weather_allwr_2015_filled','htw_pv3_postgresql_10_fill_gaps.sql','Setup Table');


-- WR
-- Fülle alle WR-Daten mit 0
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = 0,
        is_filled = TRUE,
        is_filled_wr = TRUE,
        wr1_wrnref = 0,
        wr1_u_pv = 0,
        wr1_i_pv = 0,
        wr1_p_dc = 0,
        wr1_f = 0,
        wr1_u_ac = 0,
        wr1_i_ac = 0,
        wr1_p_ac = 0,
        wr1_e_delta_wr = 0,
        wr1_e_delta_z = 0,
        wr1_e_total_wr = 0,
        wr1_e_total_z = 0,
        wr1_eta_wr = 0,
        wr1_t_wr = 0,
        wr1_t_pv = 0,
        wr1_r_iso = 0,
        wr1_time_total = 0,
        wr1_time_feedin = 0,
        wr1_status = 0,
        wr1_fehler = 0,
        wr1_istberechnet = 0,
        wr1_pr = 0,
        wr2_wrnref = 0,
        wr2_u_pv = 0,
        wr2_i_pv = 0,
        wr2_p_dc = 0,
        wr2_f = 0,
        wr2_u_ac = 0,
        wr2_i_ac = 0,
        wr2_p_ac = 0,
        wr2_e_delta_wr = 0,
        wr2_e_delta_z = 0,
        wr2_e_total_wr = 0,
        wr2_e_total_z = 0,
        wr2_eta_wr = 0,
        wr2_t_wr = 0,
        wr2_t_pv = 0,
        wr2_r_iso = 0,
        wr2_time_total = 0,
        wr2_time_feedin = 0,
        wr2_status = 0,
        wr2_fehler = 0,
        wr2_istberechnet = 0,
        wr2_pr = 0,
        wr3_wrnref = 0,
        wr3_u_pv = 0,
        wr3_i_pv = 0,
        wr3_p_dc = 0,
        wr3_f = 0,
        wr3_u_ac = 0,
        wr3_i_ac = 0,
        wr3_p_ac = 0,
        wr3_e_delta_wr = 0,
        wr3_e_delta_z = 0,
        wr3_e_total_wr = 0,
        wr3_e_total_z = 0,
        wr3_eta_wr = 0,
        wr3_t_wr = 0,
        wr3_t_pv = 0,
        wr3_r_iso = 0,
        wr3_time_total = 0,
        wr3_time_feedin = 0,
        wr3_status = 0,
        wr3_fehler = 0,
        wr3_istberechnet = 0,
        wr3_pr = 0,
        wr4_wrnref = 0,
        wr4_u_pv = 0,
        wr4_i_pv = 0,
        wr4_p_dc = 0,
        wr4_f = 0,
        wr4_u_ac = 0,
        wr4_i_ac = 0,
        wr4_p_ac = 0,
        wr4_e_delta_wr = 0,
        wr4_e_delta_z = 0,
        wr4_e_total_wr = 0,
        wr4_e_total_z = 0,
        wr4_eta_wr = 0,
        wr4_t_wr = 0,
        wr4_t_pv = 0,
        wr4_r_iso = 0,
        wr4_time_total = 0,
        wr4_time_feedin = 0,
        wr4_status = 0,
        wr4_fehler = 0,
        wr4_istberechnet = 0,
        wr4_pr = 0,
        wr5_wrnref = 0,
        wr5_u_pv = 0,
        wr5_i_pv = 0,
        wr5_p_dc = 0,
        wr5_f = 0,
        wr5_u_ac = 0,
        wr5_i_ac = 0,
        wr5_p_ac = 0,
        wr5_e_delta_wr = 0,
        wr5_e_delta_z = 0,
        wr5_e_total_wr = 0,
        wr5_e_total_z = 0,
        wr5_eta_wr = 0,
        wr5_t_wr = 0,
        wr5_t_pv = 0,
        wr5_r_iso = 0,
        wr5_time_total = 0,
        wr5_time_feedin = 0,
        wr5_status = 0,
        wr5_fehler = 0,
        wr5_istberechnet = 0,
        wr5_pr = 0
    FROM (
        SELECT  d.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        WHERE   is_gap = TRUE AND is_gap_wr = TRUE
        )AS t2
    WHERE   t1.timestamp = t2.timestamp;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','update','pv3','pv3_weather_allwr_2015_filled','htw_pv3_postgresql_10_fill_gaps.sql','Update WR-Data');

-- Überprüfung
SELECT  3 AS id, 'Lücken WR' AS name,
        count(CASE WHEN is_gap_wr THEN 1 END) AS cnt,
        count(CASE WHEN is_filled_wr THEN 1 END) AS filled
FROM    pv3.pv3_weather_allwr_2015_filled;




-- Fülle Wetterdaten


-- VARIANTE 0
/*
-- Fülle alle Wetterdaten mit 0
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = 0,
        is_filled = TRUE,
        is_filled_weather = TRUE,
        g_hor_cmp6 = 0,
        g_hor_si = 0,
        g_gen_cmp11 = 0,
        g_gen_si = 0,
        ev_beleuchtung = 0,
        v_wind = 0,
        d_wind = 0,
        t_luft = 0,
        h_luft = 0,
        p_luft = 0,
        i_niederschlag = 0
    FROM (
        SELECT  d.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        WHERE   is_gap = TRUE AND is_gap_weather = TRUE
        )AS t2
    WHERE   t1.timestamp = t2.timestamp;

-- Überprüfe gefüllte Lücken
SELECT  'Wetter' AS gap,
        count(CASE WHEN is_gap_weather THEN 1 END) AS cnt,
        count(CASE WHEN is_filled_weather THEN 1 END) AS filled
FROM    pv3.pv3_weather_allwr_2015_filled;

-- Reset fill mit NULL (weil keine gute Methode und wir es können)
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = NULL,
        is_filled = FALSE,
        is_filled_weather = FALSE,
        g_hor_cmp6 = NULL,
        g_hor_si = NULL,
        g_gen_cmp11 = NULL,
        g_gen_si = NULL,
        ev_beleuchtung = NULL,
        v_wind = NULL,
        d_wind = NULL,
        t_luft = NULL,
        h_luft = NULL,
        p_luft = NULL,
        i_niederschlag = NULL
    FROM (
        SELECT  d.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        WHERE   is_gap = TRUE AND is_gap_weather = TRUE AND is_filled_weather = TRUE
        )AS t2
    WHERE   t1.timestamp = t2.timestamp;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','update','pv3','pv3_weather_allwr_2015_filled','htw_pv3_postgresql_10_fill_gaps.sql','Update Weather Data and Revert');

-- Überprüfe gefüllte Lücken
SELECT  'Wetter' AS gap,
        count(CASE WHEN is_gap_weather THEN 1 END) AS cnt,
        count(CASE WHEN is_filled_weather THEN 1 END) AS filled
FROM    pv3.pv3_weather_allwr_2015_filled;
*/


-- VARIANTE 1 - Nachts 0, Tagsüber Mittelwert

-- Fülle alle Wetterdaten in der Nacht mit 0
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = 1,
        is_filled = TRUE,
        is_filled_weather = TRUE,
        g_hor_cmp6 = 0,
        g_hor_si = 0,
        g_gen_cmp11 = 0,
        g_gen_si = 0,
        ev_beleuchtung = 0,
        v_wind = 0,
        d_wind = 0,
        t_luft = 0,
        h_luft = 0,
        p_luft = 0,
        i_niederschlag = 0
    FROM (
        SELECT  d.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        WHERE   is_gap = TRUE AND is_gap_weather = TRUE AND is_during_day = FALSE
        )AS t2
    WHERE   t1.timestamp = t2.timestamp;

-- Überprüfe gefüllte Lücken
SELECT  6 AS id, 'Lücken am Tag (Wetter)' AS name,
        count(CASE WHEN is_gap_weather AND is_during_day THEN 1 END) AS cnt,
        count(CASE WHEN is_gap_weather AND is_during_day AND is_filled_wr THEN 1 END) AS filled
FROM    pv3.pv3_weather_allwr_2015_filled;


-- Fülle alle Wetterdaten am Tag mit Stundenmittel
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = 2,
        is_filled = TRUE,
        is_filled_weather = TRUE,
        g_hor_cmp6 = ROUND(cast(t2.g_hor_cmp6_avg as numeric)),
        g_hor_si = ROUND(cast(t2.g_hor_si_avg as numeric),1),
        g_gen_cmp11 = ROUND(cast(t2.g_gen_cmp11_avg as numeric),1),
        g_gen_si = ROUND(cast(t2.g_gen_si_avg as numeric)),
        ev_beleuchtung = ROUND(cast(t2.ev_beleuchtung_avg as numeric),1),
        v_wind = ROUND(cast(t2.v_wind_avg as numeric),1),
        d_wind = ROUND(cast(t2.d_wind_avg as numeric)),
        t_luft = ROUND(cast(t2.t_luft_avg as numeric),1),
        h_luft = ROUND(cast(t2.h_luft_avg as numeric),1),
        p_luft = ROUND(cast(t2.p_luft_avg as numeric),1),
        i_niederschlag = ROUND(cast(t2.i_niederschlag_avg as numeric),1)
    FROM (
        SELECT  d.*, f.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        LEFT JOIN   pv3.pv3_time_weather_2015_hourly_mview AS f
        ON (f.timestamp_avg=date_trunc('hour',d.timestamp))
            WHERE   d.is_gap = TRUE
                    AND d.is_gap_weather = TRUE 
                    AND is_during_day = TRUE
        ORDER BY timestamp) AS t2
    WHERE   t1.timestamp = t2.timestamp;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','update','pv3','pv3_weather_allwr_2015_filled','htw_pv3_postgresql_10_fill_gaps.sql','Update Weather Data by day and night');

-- Überprüfe gefüllte Lücken
SELECT  6 AS id, 'Lücken am Tag (Wetter)' AS name,
        count(CASE WHEN is_gap_weather AND is_during_day THEN 1 END) AS cnt,
        count(CASE WHEN is_gap_weather AND is_during_day AND is_filled_wr THEN 1 END) AS filled
FROM    pv3.pv3_weather_allwr_2015_filled;


-- Wetterlücken gefüllt
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_sun_weather_allwr_2015_fill_gaps_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_sun_weather_allwr_2015_fill_gaps_mview AS
    SELECT *
    FROM pv3.pv3_weather_allwr_2015_filled
    WHERE is_gap_weather = TRUE
    ORDER BY timestamp;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','output','pv3','pv3_time_sun_weather_allwr_2015_fill_gaps_mview','htw_pv3_postgresql_7_data_analysis.sql','Gefüllte Wetterlücken');


/*
-- VARIANTE 2 - One-by-One

-- Setze 0 bei Nacht
-- 1	weather	5	01.01.2015	01.01.2015 02:02	01.01.2015 02:06	09:18:48	17:01:45	FALSE	
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = 0,
        is_filled = TRUE,
        g_hor_cmp6 = 0,
        g_hor_si = 0,
        g_gen_cmp11 = 0,
        g_gen_si = 0,
        ev_beleuchtung = 0,
        v_wind = 0,
        d_wind = 0,
        t_luft = 0,
        h_luft = 0,
        p_luft = 0,
        i_niederschlag = 0
    FROM (
        SELECT  d.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        WHERE   date = '2015-01-01' AND is_gap = TRUE
        )AS t2
    WHERE   t1.timestamp = t2.timestamp;


-- Fill Gaps One-by-One (see pv3.data_gaps)
-- 7	weather	3	04.12.2015	04.12.2015 10:14	04.12.2015 10:16	08:59:37	16:53:40	TRUE	
UPDATE pv3.pv3_weather_allwr_2015_filled AS t1
    SET gap_method = '1 - 1H AVG',
        is_filled = TRUE,
        g_hor_cmp6 = t2.g_hor_cmp6_avg,
        g_hor_si = t2.g_hor_si_avg,
        g_gen_cmp11 = t2.g_gen_cmp11_avg,
        g_gen_si = t2.g_gen_si_avg,
        ev_beleuchtung = t2.ev_beleuchtung_avg,
        v_wind = t2.v_wind_avg,
        d_wind = t2.d_wind_avg,
        t_luft = t2.t_luft_avg,
        h_luft = t2.h_luft_avg,
        p_luft = t2.p_luft_avg,
        i_niederschlag = t2.i_niederschlag_avg
    FROM (
        SELECT  d.*, f.*
        FROM    pv3.pv3_weather_allwr_2015_filled AS d
        LEFT JOIN   pv3.hourly_htw_weatherdata_2015 AS f
        ON (f.timestamp_avg=date_trunc('hour',d.timestamp))
             WHERE   d.date = '2015-12-04' 
            AND (d.time >= '10:14' AND d.time <= '10:16')
            AND d.is_gap = TRUE
            AND d.g_hor_cmp6 IS NULL
        ORDER BY timestamp) AS t2
    WHERE   t1.timestamp = t2.timestamp;

*/




-- Überprüfe Lücken
DROP VIEW IF EXISTS    pv3.pv3_weather_allwr_2015_filled_stat_view CASCADE;
CREATE VIEW            pv3.pv3_weather_allwr_2015_filled_stat_view AS
    SELECT  1 AS id, 'Lücken Gesamt' AS name,
            count(CASE WHEN is_gap THEN 1 END) AS cnt,
            count(CASE WHEN is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  2 AS id, 'Lücken Wetter' AS name,
            count(CASE WHEN is_gap_weather THEN 1 END) AS cnt,
            count(CASE WHEN is_filled_weather THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  3 AS id, 'Lücken WR' AS name,
            count(CASE WHEN is_gap_wr THEN 1 END) AS cnt,
            count(CASE WHEN is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  4 AS id, 'Minuten am Tag' AS name,
            count(CASE WHEN is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_during_day AND is_gap AND is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  5 AS id, 'Lücken am Tag' AS name,
            count(CASE WHEN is_gap AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap AND is_during_day AND is_filled THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  6 AS id, 'Lücken am Tag (Wetter)' AS name,
            count(CASE WHEN is_gap_weather AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap_weather AND is_during_day AND is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    UNION ALL
    SELECT  7 AS id, 'Lücken am Tag (WR)' AS name,
            count(CASE WHEN is_gap_wr AND is_during_day THEN 1 END) AS cnt,
            count(CASE WHEN is_gap_wr AND is_during_day AND is_filled_wr THEN 1 END) AS filled
    FROM    pv3.pv3_weather_allwr_2015_filled
    ORDER BY id;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','output','pv3','pv3_weather_allwr_2015_filled_stat_view','htw_pv3_postgresql_10_fill_gaps.sql','Create summary MView');


-- Erstelle Wetter MView
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_weather_2015_filled_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_weather_2015_filled_mview AS
    SELECT  timestamp, date, time,
            sunrise, sunset,
            g_hor_cmp6, g_hor_si, g_gen_cmp11, g_gen_si, ev_beleuchtung, v_wind, d_wind, t_luft, h_luft, p_luft, i_niederschlag
            is_gap, is_gap_weather, is_gap_wr, is_during_day,gap_method, is_filled, is_filled_weather, is_filled_wr
    FROM    pv3.pv3_weather_allwr_2015_filled;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','output','pv3','pv3_weather_2015_filled_mview','htw_pv3_postgresql_10_fill_gaps.sql','Create filled weather MView');


-- Export
COPY (SELECT * FROM pv3.pv3_weather_allwr_2015_filled ORDER BY timestamp) TO 'C:\data\pv3_data_2015\calculation\pv3_weather_allwr_2015_filled.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','output','pv3','pv3_weather_allwr_2015_filled','htw_pv3_postgresql_10_fill_gaps.sql','Export data');


-- Export
COPY (SELECT * FROM pv3.pv3_weather_2015_filled_mview ORDER BY timestamp) TO 'C:\data\pv3_data_2015\calculation\pv3_weather_2015_filled_mview.csv' DELIMITER ';' CSV HEADER;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('MA3','v1','output','pv3','pv3_weather_2015_filled_mview','htw_pv3_postgresql_10_fill_gaps.sql','Export data');


-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 5;
