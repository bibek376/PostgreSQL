/*
1. SQL CREATE DATABASE
2. SQL DROP DATABASE 
3. SQL CREATE TABLE
4. SQL INSERT INTO TABLE
5. SQL DROP TABLE
*/

-- SHOW ALL THE DATABASE 
SHOW DATABASES;

CREATE DATABASE customer;

USE customer;

CREATE TABLE customer_info(
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT NOT NULL
);

SHOW TABLES;

SELECT * FROM customer_info;

INSERT INTO customer_info(id,first_name,last_name,age) VALUES 
(1,'Bibek','Rawat',12);

INSERT INTO customer_info(id,first_name,last_name,age) VALUES 
(1,'Krish','Naik',32);

SELECT * FROM customer_info;


DROP TABLE customer_info;

SHOW TABLES;

DROP DATABASE customer;

SHOW DATABASES;

