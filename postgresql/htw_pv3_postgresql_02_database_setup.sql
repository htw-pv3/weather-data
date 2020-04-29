/*
Setup a new database "sonnja_db"

Create a new database by executing the code (first part) on database "postgres" or manually with right click -> new -> database. 
Create a comment on database by executing the code (second part) on new database "sonnja_db". 
Activate extension "postgis" on new database; 
    Must be installed manually from http://postgis.net/. 
    PostGIS version must match PostgreSQL version. 

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)"
__url__         = "https://www.gnu.org/licenses/agpl-3.0.txt"
__author__      = "Ludwig Hülk"
*/


/* -- Create a new database (execute manually)
CREATE DATABASE sonnja_db
    WITH 
    OWNER = sonnja
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
*/

-- Database comment (execute with user "sonnja" on database "sonnja_db")
COMMENT ON DATABASE sonnja_db
    IS 'Sonnja! Database';

-- Postgis extension (must be installed manually first)
DROP EXTENSION IF EXISTS postgis;
CREATE EXTENSION postgis;
