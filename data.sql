/* Populate database with sample data. */

INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Agumon','2020-02-03',0,true,10.23);

INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Gabumon','2018-11-15',2,true,8);

INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Pikachu','2021-01-07',1,false,15.04);

INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Devimon','2017-05-12',5,true,11);

/*Add new Data*/
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Charmander','2020-02-08',0,false,11);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Plantmon','2021-11-015',2,true,5.7);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Squirtle','1993-05-02',3,false,12.13);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Angemon','2005-04-12',1,true,45);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Boarmon','2005-06-07',7,true,20.04);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Blossom','1998-10-13',3,true,17);
INSERT INTO animals 
(name,date_of_birth,escape_attempts,neutered,weight_kg) 
VALUES('Ditto','2022-05-14',4,true,22);

/*Inserting Data into Owners and Species Tables*/

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
 ('Bob', 45),
('Melody Pond', 77),
 ('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (NAME)
VALUES ('Pokemon'),
 ('Digimon');

 /*updating animals data*/
 BEGIN;

UPDATE animals
SET species_id = CASE
    WHEN NAME LIKE '%mon'
    THEN (
      SELECT id
      FROM species
      WHERE NAME = 'Digimon'
    )
    ELSE (
      SELECT id
      FROM species
      WHERE NAME = 'Pokemon'
    )
  END;
  
  SELECT *
FROM animals;
COMMIT;


BEGIN;

UPDATE animals
SET owner_id = CASE
    WHEN NAME = 'Agumon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Sam Smith'
    )
    WHEN NAME = 'Gabumon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Jennifer Orwell'
    )
    WHEN NAME = 'Pikachu'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Jennifer Orwell'
    )
    WHEN NAME = 'Devimon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Bob'
    )
    WHEN NAME = 'Plantmon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Bob'
    )
    WHEN NAME = 'Charmander'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Squirtle'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Blossom'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Angemon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Dean Winchester'
    )
    WHEN NAME = 'Boarmon'
    THEN (
      SELECT id
      FROM owners
      WHERE full_name = 'Dean Winchester'
    )
  END;

SELECT *
FROM animals;

COMMIT;