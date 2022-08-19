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
    createat timestamp DEFAULT now(),
    updateat timestamp DEFAULT now()
);

CREATE TABLE genero (
    id SERIAL NOT NULL PRIMARY KEY,
    title varchar NOT NULL,
    code varchar NOT NULL UNIQUE,
    createat timestamp DEFAULT now(),
    updateat timestamp DEFAULT now()
);

CREATE TABLE chapter (
    id SERIAL NOT NULL PRIMARY KEY,
    id_comic int NOT null,
    title varchar NOT NULL,
    number float NOT NULL,
    createat timestamp DEFAULT now(),
    updateat timestamp DEFAULT now(),
    CONSTRAINT fk_comic FOREIGN KEY(id_comic) REFERENCES comic(id)
);

CREATE TABLE content_chapter (
    id SERIAL NOT NULL PRIMARY KEY,
    id_chapter int NOT null,
    content text NOT NULL,
    type varchar NOT NULL,
    createat timestamp DEFAULT now(),
    updateat timestamp DEFAULT now(),
    CONSTRAINT fk_chapter FOREIGN KEY(id_chapter) REFERENCES chapter(id)
);

CREATE TABLE file (
    id SERIAL NOT NULL PRIMARY KEY,
    id_user int NOT null,
    path text NOT NULL,
    name varchar NOT NULL,
    size int NOT NULL,
    createat timestamp DEFAULT now(),
    updateat timestamp DEFAULT now()
);