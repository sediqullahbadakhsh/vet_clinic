/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals;
SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3;

/* Updating and Use of TRANSACTIONS*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals

BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals

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

/*Answering the Questions*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) AS average_weight FROM animals ;
SELECT * FROM animals ORDER BY escape_attempts DESC LIMIT 1;
SELECT * FROm animals ORDER BY neutered DESC LIMIT 7;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/*3rd Milstone: answering the Questions */

SELECT * FROM animals
JOIN owners ON owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT * FROM animals
JOIN species ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name AS owner_name, animals.name AS animal_name FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT species.name AS species, count(*)  FROM animals
JOIN species ON species_id = species.id
GROUP BY species.id;

SELECT animals.name AS animal 
FROM animals
JOIN species ON species_id = species.id
WHERE species.name = 'Digimon' AND owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell');

SELECT animals.name AS animal 
FROM animals
JOIN owners ON owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester');

SELECT owners.full_name AS owns_most_animals, count(animals.*)
FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY count(animals.*) DESC
LIMIT 1;

/*4th Milstone: answering the questions */
SELECT
    animals.name AS animal,
    visits.date_of_visit
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.name = 'William Tatcher'
ORDER BY
    date_of_visit DESC
LIMIT 1;

SELECT
    count(new.*) AS "Different animals seen by Stephanie Mendez"
FROM (
    SELECT
        animals.name
    FROM
        visits
        JOIN vets ON visits.vets_id = vets.id
        JOIN animals ON animals.id = visits.animals_id
    WHERE
        vets.name = 'Stephanie Mendez'
    GROUP BY
        animals.name) AS new;

SELECT
    vets.name AS vet,
    species.name AS specialties
FROM
    specializations AS s
    RIGHT JOIN vets ON vets.id = s.vets_id
    LEFT JOIN species ON species.id = s.species_id;

SELECT
    vets.name AS vet,
    animals.name AS animals,
    visits.date_of_visit
FROM
    visits
    JOIN vets ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
WHERE
    visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
    AND vets.name = 'Stephanie Mendez';

SELECT
    animals.name AS Animal,
    count(visits.date_of_visit) AS "Number of visits"
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
GROUP BY
    animals.name
ORDER BY
    count(visits.date_of_visit) DESC
LIMIT 1;

SELECT
    vets.name AS vets,
    animals.name AS animal,
    visits.date_of_visit
FROM
    visits
    JOIN animals ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
WHERE
    vets.name = 'Maisy Smith'
ORDER BY
    visits.date_of_visit
LIMIT 1;

SELECT
    animals.name AS animal,
    animals.date_of_birth,
    animals.neutered,
    animals.escape_attempts,
    animals.weight_kg,
    vets.name AS vet,
    vets.age,
    vets.date_of_graduation,
    visits.date_of_visit
FROM
    animals
    JOIN visits ON animals.id = visits.animals_id
    JOIN vets ON vets.id = visits.vets_id
ORDER BY
    visits.date_of_visit DESC
LIMIT 1;

SELECT
    count(new.*) AS "Visits to vet not specialized in that animal's species"
FROM (
    SELECT
        vets.name AS vet,
        s.species_id AS specialization,
        animals.species_id
    FROM
        specializations AS s
        JOIN vets ON vets.id = s.vets_id
        JOIN visits ON visits.vets_id = vets.id
        JOIN animals ON animals.id = visits.animals_id
    WHERE
        vets.name <> 'Stephanie Mendez') AS new
WHERE
    new.specialization <> new.species_id;

SELECT
    count(species.*),
    species.name AS specie
FROM
    visits
    JOIN vets ON visits.vets_id = vets.id
    JOIN animals ON animals.id = visits.animals_id
    JOIN species ON species.id = animals.species_id
WHERE
    vets.name = 'Maisy Smith'
GROUP BY
    species.name
ORDER BY
    count DESC
LIMIT 1;