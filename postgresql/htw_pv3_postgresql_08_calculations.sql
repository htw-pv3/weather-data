/*
Data calculations and gap filling

Berechne Stundenmittelwerte. 

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- Wetterdaten - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_weather_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_weather_2015_hourly_mview AS
    SELECT  date_trunc('hour', timestamp) AS timestamp_avg,
            timestamp::date AS date,
            EXTRACT(DAY FROM timestamp) AS "day",
            EXTRACT(HOUR FROM timestamp) AS "hour",
            AVG(g_hor_cmp6) AS g_hor_cmp6_avg,
            AVG(g_hor_si) AS g_hor_si_avg,
            AVG(g_gen_cmp11) AS g_gen_cmp11_avg,
            AVG(g_gen_si) AS g_gen_si_avg,
            AVG(ev_beleuchtung) AS ev_beleuchtung_avg,
            AVG(v_wind) AS v_wind_avg,
            AVG(d_wind) AS d_wind_avg,
            AVG(t_luft) AS t_luft_avg,
            AVG(h_luft) AS h_luft_avg,
            AVG(p_luft) AS p_luft_avg,
            AVG(i_niederschlag) AS i_niederschlag_avg
    FROM pv3.pv3_time_sun_weather_2015_mview
    GROUP BY date_trunc('hour', timestamp), timestamp::date, EXTRACT(DAY FROM timestamp), EXTRACT(HOUR FROM timestamp)
    ORDER BY date, hour;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_weather_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- WR1 - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_wr1_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_wr1_2015_hourly_mview AS
    SELECT
        date,
        EXTRACT(HOUR FROM t_timestamp) AS "hour",
        AVG(u_pv) AS u_pv_avg,
        AVG(i_pv) AS i_pv_avg,
        AVG(p_dc) AS p_dc_avg,
        AVG(f) AS f_avg,
        AVG(u_ac) AS u_ac_avg,
        AVG(i_ac) AS i_ac_avg,
        AVG(p_ac) AS p_ac_avg,
        AVG(e_delta_wr) AS e_delta_wr_avg,
        AVG(e_delta_z) AS e_delta_z_avg,
        AVG(e_total_wr) AS e_total_wr_avg,
        AVG(e_total_z) AS e_total_z_avg,
        AVG(eta_wr) AS eta_wr_avg,
        AVG(t_wr) AS t_wr_avg,
        AVG(t_pv) AS t_pv_avg,
        AVG(r_iso) AS r_iso_avg,
        AVG(time_total) AS time_total_avg,
        AVG(time_feedin) AS time_feedin_avg,
        AVG(status) AS status_avg,
        AVG(fehler) AS fehler_avg,
        AVG(istberechnet) AS istberechnet_avg,
        AVG(pr) AS pr_avg
    FROM    pv3.pv3_time_sun_weather_wr1_2015_mview
    GROUP BY date,EXTRACT(HOUR FROM t_timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_wr1_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- WR2 - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_wr2_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_wr2_2015_hourly_mview AS
    SELECT
        date,
        EXTRACT(HOUR FROM t_timestamp) AS "hour",
        AVG(u_pv) AS u_pv_avg,
        AVG(i_pv) AS i_pv_avg,
        AVG(p_dc) AS p_dc_avg,
        AVG(f) AS f_avg,
        AVG(u_ac) AS u_ac_avg,
        AVG(i_ac) AS i_ac_avg,
        AVG(p_ac) AS p_ac_avg,
        AVG(e_delta_wr) AS e_delta_wr_avg,
        AVG(e_delta_z) AS e_delta_z_avg,
        AVG(e_total_wr) AS e_total_wr_avg,
        AVG(e_total_z) AS e_total_z_avg,
        AVG(eta_wr) AS eta_wr_avg,
        AVG(t_wr) AS t_wr_avg,
        AVG(t_pv) AS t_pv_avg,
        AVG(r_iso) AS r_iso_avg,
        AVG(time_total) AS time_total_avg,
        AVG(time_feedin) AS time_feedin_avg,
        AVG(status) AS status_avg,
        AVG(fehler) AS fehler_avg,
        AVG(istberechnet) AS istberechnet_avg,
        AVG(pr) AS pr_avg
    FROM    pv3.pv3_time_sun_weather_wr2_2015_mview
    GROUP BY date,EXTRACT(HOUR FROM t_timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_wr2_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- WR3 - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_wr3_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_wr3_2015_hourly_mview AS
    SELECT
        date,
        EXTRACT(HOUR FROM t_timestamp) AS "hour",
        AVG(u_pv) AS u_pv_avg,
        AVG(i_pv) AS i_pv_avg,
        AVG(p_dc) AS p_dc_avg,
        AVG(f) AS f_avg,
        AVG(u_ac) AS u_ac_avg,
        AVG(i_ac) AS i_ac_avg,
        AVG(p_ac) AS p_ac_avg,
        AVG(e_delta_wr) AS e_delta_wr_avg,
        AVG(e_delta_z) AS e_delta_z_avg,
        AVG(e_total_wr) AS e_total_wr_avg,
        AVG(e_total_z) AS e_total_z_avg,
        AVG(eta_wr) AS eta_wr_avg,
        AVG(t_wr) AS t_wr_avg,
        AVG(t_pv) AS t_pv_avg,
        AVG(r_iso) AS r_iso_avg,
        AVG(time_total) AS time_total_avg,
        AVG(time_feedin) AS time_feedin_avg,
        AVG(status) AS status_avg,
        AVG(fehler) AS fehler_avg,
        AVG(istberechnet) AS istberechnet_avg,
        AVG(pr) AS pr_avg
    FROM    pv3.pv3_time_sun_weather_wr3_2015_mview
    GROUP BY date,EXTRACT(HOUR FROM t_timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_wr3_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- WR4 - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_wr4_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_wr4_2015_hourly_mview AS
    SELECT
        date,
        EXTRACT(HOUR FROM t_timestamp) AS "hour",
        AVG(u_pv) AS u_pv_avg,
        AVG(i_pv) AS i_pv_avg,
        AVG(p_dc) AS p_dc_avg,
        AVG(f) AS f_avg,
        AVG(u_ac) AS u_ac_avg,
        AVG(i_ac) AS i_ac_avg,
        AVG(p_ac) AS p_ac_avg,
        AVG(e_delta_wr) AS e_delta_wr_avg,
        AVG(e_delta_z) AS e_delta_z_avg,
        AVG(e_total_wr) AS e_total_wr_avg,
        AVG(e_total_z) AS e_total_z_avg,
        AVG(eta_wr) AS eta_wr_avg,
        AVG(t_wr) AS t_wr_avg,
        AVG(t_pv) AS t_pv_avg,
        AVG(r_iso) AS r_iso_avg,
        AVG(time_total) AS time_total_avg,
        AVG(time_feedin) AS time_feedin_avg,
        AVG(status) AS status_avg,
        AVG(fehler) AS fehler_avg,
        AVG(istberechnet) AS istberechnet_avg,
        AVG(pr) AS pr_avg
    FROM    pv3.pv3_time_sun_weather_wr4_2015_mview
    GROUP BY date,EXTRACT(HOUR FROM t_timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_wr4_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- WR5 - Durchschnittswerte pro Stunde
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_wr5_2015_hourly_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_wr5_2015_hourly_mview AS
    SELECT
        date,
        EXTRACT(HOUR FROM t_timestamp) AS "hour",
        AVG(u_pv) AS u_pv_avg,
        AVG(i_pv) AS i_pv_avg,
        AVG(p_dc) AS p_dc_avg,
        AVG(f) AS f_avg,
        AVG(u_ac) AS u_ac_avg,
        AVG(i_ac) AS i_ac_avg,
        AVG(p_ac) AS p_ac_avg,
        AVG(e_delta_wr) AS e_delta_wr_avg,
        AVG(e_delta_z) AS e_delta_z_avg,
        AVG(e_total_wr) AS e_total_wr_avg,
        AVG(e_total_z) AS e_total_z_avg,
        AVG(eta_wr) AS eta_wr_avg,
        AVG(t_wr) AS t_wr_avg,
        AVG(t_pv) AS t_pv_avg,
        AVG(r_iso) AS r_iso_avg,
        AVG(time_total) AS time_total_avg,
        AVG(time_feedin) AS time_feedin_avg,
        AVG(status) AS status_avg,
        AVG(fehler) AS fehler_avg,
        AVG(istberechnet) AS istberechnet_avg,
        AVG(pr) AS pr_avg
    FROM    pv3.pv3_time_sun_weather_wr5_2015_mview
    GROUP BY date,EXTRACT(HOUR FROM t_timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_wr5_2015_hourly_mview','htw_pv3_postgresql_08_calculations.sql','Hourly data WR1');


-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 6;
