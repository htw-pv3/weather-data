/*
Database Logging Function: db_log

Function to add an entry to the database log table.

Inputs:
    project,version,io,schema_name,table_name,script_name,comment

Outputs:
    id          SERIAL,
    project     text,
    version     text,
    io          text,
    schema_name text,
    table_name  text,
    script_name text,
    entries     integer,
    "comment"   text,
    user_name   text,
    "timestamp" timestamp,
    meta_data   text

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)"
__url__         = "https://www.gnu.org/licenses/agpl-3.0.txt"
__author__      = "Ludwig Hülk"
*/


-- Version list
DROP TABLE IF EXISTS    pv3.db_log_version CASCADE;
CREATE TABLE            pv3.db_log_version (
    id              serial,
    model           text,
    version         text,
    version_name    text,
    "release"       boolean,
    "comment"       text,
    "timestamp"     timestamp,
    CONSTRAINT db_log_version_pkey PRIMARY KEY (version));

-- Access rights
ALTER TABLE pv3.db_log_version OWNER TO role_user;
GRANT SELECT ON TABLE pv3.db_log_version TO role_read;

-- Metadata
COMMENT ON TABLE pv3.db_log_version IS '{
    "name": "db_log_version",
    "title": "DatabaseLog Versions",
    "id": null,
    "description": "List with data versions and info",
    "language": [
        "en-GB",
        "de-DE"
    ],
    "keywords": [
        "DatabaseLog",
        "logging",
        "versioning"
    ],
    "publicationDate": "2018-06-12",
    "context": {
            "homepage": "https://re-master.htw-berlin.de/",
            "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
            "sourceCode": "https://github.com/htw-pv3/weather-data",
            "contact": "ludwig.huelk@rl-institut.de",
            "grantNo": null,
            "fundingAgency": null,
            "fundingAgencyLogo": null,
            "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"},
    "spatial": {
        "location": null,
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": null,
        "timeseries": {
            "start": null,
            "end": null,
            "resolution": null,
            "alignment": null,
            "aggregationType": null
        }
    },
    "sources": [
        {
            "title": "open_eGo DataProcessing",
            "description": "Open Science research project",
            "path": "https://github.com/openego/data_processing",
            "licenses": [
                {
                    "name": "AGPL-3.0-or-later",
                    "title": "GNU Affero General Public License v3.0 or later",
                    "path": "https://www.gnu.org/licenses/agpl-3.0.txt",
                    "instruction": "",
                    "attribution": "eGo DataProcessing Documentation © Flensburg University of Applied Sciences, Centre for Sustainable Energy Systems © Europa-Universität Flensburg, Centre for Sustainable Energy Systems © Reiner Lemoine Institut © DLR Institute for Networked Energy Systems"
                }
            ]
        }
    ],
    "licenses": [
        {
            "name": "CC0-1.0",
            "title": "Creative Commons Zero v1.0 Universal",
            "path": "https://creativecommons.org/publicdomain/zero/1.0/legalcode",
            "instruction": "You can: Commercial Use, Private Use, Modify, Distribute; You cannot: Use Trademark, Hold Liable, Use Patent Claims; You must: none!",
            "attribution": "© Reiner Lemoine Institut"
        }
    ],
    "contributors": [
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-10-01",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-11-16",
            "object": "metadata",
            "comment": "Create metadata"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-03-21",
            "object": "metadata",
            "comment": "Update metadata to 1.1"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-04-06",
            "object": "metadata",
            "comment": "Update metadata to 1.2"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-06-19",
            "object": "metadata",
            "comment": "Update metadata to 1.3"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2018-02-21",
            "object": "data",
            "comment": "Update data license to CC0"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2020-04-29",
            "object": "metadata",
            "comment": "Update metadata to 1.4"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.db_log_version",
            "path": null,
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
                    {
                        "name": "id",
                        "description": "Unique identifier",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "model",
                        "description": "Model name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "version",
                        "description": "Version number",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "version_name",
                        "description": "Version name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "release",
                        "description": "Version released",
                        "type": "boolean",
                        "unit": null
                    },
                    {
                        "name": "comment",
                        "description": "Additional information and comments",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "timestamp",
                        "description": "Timestamp (Berlin)",
                        "type": "timestamp",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "id"
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
                "delimiter": null,
                "decimalSeparator": null
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
    }
    }';

