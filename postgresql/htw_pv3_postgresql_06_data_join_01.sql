/*
Data combination and database joins

Connects the different tables:
- full timeseries "time_2015" 
- sunrise and sunset per day "sun_2015"
- htw weatherdata "htw_weatherdata_2015"
- pv-data "einleuchtend_wrdata_2015_wr[1-5]"

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "Creative Commons Zero v1.0 Universal (CC0-1.0)"
__url__         = "https://creativecommons.org/publicdomain/zero/1.0/"
__author__      = "Ludwig Hülk"
*/


-- Join time and sun
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_sun_2015_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_sun_2015_mview AS
    SELECT  t.timestamp AS t_timestamp, t.date, t.time,
            s.sunrise,s.sunset
    FROM        pv3.time_2015 AS t
    LEFT JOIN   pv3.sun_2015 AS s
        ON (t.date=s.date);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_sun_2015_mview','htw_pv3_postgresql_6_data_join.sql','Join time and sun');


-- Join time and sun and weatherdata
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_sun_weather_2015_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_sun_weather_2015_mview AS
    SELECT  t.timestamp AS t_timestamp, t.date, t.time,
            s.sunrise,s.sunset,
            w.g_hor_cmp6,w.g_hor_si,w.g_gen_cmp11,w.g_gen_si,w.ev_beleuchtung,w.v_wind,w.d_wind,w.t_luft,w.h_luft,w.p_luft,w.i_niederschlag
    FROM        pv3.time_2015 AS t
    LEFT JOIN   pv3.sun_2015 AS s
        ON (t.date=s.date)
    LEFT JOIN   pv3.htw_weatherdata_2015 AS w 
        ON (t.timestamp=w.timestamp);

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_sun_weather_2015_mview','htw_pv3_postgresql_6_data_join.sql','Join time and sun');


-- Join time and sun and weatherdata and WR1
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_sun_weather_wr1_2015_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_sun_weather_wr1_2015_mview AS
    SELECT  t.timestamp AS t_timestamp, t.date, t.time,
            s.sunrise,s.sunset,
            w.g_hor_cmp6,w.g_hor_si,w.g_gen_cmp11,w.g_gen_si,w.ev_beleuchtung,w.v_wind,w.d_wind,w.t_luft,w.h_luft,w.p_luft,w.i_niederschlag,
            wr.*
    FROM        pv3.time_2015 AS t
    LEFT JOIN   pv3.sun_2015 AS s
        ON (t.date=s.date)
    LEFT JOIN   pv3.htw_weatherdata_2015 AS w 
        ON (t.timestamp=w.timestamp)
    LEFT JOIN   pv3.einleuchtend_wrdata_2015_wr1 AS wr
        ON (t.timestamp=wr.timestamp);




-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_sun_weather_wr1_2015_mview','htw_pv3_postgresql_6_data_join.sql','Join data');


