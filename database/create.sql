CREATE TABLE comic (
    id SERIAL NOT NULL PRIMARY KEY,
    id_user varchar NOT NULL,
    title varchar NOT NULL,
    uniqueid varchar NOT NULL UNIQUE,
    sinopse text NOT NULL,
    autor varchar NOT NULL,
    year_up int NOT NULL,
    scans varchar NOT NULL,
    status boolean NOT NULL,
    cover varchar NOT NULL,
    date_at timestamp DEFAULT now(),
    date_up timestamp DEFAULT now(),
);

CREATE TABLE genero (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE,
    date_at timestamp DEFAULT now(),
    date_up timestamp DEFAULT now(),
);

CREATE TABLE chapter (
    id SERIAL NOT NULL PRIMARY KEY,
    id_comic int NOT null,
    title varchar NOT NULL,
    number float NOT NULL,
    date_at timestamp DEFAULT now(),
    date_up timestamp DEFAULT now(),
    CONSTRAINT fk_comic FOREIGN KEY(id_comic) REFERENCES comic(id)
);