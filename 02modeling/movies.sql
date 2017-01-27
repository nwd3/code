-- This command file loads a simple movies database, dropping any existing tables
-- with the same names.
--
-- CS 342
-- Spring, 2015 
-- kvlinden

-- Drop current database
DROP TABLE Casting;
DROP TABLE Movie;
DROP TABLE Performer;
DROP TABLE StatusValue;

-- Create database schema
CREATE TABLE Movie (
	id integer,
	title varchar(70) NOT NULL, 
	year decimal(4), 
	score float,
	votes integer,	
	PRIMARY KEY (id),
	CHECK (year > 1900)
	);

CREATE TABLE Performer (
	id integer,
	name varchar(35),
	gender varchar(6),
	PRIMARY KEY (id),
	CHECK (gender in ('male', 'female'))
	);

CREATE TABLE StatusValue (
	id varchar(6),
	PRIMARY KEY (id)
);

CREATE TABLE Casting (
	movieId integer,
	performerId integer,
	status varchar(6),
	FOREIGN KEY (movieId) REFERENCES Movie(Id) ON DELETE CASCADE,
	FOREIGN KEY (performerId) REFERENCES Performer(Id) ON DELETE SET NULL,
	FOREIGN KEY (status) REFERENCES StatusValue(id)
	);

-- Load sample data
INSERT INTO Movie VALUES (1,'Star Wars',1977,8.9,200000);
INSERT INTO Movie VALUES (2,'Blade Runner',1982,NULL,500);

INSERT INTO Performer VALUES (1,'Harrison Ford', 'male');
INSERT INTO Performer VALUES (2,'Rutger Hauer', 'male');
INSERT INTO Performer VALUES (3,'The Mighty Chewbacca', 'male');

INSERT INTO StatusValue VALUES ('star');
INSERT INTO StatusValue VALUES ('costar');
INSERT INTO StatusValue VALUES ('other');

INSERT INTO Casting VALUES (1,1,'star');
INSERT INTO Casting VALUES (1,3,'costar');
INSERT INTO Casting VALUES (2,1,'star');
INSERT INTO Casting VALUES (2,2,'other');
