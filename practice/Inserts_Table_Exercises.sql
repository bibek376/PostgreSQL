--PostgreSQL Create Table - Exercises, Practice


-- 1. Write a SQL statement to create a simple table countries including columns 
-- country_id,country_name and region_id.

create table country(
	country_id int,
	country_name varchar(50),
	region_id decimal(10,0) 
);

select * from country c;

-- 2. Write a SQL statement to create a simple table countries including 
-- columns country_id,country_name and region_id which already exist.

create table country(
	country_id int,
	country_name varchar(50),
	region_id decimal(10,0) 
);


-- 3. Write a SQL statement to create the structure of a 
-- table dup_countries similar to countries.

create table dup_countries(
	country_id int,
	country_name varchar(50),
	region_id decimal(10,0) 
);

-- OR 

create table dup_country
as 
(select * from country) with no data; 

select * from dup_country as d;


-- 4. Write a SQL statement to create a duplicate copy of country table 
-- including structure and data by name duplicate_table.


create table duplicate_table
as 
(select * from country);



-- 5. Write a SQL statement to create a table countries set a constraint NULL.

create table countries(
	country_id int
);

alter table countries alter column country_id set not null;


-- 6. Write a SQL statement to create a table named jobs including columns 
-- job_id, job_title, min_salary, max_salary and check whether the max_salary 
-- amount exceeding the upper limit 25000.


create table job(
	job_id int,
	job_title varchar(30),
	min_salary decimal(5,0),
	max_salary decimal(5,0),
	check(max_salary>25000)	
);

alter table job drop constraint job_max_salary_check;
alter table job add constraint check_max check(max_salary<=25000);


-- 7. Write a SQL statement to create a table named countries including 
-- columns country_id, country_name and region_id and make sure that no 
-- countries except Italy, India and China will be entered in the table.



drop table countries ;
create table countries(
	country_id int,
	country_name varchar(30),
	region_id int,
	check(country_name in ('India','China','Italy'))
);

insert into countries(country_name) values('India');
insert into countries(country_name) values('Nepal'); -- not inserted



-- 8. Write a SQL statement to create a table named countries including 
-- columns country_id,country_name and region_id and make sure that no duplicate
-- data against column country_id will be allowed at the time of insertion.

create table countries(
	country_id int unique,
	country_name varchar(30),
	region_id int
);

alter table countries alter column country_id set not null;

-- 9. Write a SQL statement to create a table named jobs including columns
-- job_id, job_title, min_salary and max_salary, and make sure that, the default
-- value for job_title is blank and min_salary is 8000 and max_salary is NULL 
-- will be entered automatically at the time of insertion if no value assigned 
-- for the specified columns.

create table jobs(
	job_id int,
	job_title varchar(30) default 'Manager',
	min_salary decimal(5,0) not null,
	max_salary decimal(5,0) default null,
	check(min_salary>=8000)
);

select * from jobs;

drop table jobs;


-- 10. Write a SQL statement to create a table named countries including columns
-- country_id, country_name and region_id and make sure that the country_id 
-- column will be a key field which will not contain any duplicate data at the time of insertion.

drop table countries;

create table countries(
	country_id int not null unique,
	country_name varchar(30),
	region_id int
);


-- 11. Write a SQL statement to create a table countries including columns 
-- country_id, country_name and region_id and make sure that the column 
-- country_id will be unique and store an auto-incremented value.


create table countries(
	country_id bigserial primary key,
	country_name varchar(30),
	region_id int
);

-- 12. Write a SQL statement to create a table countries including 
-- columns country_id, country_name and region_id and make sure that 
-- the combination of columns country_id and region_id will be unique.

drop table countries;
create table countries(
	country_id int,
	country_name varchar(30),
	region_id int,
	unique(country_id,region_id)
);

-- 13. Write a SQL statement to create a table job_history including columns
-- employee_id, start_date, end_date, job_id and department_id and make sure 
-- that, the employee_id column does not contain any duplicate value at the time
-- of insertion and the foreign key column job_id contain only those values 
-- which exist in the jobs table.

drop table jobs;
drop table job_history;

create table jobs(
	job_id int unique,
	job_title varchar(30) default 'Manager',
	min_salary decimal(5,0) not null,
	max_salary decimal(5,0) default null,
	check(min_salary>=8000)
);

create table job_history(
	emp_id int primary key,
	start_date date,
	end_date date,
	job_id int,
	department_id int not null,
	constraint fk_job_id foreign key(job_id) references jobs(job_id)
);

