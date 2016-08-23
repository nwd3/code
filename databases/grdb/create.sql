-- Create the grading user and database. 
-- See ../README.md for details.

-- Create the user.
DROP USER grdb CASCADE;
CREATE USER grdb 
	IDENTIFIED BY bjarne
	QUOTA 5M ON System;
GRANT 
	CONNECT,
	CREATE TABLE,
	CREATE SESSION,
	CREATE SEQUENCE,
	CREATE VIEW,
	CREATE MATERIALIZED VIEW,
	CREATE PROCEDURE,
	CREATE TRIGGER,
	UNLIMITED TABLESPACE
	TO grdb;

-- Connect to the user's account/schema.
CONNECT grdb/bjarne;

-- (Re)Create the database.
DEFINE grdb=c:\projects\cs342\kvlinden\src\databases\grdb
@&grdb\load
