/*
SQL NULL VALUES 
SQL UPDATE STATEMENT
SQL DELETE STATEMENT
SQL ALTER TABLE
-- ADD COLUMN IN EXISTING COLUMN
-- MODIFY/ALTER COLUMN
-- ALTER TABLE-DROP COLUMN
*/

SHOW DATABASES;

CREATE DATABASE customer;

USE customer;

CREATE TABLE customer_info(
	id INTEGER AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    salary INTEGER,
    PRIMARY KEY(id)
);

SELECT * FROM customer_info;


INSERT INTO customer_info(fisrt_name,last_name,salary)
VALUES('Bibek','Rawat',5003);
-- ('Binaya','Rawat',5000),
-- ('Bikash','Thapa',4000),
-- ('Binita','Thapa',NULL);



