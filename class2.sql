DROP DATABASE IF EXISTS imbd;

CREATE DATABASE imbd;

USE imbd;

CREATE TABLE film
(
	film_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(50),
	description VARCHAR(200),
	release_year INT,
	CONSTRAINT film_pk PRIMARY KEY (film_id)
);