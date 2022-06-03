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
  
SELECT * FROM animals;
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

SELECT * FROM animals;

COMMIT;

/*Add data into Vets*/
INSERT INTO vets
    VALUES 
		(DEFAULT, 'William Tatcher', 45, '2000-04-23'),
		(DEFAULT, 'Maisy Smith', 26, '2019-01-17'),
		(DEFAULT, 'Stephanie Mendez', 64, '1981-05-04'),
		(DEFAULT, 'Jack Harkness', 38, '2008-06-08');

/*Add data into specialties*/
INSERT INTO specializations
    VALUES 
		(1, 1),
		(3, 1),
		(3, 2),
		(4, 2);
/*Add data to visits*/

SELECT * FROM animals;
SELECT * FROM vets;
INSERT INTO visits
  VALUES 
		(DEFAULT, 1, 1, '2020-05-24'),
		(DEFAULT, 1, 3, '2020-07-22'),
		(DEFAULT, 2, 4, '2021-02-02'),
		(DEFAULT, 3, 2, '2020-01-05'),
		(DEFAULT, 3, 2, '2020-03-08'),
		(DEFAULT, 3, 2, '2020-05-14'),
		(DEFAULT, 4, 3, '2021-05-04'),
		(DEFAULT, 5, 4, '2021-02-24'),
		(DEFAULT, 6, 2, '2019-12-21'),
		(DEFAULT, 6, 1, '2020-08-10'),
		(DEFAULT, 6, 2, '2021-04-07'),
		(DEFAULT, 7, 3, '2019-09-29'),
		(DEFAULT, 8, 4, '2020-10-03'),
		(DEFAULT, 8, 4, '2020-11-04'),
		(DEFAULT, 9, 2, '2019-01-24'),
		(DEFAULT, 9, 2, '2019-05-15'),
		(DEFAULT, 9, 2, '2020-02-27'),
		(DEFAULT, 9, 2, '2020-08-03'),
		(DEFAULT, 10, 3, '2020-05-24'),
		(DEFAULT, 10, 1, '2021-01-11');
		