-- Scenarios
INSERT INTO pv3.db_log_version (model,version,version_name,release,comment,timestamp) VALUES
    ('PV3', 'v0', 'Database Setup', 'FALSE', 'Setup database and scenario log', '2020-04-29'),
    ('PV3', 'v1', 'PV3', 'TRUE', 'Data import', '2020-04-29'),
    ('PV3', 'v2', 'PV3', 'TRUE', 'Data processing', '2020-04-29'),
    ('PV3', 'v3', 'PV3', 'TRUE', 'Data export', '2020-04-29');


-- Scenario Log
DROP TABLE IF EXISTS    pv3.db_log CASCADE;
CREATE TABLE            pv3.db_log (
    id          SERIAL,
    project     text,
    version     text,
    io          text,
    schema_name text,
    table_name  text,
    script_name text,
    entries     integer,
    comment     text,
    user_name   text,
    "timestamp" timestamp,
    meta_data   text,
    CONSTRAINT db_log_pkey PRIMARY KEY (id));

-- Foreign Key to Scenario List
ALTER TABLE pv3.db_log
    ADD CONSTRAINT db_log_fkey FOREIGN KEY (version) 
        REFERENCES pv3.db_log_version(version) 
        MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Access rights
ALTER TABLE pv3.db_log OWNER TO role_user; 
GRANT SELECT ON TABLE pv3.db_log TO role_read;

