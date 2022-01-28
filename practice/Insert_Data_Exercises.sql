-- 1. Write a SQL statement to insert a record with your own value into
--    the table countries against each column.

create table country(
	country_id varchar(2),
	country_name varchar(40),
	region_id numeric(10,0)
);

insert into country values('C1','Nepal',1003);

select * from country;


-- 2. Write a SQL statement to insert one row into the table countries
--    against the column country_id and country_name.

insert into country (country_id,country_name) values('C2','China');


-- 3. Write a SQL statement to create duplicates of countries table named 
--    country_new with all structure and data.

create table country_new
as
(select * from country);

select * from country_new;


-- 4. Write a SQL statement to insert NULL values into region_id column
--    for a row of countries table.


insert into country(region_id) values(null);

delete from country where region_id=null and country_name=null and 
country_id=null;

insert into country values('C3','India',null);

select * from country;

-- 6. Write a SQL statement insert rows from the country_new table to 
--    countries table.
--    Here are the rows for country_new table. Assume that, the countries
--    table is empty.

drop table country;

select * from country_new ;


insert into country
(select * from country_new);


-- 7. Write a SQL statement to insert one row in the jobs table 
-- to ensure that no duplicate values will be entered into the job_id column.

create table jobs(
	job_id int,
	job_title varchar(50),
	min_salary numeric(5,0),
	constraint pk_job_id primary key(job_id)
);


insert into jobs values (1,'Engineer',25000);
insert into jobs values(2,'CA',30000);

--main
insert into jobs values(2,'Accountent',20000);
--
--SQL Error [23505]: ERROR: duplicate key value violates unique constraint "pk_job_id"
--  Detail: Key (job_id)=(2) already exists.



-- 8. Write a SQL statement to insert a record into the table country 
--    to ensure that, at country_id and the region_id combination will be 
--    entered once in the table.

select * from country;

insert into country(country_id,region_id) values('C4',1001);


-- 9. Write a SQL statement to insert rows into the table countries in which the
--    value of country_id column will be unique and auto incremented.


create table if not exists countries(
	country_id serial,
	country_name varchar(50) not null,
	region_id int not null
);

alter table countries add constraint pk_country_id primary key(country_id);

insert into countries(country_name,region_id) values('China',1003);
insert into countries(country_name,region_id) values('Korea',1004);


-- 10. Write a SQL statement to insert records into the table
--     countries to ensure that the country_id column will not contain any 
--     duplicate data and this will be automatically incremented and the 
--     column country_name will be filled up by 'N/A' if no value assigned to 
--     that column.

drop table countries ;

create table if not exists countries(
	country_id serial,
	country_name varchar(50) not null default 'N/A',
	region_id int not null,
	constraint pk_country_id primary key(country_id) 
);

insert into countries(region_id) values
(123);

select * from countries ;


-- 11. Write a SQL statement to insert rows into the job_history 
--     table in which one column job_id is containing those values which 
--     exist in job_id column of jobs table.

select job_id from jobs;


create table if not exists job_history(
	emp_id int primary key,
	dept_id int default null,
	job_id int not null,
	constraint fk_job_id foreign key(job_id) references jobs(job_id)
);


insert into job_history values(123,4,1);
insert into job_history values(12,null,89);

-- insert or update on table "job_history" violates foreign key constraint "fk_job_id"
--  Detail: Key (job_id)=(89) is not present in table "jobs".

-- 12. Write a SQL statement to insert rows into the table employees in which 
-- a set of columns department_id and manager_id contains a unique value and 
-- that combined value must have existed into the table departments.



create table if not exists department(
	DEPARTMENT_ID integer NOT NULL UNIQUE, 
	DEPARTMENT_NAME varchar(30) NOT NULL, 
	MANAGER_ID integer DEFAULT NULL, 
	LOCATION_ID integer DEFAULT NULL, 
	PRIMARY KEY (DEPARTMENT_ID,MANAGER_ID) 
);

INSERT INTO department VALUES(60,'SALES',201,89);
INSERT INTO department VALUES(61,'ACCOUNTS',201,89);
INSERT INTO department VALUES(80,'FINANCE',211,90);

select * from department ;

create table if not exists emp (
	EMPLOYEE_ID integer, 
	FIRST_NAME varchar(20) DEFAULT NULL, 
	LAST_NAME varchar(25) NOT NULL, 
	JOB_ID varchar(10) NOT NULL, 
	SALARY decimal(8,2) DEFAULT NULL, 
	department_id int,
	manager_id int,
	constraint pk_emp_id primary key (EMPLOYEE_ID),
	constraint fk_from_department foreign key (department_id,manager_id) references department(DEPARTMENT_ID,MANAGER_ID) 
);

insert into emp values(1,'Bibek','Rawat','B$',3200,60,201);
insert into emp values(2,'test','data','C1',3220,65,201);-- not execute
insert into emp values(3,'Bibek','Rawat','C2',3200,80,211);

select * from emp e;


-- 13. Write a SQL statement to insert rows into the table emp in which 
-- a set of columns department_id and job_id contains the values which must 
-- have existed into the table departments and jobs.

drop table emp;

create table if not exists emp (
	EMPLOYEE_ID integer, 
	FIRST_NAME varchar(20) DEFAULT NULL, 
	LAST_NAME varchar(25) NOT NULL, 
	JOB_ID int NOT NULL, 
	SALARY decimal(8,2) DEFAULT NULL, 
	department_id int,
	manager_id int,
	constraint pk_emp_id primary key (EMPLOYEE_ID),
	constraint fk_from_department foreign key (department_id) references department(DEPARTMENT_ID),
	constraint fk_from_job foreign key (JOB_ID) references jobs(job_id)
);

select * from jobs;
select * from department ;

INSERT INTO emp VALUES(510,'Alex','Hanes',1,18000,80,345);

select * from emp;


















