-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.developer
(
    "studioName" character varying COLLATE pg_catalog."default",
    "studioId" uuid
);

CREATE TABLE IF NOT EXISTS public.games
(
    "gameName" character varying COLLATE pg_catalog."default",
    "gameId" uuid PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS public.genre
(
    "genreName" character varying COLLATE pg_catalog."default",
    "genreId" uuid
);

CREATE TABLE IF NOT EXISTS public.platform
(
    "platName" character varying COLLATE pg_catalog."default",
    "platId" uuid
);

CREATE TABLE IF NOT EXISTS public."yearOfRelease"
(
    "yearNum" integer,
    "yearId" uuid
);

ALTER TABLE IF EXISTS public.developer
    ADD FOREIGN KEY ("studioId")
    REFERENCES public.games ("gameId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.games
    ADD FOREIGN KEY ("gameId")
    REFERENCES public.genre ("genreId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.games
    ADD FOREIGN KEY ("gameId")
    REFERENCES public.platform ("platId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.games
    ADD FOREIGN KEY ("gameId")
    REFERENCES public."yearOfRelease" ("yearId") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;