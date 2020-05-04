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
    "name": "pv3.htw_weatherdata_2015",
    "title": "HTW Weatherdata",
    "id": null,
    "description": "HTW Weatherdata 2015",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "weatherdata"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Meta data for the measurement of the fracture sensors of the experimental facility of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "wetter.htw-berlin.de",
            "description": "Data",
            "path": "https://wetter.htw-berlin.de/Download",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "https://wetter.htw-berlin.de/About/Disclaimer",
                    "instruction": "unknown",
                    "attribution": "© 2020 - wetter.htw-berlin.de"
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-03",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.htw_wetter_weatherdata_2015_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
					},
                    {
                        "name": "G_hor_CMP6",
                        "description": "global irradiance horizontal CMP6 Pyranometer",
                        "type": "serial",
                        "unit": "W/m^2"
                    },
                    {
                        "name": "G_hor_Si",
                        "description": "global irradiance horizontal SI-Pyranometer",
                        "type": "double precision",
                        "unit": "W/m^2"
                    },
                    {
                        "name": "G_gen_CMP11",
                        "description": "global irradiance sloped south 35° CMP11 Pyranometer",
                        "type": "double precision",
                        "unit": "W/m^2"
                    },
                    {
                        "name": "G_gen_Si",
                        "description": "global irradiance sloped south 35° SI-Pyranometer",
                        "type": "serial",
                        "unit": "W/m^2"
                    },
                    {
                        "name": "Ev_Beleuchtung",
                        "description": "unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "v_Wind",
                        "description": "Wind speed",
                        "type": "double precision",
                        "unit": "m/s"
                    },
                    {
                        "name": "d_Wind",
                        "description": "Wind direction",
                        "type": "serial",
                        "unit": "°"
                    },
                    {
                        "name": "T_Luft",
                        "description": "Ambient temperature",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "h_Luft",
                        "description": "Relative Humidity",
                        "type": "double precision",
                        "unit": "%"
                    },
                    {
                        "name": "p_Luft",
                        "description": "Atmospheric pressure",
                        "type": "double precision",
                        "unit": "hPa"
                    },
                    {
                        "name": "i_Niederschlag",
                        "description": "Precipitation",
                        "type": "double precision",
                        "unit": "unknown"
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
    "name": "einleuchtend_wrdata_2015_wr1_v140_KH",
    "title": "einleuchtend WR 1 data",
    "id": null,
    "description": "einleuchtend e.V. inverter 1 data",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "wr1",
		"inverter",
		"einleuchtend"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Metadata for the measurement series of inverter 1 of the experimental PV system of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "SonnJa! einleuchtend e.V.",
            "description": "Data",
            "path": "http://sonnja.einleuchtend.org/",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "http://einleuchtend.org/impressum/",
                    "instruction": "unknown",
                    "attribution": "©2009 - 2020 einleuchtend e.V."
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-04",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.einleuchtend_wrdata_2015_wr1_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
					{
                        "name": "WRNrRef",
                        "description": "inverter reference number",
                        "type": "serial",
                        "unit": "text"
                    },
					{
                        "name": "U_PV",
                        "description": "DC PV Voltage",
                        "type": "double precision",
                        "unit": "V"
                    },
                    {
                        "name": "I_PV",
                        "description": "DC PV Current",
                        "type": "double precision",
                        "unit": "A"
                    },
                    {
                        "name": "F",
                        "description": "unknown; always zero",
                        "type": "boolean",
                        "unit": null
                    },
                    {
                        "name": "U_AC",
                        "description": "AC Voltage; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "I_AC",
                        "description": "AC Current; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "P_AC",
                        "description": "AC Power",
                        "type": "serial",
                        "unit": "W"
                    },
                    {
                        "name": "E_delta_WR",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_delta_Z",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_WR",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_Z",
                        "description": "Cumulative Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "eta_WR",
                        "description": "Efficiency Inverter",
                        "type": "double precision",
                        "unit": "relative"
                    },
                    {
                        "name": "T_WR",
                        "description": "Temperature Inverter; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "T_PV",
                        "description": "Temperature PV",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "R_iso",
                        "description": "unknown; always zero",
                        "type": "serial",
                        "unit": "°C"
                    },
                    {
                        "name": "time_total",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "time_feedin",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "Status",
                        "description": "unknown status",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "Fehler",
                        "description": "Error Code",
                        "type": "serial",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
    "name": "einleuchtend_wrdata_2015_wr2_v140_KH",
    "title": "einleuchtend WR 2 data",
    "id": null,
    "description": "einleuchtend e.V. inverter 2 data",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "wr2",
		"inverter",
		"einleuchtend"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Metadata for the measurement series of inverter 1 of the experimental PV system of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "SonnJa! einleuchtend e.V.",
            "description": "Data",
            "path": "http://sonnja.einleuchtend.org/",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "http://einleuchtend.org/impressum/",
                    "instruction": "unknown",
                    "attribution": "©2009 - 2020 einleuchtend e.V."
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-04",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.einleuchtend_wrdata_2015_wr2_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
					{
                        "name": "WRNrRef",
                        "description": "inverter reference number",
                        "type": "serial",
                        "unit": "text"
                    },
					{
                        "name": "U_PV",
                        "description": "DC PV Voltage",
                        "type": "double precision",
                        "unit": "V"
                    },
                    {
                        "name": "I_PV",
                        "description": "DC PV Current",
                        "type": "double precision",
                        "unit": "A"
                    },
                    {
                        "name": "F",
                        "description": "unknown; always zero",
                        "type": "boolean",
                        "unit": null
                    },
                    {
                        "name": "U_AC",
                        "description": "AC Voltage; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "I_AC",
                        "description": "AC Current; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "P_AC",
                        "description": "AC Power",
                        "type": "serial",
                        "unit": "W"
                    },
                    {
                        "name": "E_delta_WR",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_delta_Z",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_WR",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_Z",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "eta_WR",
                        "description": "Efficiency Inverter",
                        "type": "double precision",
                        "unit": "relative"
                    },
                    {
                        "name": "T_WR",
                        "description": "Temperature Inverter; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "T_PV",
                        "description": "Temperature PV",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "R_iso",
                        "description": "unknown; always zero",
                        "type": "serial",
                        "unit": "°C"
                    },
                    {
                        "name": "time_total",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "time_feedin",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "Status",
                        "description": "unknown status",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "Fehler",
                        "description": "Error Code",
                        "type": "serial",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
    "name": "einleuchtend_wrdata_2015_wr3_v140_KH",
    "title": "einleuchtend WR 3 data",
    "id": null,
    "description": "einleuchtend e.V. inverter 3 data",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "wr3",
		"inverter",
		"einleuchtend"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Metadata for the measurement series of inverter 1 of the experimental PV system of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "SonnJa! einleuchtend e.V.",
            "description": "Data",
            "path": "http://sonnja.einleuchtend.org/",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "http://einleuchtend.org/impressum/",
                    "instruction": "unknown",
                    "attribution": "©2009 - 2020 einleuchtend e.V."
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-04",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.einleuchtend_wrdata_2015_wr3_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
					{
                        "name": "WRNrRef",
                        "description": "inverter reference number",
                        "type": "serial",
                        "unit": "text"
                    },
					{
                        "name": "U_PV",
                        "description": "DC PV Voltage",
                        "type": "double precision",
                        "unit": "V"
                    },
                    {
                        "name": "I_PV",
                        "description": "DC PV Current",
                        "type": "double precision",
                        "unit": "A"
                    },
                    {
                        "name": "F",
                        "description": "unknown; always zero",
                        "type": "boolean",
                        "unit": null
                    },
                    {
                        "name": "U_AC",
                        "description": "AC Voltage; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "I_AC",
                        "description": "AC Current; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "P_AC",
                        "description": "AC Power",
                        "type": "serial",
                        "unit": "W"
                    },
                    {
                        "name": "E_delta_WR",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_delta_Z",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_WR",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_Z",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "eta_WR",
                        "description": "Efficiency Inverter",
                        "type": "double precision",
                        "unit": "relative"
                    },
                    {
                        "name": "T_WR",
                        "description": "Temperature Inverter; always zero",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "T_PV",
                        "description": "Temperature PV",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "R_iso",
                        "description": "unknown; always zero",
                        "type": "serial",
                        "unit": "°C"
                    },
                    {
                        "name": "time_total",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "time_feedin",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "Status",
                        "description": "unknown status",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "Fehler",
                        "description": "Error Code",
                        "type": "serial",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
    "name": "einleuchtend_wrdata_2015_wr4_v140_KH",
    "title": "einleuchtend WR 4 data",
    "id": null,
    "description": "einleuchtend e.V. inverter 4 data",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "wr4",
		"inverter",
		"einleuchtend"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Metadata for the measurement series of inverter 1 of the experimental PV system of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "SonnJa! einleuchtend e.V.",
            "description": "Data",
            "path": "http://sonnja.einleuchtend.org/",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "http://einleuchtend.org/impressum/",
                    "instruction": "unknown",
                    "attribution": "©2009 - 2020 einleuchtend e.V."
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-04",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.einleuchtend_wrdata_2015_wr4_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
					{
                        "name": "WRNrRef",
                        "description": "inverter reference number",
                        "type": "serial",
                        "unit": "text"
                    },
					{
                        "name": "U_PV",
                        "description": "DC PV Voltage",
                        "type": "double precision",
                        "unit": "V"
                    },
                    {
                        "name": "I_PV",
                        "description": "DC PV Current",
                        "type": "double precision",
                        "unit": "A"
                    },
                    {
                        "name": "F",
                        "description": "unknown; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "U_AC",
                        "description": "AC Voltage",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "I_AC",
                        "description": "AC Current",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "P_AC",
                        "description": "AC Power",
                        "type": "double precision",
                        "unit": "W"
                    },
                    {
                        "name": "E_delta_WR",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_delta_Z",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_WR",
                        "description": "Cumulative Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_Z",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "eta_WR",
                        "description": "Efficiency Inverter",
                        "type": "double precision",
                        "unit": "relative"
                    },
                    {
                        "name": "T_WR",
                        "description": "Temperature Inverter",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "T_PV",
                        "description": "Temperature PV",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "R_iso",
                        "description": "unknown; always zero",
                        "type": "serial",
                        "unit": "°C"
                    },
                    {
                        "name": "time_total",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "time_feedin",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "Status",
                        "description": "unknown status",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "Fehler",
                        "description": "Error Code",
                        "type": "serial",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
    "name": "einleuchtend_wrdata_2015_wr5_v140_KH",
    "title": "einleuchtend WR 5 data",
    "id": null,
    "description": "einleuchtend e.V. inverter 5 data",
    "language": [
        "en-GB",
		"de-DE"
    ],
    "keywords": [
        "wr5",
		"inverter",
		"einleuchtend"
    ],
    "publicationDate": null,
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "s0554994@htw-berlin.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": "Wilhelminenhofstraße 75A, 12459 Berlin",
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": "2015",
        "timeseries": {
            "start": "2015-01-01 00:00:00",
            "end": "2015-12-31 23:59:00",
            "resolution": "1 min",
            "alignment": "unknown",
            "aggregationType": "unknown"
        }
    },
    "sources": [
        {
            "title": "W-PV3 Solaranlagen und -kraftwerke metadata weatherdata",
            "description": "Metadata for the measurement series of inverter 1 of the experimental PV system of einleuchtend e.V. at the HTW Berlin",
            "path": "https://github.com/htw-pv3/weather-data",
            "licenses": [
                {
                    "name": "AGPL v3",
                    "title": "GNU Affero General Public License v3.0",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
                    "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
                    "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
                }
            ]
        },
        {
            "title": "SonnJa! einleuchtend e.V.",
            "description": "Data",
            "path": "http://sonnja.einleuchtend.org/",
            "licenses": [
                {
                    "name": "unknown",
                    "title": "unknown",
                    "path": "http://einleuchtend.org/impressum/",
                    "instruction": "unknown",
                    "attribution": "©2009 - 2020 einleuchtend e.V."
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "AGPL v3",
            "title": "GNU Affero General Public License v3.0",
            "path": "https://www.gnu.org/licenses/agpl-3.0.de.html",
            "instruction": "The GNU Affero General Public License is a free, copyleft license for software and other kinds of works, specifically designed to ensure cooperation with the community in the case of network server software.",
            "attribution": "© Reiner Lemoine Institut ©2009 - 2020 einleuchtend e.V."
        }
    ],
    "contributors": [
		{
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Kilian Helfenbein",
            "email": null,
            "date": "2020-05-04",
            "object": "metadata",
            "comment": "Add metadata"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.einleuchtend_wrdata_2015_wr5_v140_KH",
            "path": "https://github.com/htw-pv3/weather-data/tree/MyMetaData/helfenbein_kilian",
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
					{
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
					{
                        "name": "WRNrRef",
                        "description": "inverter reference number",
                        "type": "serial",
                        "unit": "text"
                    },
					{
                        "name": "U_PV",
                        "description": "DC PV Voltage",
                        "type": "double precision",
                        "unit": "V"
                    },
                    {
                        "name": "I_PV",
                        "description": "DC PV Current",
                        "type": "double precision",
                        "unit": "A"
                    },
                    {
                        "name": "F",
                        "description": "unknown; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "U_AC",
                        "description": "AC Voltage",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "I_AC",
                        "description": "AC Current",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "P_AC",
                        "description": "AC Power",
                        "type": "double precision",
                        "unit": "W"
                    },
                    {
                        "name": "E_delta_WR",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_delta_Z",
                        "description": "Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_WR",
                        "description": "Cumulative Energy unknown",
                        "type": "double precision",
                        "unit": "unknown"
                    },
                    {
                        "name": "E_total_Z",
                        "description": "Cumulative Energy unknown",
                        "type": "serial",
                        "unit": "unknown"
                    },
                    {
                        "name": "eta_WR",
                        "description": "Efficiency Inverter",
                        "type": "double precision",
                        "unit": "relative"
                    },
                    {
                        "name": "T_WR",
                        "description": "Temperature Inverter",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "T_PV",
                        "description": "Temperature PV",
                        "type": "double precision",
                        "unit": "°C"
                    },
                    {
                        "name": "R_iso",
                        "description": "unknown; always zero",
                        "type": "serial",
                        "unit": "°C"
                    },
                    {
                        "name": "time_total",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "time_feedin",
                        "description": "unknown time; always zero",
                        "type": "double precision",
                        "unit": null
                    },
                    {
                        "name": "Status",
                        "description": "unknown status",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "Fehler",
                        "description": "Error Code",
                        "type": "serial",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "timestamp"
                ],
                "foreignKeys": [
                    {
                        "fields": [
                            null
                        ],
                        "reference": {
                            "resource": null,
                            "fields": [
                                null
                            ]
                        }
                    }
                ]
            },
            "dialect": {
                "delimiter": ";",
                "double precisionSeparator": "."
            }
        }
    ],
    "review": {
        "path": null,
        "badge": null
    },
    "metaMetadata": {
        "metadataVersion": "OEP-1.4.0",
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
