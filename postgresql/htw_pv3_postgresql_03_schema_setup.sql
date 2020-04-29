/*
Setup a new database schema "pv3"

Execute on database "sonnja_db" with user "sonnja". 
Sets default user rights. 

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)"
__url__         = "https://www.gnu.org/licenses/agpl-3.0.txt"
__author__      = "Ludwig Hülk"
*/

-- Create schema
DROP SCHEMA IF EXISTS pv3 CASCADE;
CREATE SCHEMA pv3; COMMENT ON SCHEMA pv3 IS 'MA3 data'; 
GRANT ALL ON SCHEMA pv3 TO role_user WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA pv3 GRANT ALL ON TABLES TO role_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA pv3 GRANT ALL ON SEQUENCES TO role_user;
GRANT USAGE ON SCHEMA pv3 TO role_read WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA pv3 GRANT SELECT ON TABLES TO role_read;
ALTER DEFAULT PRIVILEGES IN SCHEMA pv3 GRANT SELECT ON SEQUENCES TO role_read;
ALTER SCHEMA pv3 OWNER TO sonnja;