-- 14. Write a SQL statement to create a table employees including columns
-- employee_id, first_name, last_name, email, phone_number, hire_date, job_id, 
-- salary, commission, manager_id and department_id and make sure that, 
-- the employee_id column does not contain any duplicate value at the time of 
-- insertion and the foreign key columns combined by department_id and 
-- manager_id columns contain only those unique combination values, which 
-- combinations exist in the departments table.

create table if not exists dept(
	dept_id int,
	dept_name varchar(50),
	manager_id numeric(4,0),
	location_id numeric(6,0),
	constraint pk_dept primary key(dept_id,manager_id)
);


create table if not exists emp(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30),
	phone_number int,
	hire_date date,
	job_id int,
	salary int,
	commission int,
	manager_id int,
	department_id int,
	constraint pk_emp_id primary key(employee_id),
	constraint fk_dept foreign key(department_id,manager_id) references dept(dept_id,manager_id)	
);



-- 15. Write a SQL statement to create a table employees including columns 
-- employee_id, first_name, last_name, email, phone_number hire_date, job_id, 
-- salary, commission, manager_id and department_id and make sure that, 
-- the employee_id column does not contain any duplicate value at the 
-- time of insertion, and the foreign key column department_id, reference
-- by the column department_id of departments table, can contain only 
-- those values which are exist in the departments table and another 
-- foreign key column job_id, referenced by the column job_id of jobs table, 
-- can contain only those values which exist in the jobs table.

drop table emp;

create table if not exists emp(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30),
	phone_number int,
	hire_date date,
	job_id int,
	salary int,
	commission int,
	manager_id int,
	department_id int,
	constraint pk_emp_id primary key(employee_id),
    constraint fk_dept foreign key(department_id) references dept(dept_id),
	constraint fk_jobs foreign key(job_id) references jobs(job_id)
);

select * from dept;



-- 16. Write a SQL statement to create a table employees including columns employee_id, 
-- first_name, last_name, job_id, salary and make sure that, the employee_id column 
-- does not contain any duplicate value at the time of insertion, and the foreign key
-- column job_id, referenced by the column job_id of jobs table, can contain only those 
-- values which exist in the jobs table. The specialty of the statement is that the ON UPDATE CASCADE
-- action allows you to perform the cross-table update and ON DELETE RESTRICT action rejects the deletion. The default action is ON DELETE RESTRICT.


 

CREATE TABLE IF NOT EXISTS jobs1 ( 
JOB_ID INTEGER NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT NULL
);



create table if not exists emp(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	job_id int,
	salary int,
	constraint pk_emp_id primary key(employee_id),
	constraint fk_jobs foreign key(job_id) references jobs(job_id) on delete cascade
);


-- 17. Write a SQL statement to create a table employees including columns employee_id, 
-- first_name, last_name, job_id, salary and make sure that, the employee_id column 
-- does not contain any duplicate value at the time of insertion, and the foreign key column 
-- job_id, referenced by the column job_id of jobs table, can contain only those values which 
-- exist in the jobs table. The specialty of the statement is that the ON DELETE CASCADE that 
-- lets you allow to delete records in the employees(child) table that refers to a record in the 
-- jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT 
-- actions reject any updates.

drop table emp;

create table if not exists emp(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	job_id int,
	salary int,
	constraint pk_emp_id primary key(employee_id),
	constraint fk_jobs foreign key(job_id) references jobs(job_id) on delete cascade on update restrict
);


-- 18. Write a SQL statement to create a table employees including columns employee_id, first_name,
-- last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate
-- value at the time of insertion, and the foreign key column job_id, referenced by the column job_id
-- of jobs table, can contain only those values which exist in the jobs table. The specialty of the
-- statement is that the ON DELETE SET NULL action will set the foreign key column values in the child
-- table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition
-- that the foreign key column in the child table must accept NULL values and the ON UPDATE SET NULL
-- action resets the values in the rows in the child table(employees) to NULL values when the rows in 
--the parent table(jobs) are updated.

create table if not exists emp(
	employee_id int,
	first_name varchar(30),
	last_name varchar(30),
	job_id int,
	salary int,
	constraint pk_emp_id primary key(employee_id),
	constraint fk_jobs foreign key(job_id) references jobs(job_id) on delete set null on update set null
);


-- 19. Write a SQL statement to create a table employees including columns employee_id, first_name, 
-- last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate
--  value at the time of insertion, and the foreign key column job_id, referenced by the column
--  job_id of jobs table, can contain only those values which exist in the jobs table. The specialty
--  of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject
-- the deletion and any updates.


create table if not exists emp(
	employee_id bigserial,
	first_name varchar(30),
	last_name varchar(30),
	job_id int,
	salary int,
	constraint pk_emp_id primary key(employee_id),
	constraint fk_jobs foreign key(job_id) references jobs(job_id) on delete no action on update no action
);

















































































































