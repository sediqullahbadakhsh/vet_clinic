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

/*Create Tables: vets, Specializations and Visits*/

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(250),
	age int,
	date_of_graduation date
);

CREATE TABLE specializations(
  vets_id int,
  species_id int,
  FOREIGN KEY (vets_id) REFERENCES vets (id) on DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits(
  id int GENERATED ALWAYS AS IDENTITY,
  animals_id int,
  vets_id int,
  date_of_visit date,
  FOREIGN KEY (animals_id) REFERENCES animals (id) on DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (vets_id) REFERENCES vets (id) on DELETE RESTRICT ON UPDATE CASCADE,
  PRIMARY KEY (id, animals_id, vets_id)
);


/*5th Milstone: altering owners table*/

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

/* Creating Indexes for Visits and Owners Tables, improving performatnce*/
Begin;
CREATE INDEX vets_id_asc ON visits(vets_id ASC);
commit;

BEGIN;
CREATE INDEX owners_email_asc ON owners(email ASC);
COMMIT;