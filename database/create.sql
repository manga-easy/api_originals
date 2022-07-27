CREATE TABLE comic (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    uniqueid varchar NOT NULL UNIQUE,
    sinopse text NOT NULL,
    autor varchar NOT NULL,
    year_up int NOT NULL,
    scans json NOT NULL,
    status boolean NOT NULL,
    cover varchar NOT NULL
);

CREATE TABLE genero (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE
);

CREATE TABLE chapter (
    id SERIAL NOT NULL PRIMARY KEY,
    id_comic int NOT null,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE,
    imagens json NOT NULL,
    date_up timestamp DEFAULT now(),
    CONSTRAINT fk_comic FOREIGN KEY(id_comic) REFERENCES comic(id)
);