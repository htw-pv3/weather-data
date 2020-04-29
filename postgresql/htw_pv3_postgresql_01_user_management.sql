/*
PostgreSQL database user management

Execute on database "postgres" with superuser "postgres". 
Create three groups with different rights (read, write, admin). 
Create a user for each right. 
Create a user named "sonnja". 

__copyright__   = "© Reiner Lemoine Institut"
__license__     = "GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)"
__url__         = "https://www.gnu.org/licenses/agpl-3.0.txt"
__author__      = "Ludwig Hülk"
*/


-- Groups
DROP ROLE IF EXISTS role_read; 
CREATE ROLE role_read WITH NOLOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT NOREPLICATION; -- Read only

DROP ROLE IF EXISTS role_user; 
CREATE ROLE role_user WITH NOLOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT NOREPLICATION; 
GRANT role_read TO role_user; -- Insert, Update, Delete and Read

DROP ROLE IF EXISTS role_admin; 
CREATE ROLE role_admin WITH NOLOGIN SUPERUSER CREATEDB CREATEROLE REPLICATION; 
GRANT role_user TO role_admin; -- Admin, can create user and databases

-- User
DROP USER IF EXISTS user_read; 
CREATE USER user_read LOGIN PASSWORD 'read' NOSUPERUSER INHERIT NOCREATEDB CREATEROLE REPLICATION;
GRANT role_read TO user_read; -- 2017-04-17 LH

DROP USER IF EXISTS user_write; 
CREATE USER user_write LOGIN PASSWORD 'write' NOSUPERUSER INHERIT NOCREATEDB CREATEROLE REPLICATION; 
GRANT role_user TO user_write; -- 2017-04-17 LH

DROP USER IF EXISTS user_admin; 
CREATE USER user_admin LOGIN PASSWORD 'admin' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION; 
GRANT role_admin TO user_admin; -- 2017-04-17 LH

DROP USER IF EXISTS sonnja; 
CREATE USER sonnja LOGIN PASSWORD 'sonnja' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION; 
GRANT role_admin TO sonnja; -- 2018-04-25 LH
