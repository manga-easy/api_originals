CREATE TABLE manga_details (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    uniqueid varchar NOT NULL UNIQUE,
    sinopse varchar(2048) NOT NULL,
    autor varchar NOT NULL,
    year int NOT NULL,
    scans json NOT NULL,
    status boolean NOT NULL,
    cover varchar NOT NULL,
);

CREATE TABLE genero (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE
);

CREATE TABLE chapter (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE,
    imagens json NOT NULL,
    date_up timestamp DEFAULT now(),
);