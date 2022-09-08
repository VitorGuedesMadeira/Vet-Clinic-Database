/* Database schema to keep the structure of entire database. */

-- animals TABLE --

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg REAL NOT NULL
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, true, '10.23');

-- INSERT 0 1

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, true, '8');

-- INSERT 0 1 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, false, '15.04');

-- INSERT 0 1

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, true, '11');

-- INSET 0 1

