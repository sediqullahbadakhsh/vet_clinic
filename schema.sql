/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOL,
	weight_kg DECIMAL,
	PRIMARY KEY (id)
);

/* Add species column*/
ALTER TABLE animals ADD species VARCHAR(250);

/* Updating and Use of TRANSACTIONS*/

ALTER TABLE animals ALTER COLUMN species UNDEFINED;
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
COMMIT;


BEGIN;
DELETE FROM animals where date_of_birth > '2022-01-01';
COMMIT;

BEGIN;
SAVEPOINT save1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK ;
SELECT * FROM animals;
COMMIT;

BEGIN;
UPDATE animals SET weight_kg =weight_kg*-1 WHERE weight_ks IS <0;
COMMIT;