-- Metadata
COMMENT ON TABLE pv3.db_log IS '{
    "title": "Scenario Log",
    "description": "Versioning and table info",
    "language": [
        "en-GB"
    ],
    "keywords": [
        "Versioning",
        "TableInfo"
    ],
    "publicationDate": "2018-02-21",
    "context": {
        "homepage": "https://re-master.htw-berlin.de/",
        "documentation": "Solaranlangen und -kraftwerke (W-PV3)",
        "sourceCode": "https://github.com/htw-pv3/weather-data",
        "contact": "ludwig.huelk@rl-institut.de",
        "grantNo": null,
        "fundingAgency": null,
        "fundingAgencyLogo": null,
        "publisherLogo": "https://corporatedesign.htw-berlin.de/files/Presse/_tmp_/d/5/csm_Bild-Wort-Marke_auf_weiss_1280x853_3722b5420f.jpg"
    },
    "spatial": {
        "location": null,
        "extent": null,
        "resolution": null
    },
    "temporal": {
        "referenceDate": null,
        "timeseries": {
            "start": null,
            "end": null,
            "resolution": null,
            "alignment": null,
            "aggregationType": null
        }
    },
    "sources": [
        {"name": "eGo DataProcessing", "description": "Code", "url": "https://github.com/openego/data_processing", "license": "AGPL-3.0-or-later", "copyright": "eGo DataProcessing © Flensburg University of Applied Sciences, Centre for Sustainable Energy Systems © Europa-Universität Flensburg, Centre for Sustainable Energy Systems © Reiner Lemoine Institut © DLR Institute for Networked Energy Systems"},
        {"name": "eGo DataProcessing", "description": "Documentation", "url": "http://data-processing.readthedocs.io/en/latest/", "license": "CC-BY-4.0", "copyright": "eGo DataProcessing Documentation © Flensburg University of Applied Sciences, Centre for Sustainable Energy Systems © Europa-Universität Flensburg, Centre for Sustainable Energy Systems © Reiner Lemoine Institut © DLR Institute for Networked Energy Systems"}],
    "spatial": 
        {"location": "none",
        "extent": "none",
        "resolution": "none"},
    "temporal": 
        {"reference_date": "none",
        "start": "none",
        "end": "none",
        "resolution": "none"},
    "license": 
        {"id": "CC0-1.0",
        "name": "Creative Commons Zero v1.0 Universal",
        "version": "1.0",
        "url": "https://creativecommons.org/publicdomain/zero/1.0/legalcode",
        "instruction": "You can: Commercial Use, Private Use, Modify, Distribute; You cannot: Use Trademark, Hold Liable, Use Patent Claims; You must: none!",
        "copyright": "© Reiner Lemoine Institut"},
    "contributors": [
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-10-01",
            "object": "data",
            "comment": "Create table"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-10-12",
            "object": "user_name",
            "comment": "Add user_name"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-11-16",
            "object": "io",
            "comment": "Add io"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2016-11-16",
            "object": "metadata",
            "comment": "Add metadata"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-01-15",
            "object": "metadata",
            "comment": "Update metadata"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-03-21",
            "object": "metadata",
            "comment": "Update metadata to 1.1"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-04-06",
            "object": "metadata",
            "comment": "Update metadata to 1.2"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2017-06-19",
            "object": "metadata",
            "comment": "Update metadata to 1.3"
        },
        {
            "title": "Ludwig Hülk",
            "email": null,
            "date": "2018-02-21",
            "object": "license",
            "comment": "Update license to CC0"
        },
        {
            "title": "htw-pv3-sose2020",
            "email": null,
            "date": "2020-05-10",
            "object": "metadata",
            "comment": "update metadata to 1.4"
        }
    ],
    "resources": [
        {
            "profile": "tabular-data-resource",
            "name": "pv3.db_log",
            "path": null,
            "format": "PostgreSQL",
            "encoding": "UTF-8",
            "schema": {
                "fields": [
                    {
                        "name": "id",
                        "description": "Unique identifier",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "project",
                        "description": "Project name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "version",
                        "description": "Scenario version",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "io",
                        "description": "Input or output",
                        "type": "boolean",
                        "unit": null
                    },
                    {
                        "name": "schema_name",
                        "description": "Schema name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "table_name",
                        "description": "Table name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "script_name",
                        "description": "Script name",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "entries",
                        "description": "Number of rows",
                        "type": "serial",
                        "unit": null
                    },
                    {
                        "name": "comment",
                        "description": "Current status and comments",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "user_name",
                        "description": "Author (session user)",
                        "type": "text",
                        "unit": null
                    },
                    {
                        "name": "timestamp",
                        "description": "Timestamp without time zone",
                        "type": "timestamp",
                        "unit": "YYYY-MM-DD HH:MM:SS"
                    },
                    {
                        "name": "meta_data",
                        "description": "Copy of the input metadata",
                        "type": "file",
                        "unit": null
                    }
                ],
                "primaryKey": [
                    "id"
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
                "delimiter": null,
                "decimalSeparator": "."
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

-- Scenario Log function
DROP FUNCTION IF EXISTS     public.db_log(text,text,text,text,text,text,text);
CREATE OR REPLACE FUNCTION  public.db_log(text,text,text,text,text,text,text)
    RETURNS text AS 
    $$
    DECLARE
        _project        ALIAS FOR $1;
        _version        ALIAS FOR $2;
        _io             ALIAS FOR $3;
        _schema_name    ALIAS FOR $4;
        _table_name     ALIAS FOR $5;
        _script_name    ALIAS FOR $6;
        _comment        ALIAS FOR $7;
    BEGIN
        EXECUTE 'INSERT INTO pv3.db_log ' ||
            '(project,version,io,schema_name,table_name,script_name,entries,comment,user_name,timestamp,meta_data)
            SELECT ' || quote_literal(_project) || ',' || 
                quote_literal(_version) || ',' || 
                quote_literal(_io) || ',' ||
                quote_literal(_schema_name) || ',' ||
                quote_literal(_table_name) || ',' ||
                quote_literal(_script_name) || ',' ||
                'COUNT(*),' ||
                quote_literal(_comment) || ',' || 
                'session_user,' ||
                E'NOW() AT TIME ZONE \'Europe/Berlin\' ,' ||
                E'obj_description(\'' || _schema_name || '.' || _table_name  || E'\' ::regclass) ::json ' || 
            'FROM ' || _schema_name || '.' || _table_name || ';' ;
        RETURN 'inserted';
    END;
    $$ LANGUAGE plpgsql;

-- Access rights
ALTER FUNCTION db_log(text,text,text,text,text,text,text) OWNER TO role_user;
GRANT EXECUTE ON FUNCTION db_log(text,text,text,text,text,text,text) TO role_user;

-- Database Logging (project,version,io,schema_name,table_name,script_name,comment)
SELECT db_log('PV3','v0','setup','pv3','db_log','htw_pv3_postgresql_4_function_db_log.sql','Function test');

-- Select latest entry
SELECT * FROM pv3.db_log ORDER BY id DESC LIMIT 1;
