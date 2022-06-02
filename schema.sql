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

/* Creating Owners Table*/

CREATE TABLE
  owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT
   
  );
  /*Creating Species Table*/

CREATE TABLE
  species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(250)
   
  );

  /*Modifying animals Table*/

ALTER TABLE animals DROP COLUMN IF EXISTS species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD
  CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id)
  ON
DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD
  CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners(id)
  ON
DELETE CASCADE;