/*
-- Join time and sun and weatherdata and all WR
DROP MATERIALIZED VIEW IF EXISTS pv3.pv3_time_sun_weather_allwr_2015_mview CASCADE;
CREATE MATERIALIZED VIEW         pv3.pv3_time_sun_weather_allwr_2015_mview AS
    SELECT  t.timestamp AS timestamp, t.date, t.time,
            s.sunrise,s.sunset,
            w.g_hor_cmp6,w.g_hor_si,w.g_gen_cmp11,w.g_gen_si,w.ev_beleuchtung,w.v_wind,w.d_wind,w.t_luft,w.h_luft,w.p_luft,w.i_niederschlag,
            wr1.wrnref AS wr1_wrnref, wr1.u_pv AS wr1_u_pv, wr1.i_pv AS wr1_i_pv, wr1.p_dc AS wr1_p_dc, wr1.f AS wr1_f, wr1.u_ac AS wr1_u_ac, wr1.i_ac AS wr1_i_ac, wr1.p_ac AS wr1_p_ac, wr1.e_delta_wr AS wr1_e_delta_wr, wr1.e_delta_z AS wr1_e_delta_z, wr1.e_total_wr AS wr1_e_total_wr, wr1.e_total_z AS wr1_e_total_z, wr1.eta_wr AS wr1_eta_wr, wr1.t_wr AS wr1_t_wr, wr1.t_pv AS wr1_t_pv, wr1.r_iso AS wr1_r_iso, wr1.time_total AS wr1_time_total, wr1.time_feedin AS wr1_time_feedin, wr1.status AS wr1_status, wr1.fehler AS wr1_fehler, wr1.istberechnet AS wr1_istberechnet, wr1.pr AS wr1_pr,
            wr2.wrnref AS wr2_wrnref, wr2.u_pv AS wr2_u_pv, wr2.i_pv AS wr2_i_pv, wr2.p_dc AS wr2_p_dc, wr2.f AS wr2_f, wr2.u_ac AS wr2_u_ac, wr2.i_ac AS wr2_i_ac, wr2.p_ac AS wr2_p_ac, wr2.e_delta_wr AS wr2_e_delta_wr, wr2.e_delta_z AS wr2_e_delta_z, wr2.e_total_wr AS wr2_e_total_wr, wr2.e_total_z AS wr2_e_total_z, wr2.eta_wr AS wr2_eta_wr, wr2.t_wr AS wr2_t_wr, wr2.t_pv AS wr2_t_pv, wr2.r_iso AS wr2_r_iso, wr2.time_total AS wr2_time_total, wr2.time_feedin AS wr2_time_feedin, wr2.status AS wr2_status, wr2.fehler AS wr2_fehler, wr2.istberechnet AS wr2_istberechnet, wr2.pr AS wr2_pr,
            wr3.wrnref AS wr3_wrnref, wr3.u_pv AS wr3_u_pv, wr3.i_pv AS wr3_i_pv, wr3.p_dc AS wr3_p_dc, wr3.f AS wr3_f, wr3.u_ac AS wr3_u_ac, wr3.i_ac AS wr3_i_ac, wr3.p_ac AS wr3_p_ac, wr3.e_delta_wr AS wr3_e_delta_wr, wr3.e_delta_z AS wr3_e_delta_z, wr3.e_total_wr AS wr3_e_total_wr, wr3.e_total_z AS wr3_e_total_z, wr3.eta_wr AS wr3_eta_wr, wr3.t_wr AS wr3_t_wr, wr3.t_pv AS wr3_t_pv, wr3.r_iso AS wr3_r_iso, wr3.time_total AS wr3_time_total, wr3.time_feedin AS wr3_time_feedin, wr3.status AS wr3_status, wr3.fehler AS wr3_fehler, wr3.istberechnet AS wr3_istberechnet, wr3.pr AS wr3_pr,
            wr4.wrnref AS wr4_wrnref, wr4.u_pv AS wr4_u_pv, wr4.i_pv AS wr4_i_pv, wr4.p_dc AS wr4_p_dc, wr4.f AS wr4_f, wr4.u_ac AS wr4_u_ac, wr4.i_ac AS wr4_i_ac, wr4.p_ac AS wr4_p_ac, wr4.e_delta_wr AS wr4_e_delta_wr, wr4.e_delta_z AS wr4_e_delta_z, wr4.e_total_wr AS wr4_e_total_wr, wr4.e_total_z AS wr4_e_total_z, wr4.eta_wr AS wr4_eta_wr, wr4.t_wr AS wr4_t_wr, wr4.t_pv AS wr4_t_pv, wr4.r_iso AS wr4_r_iso, wr4.time_total AS wr4_time_total, wr4.time_feedin AS wr4_time_feedin, wr4.status AS wr4_status, wr4.fehler AS wr4_fehler, wr4.istberechnet AS wr4_istberechnet, wr4.pr AS wr4_pr,
            wr5.wrnref AS wr5_wrnref, wr5.u_pv AS wr5_u_pv, wr5.i_pv AS wr5_i_pv, wr5.p_dc AS wr5_p_dc, wr5.f AS wr5_f, wr5.u_ac AS wr5_u_ac, wr5.i_ac AS wr5_i_ac, wr5.p_ac AS wr5_p_ac, wr5.e_delta_wr AS wr5_e_delta_wr, wr5.e_delta_z AS wr5_e_delta_z, wr5.e_total_wr AS wr5_e_total_wr, wr5.e_total_z AS wr5_e_total_z, wr5.eta_wr AS wr5_eta_wr, wr5.t_wr AS wr5_t_wr, wr5.t_pv AS wr5_t_pv, wr5.r_iso AS wr5_r_iso, wr5.time_total AS wr5_time_total, wr5.time_feedin AS wr5_time_feedin, wr5.status AS wr5_status, wr5.fehler AS wr5_fehler, wr5.istberechnet AS wr5_istberechnet, wr5.pr AS wr5_pr
    FROM        ;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v2','output','pv3','pv3_time_sun_weather_allwr_2015_mview','htw_pv3_postgresql_6_data_join.sql','Join all data');

-- Select latest entries
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 6;
*/
