
--Table For SQL Challange

CREATE TABLE IF NOT EXISTS salespersons(salesperson_id int, first_name varchar(255),
last_name varchar(255));

CREATE TABLE IF NOT EXISTS address (address_id int, salesperson_id  int, 
city varchar(255), state varchar(255), country varchar(255));

TRUNCATE TABLE address;

INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('1', 'Green', 'Wright');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('2', 'Jones', 'Collins');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('3', 'Bryant', 'Davis');

TRUNCATE TABLE address;

INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('1', '2', 'Los Angeles','California', 'USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('2', '3', 'Denver', 'Colorado','USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('3', '4', 'Atlanta', 'Georgia','USA');

select * from address;
select * from salespersons;

CREATE TABLE If Not Exists salemast(sale_id int, employee_id int, 
sale_date date, sale_amt int);
TRUNCATE TABLE salemast;
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500); 

