/*Queries that provide answers to the questions from all projects.*/

-- MONDAY

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- TUESDAY

BEGIN;
-- update species column to unspecified for all animals
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
-- delete all records in the animals table, then roll back the transaction
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT deleteAnimals;
SELECT * FROM animals; 
UPDATE animals
SET weight_kg = weight_kg * -1;
SELECT * FROM animals; 
ROLLBACK TO deleteAnimals;
UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) AS average_escapes FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'January 1, 1990' AND ' December 31, 2000';

-- WEDNESDAY

SELECT name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT animals.name, owners.full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;
SELECT COUNT(*), species.name AS species FROM animals JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name AS digimons_name, owners.full_name AS owner_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.species_id = 2 AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT full_name, COUNT(full_name) AS owns FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY full_name ORDER BY owns DESC LIMIT 1;

-- THURDAY