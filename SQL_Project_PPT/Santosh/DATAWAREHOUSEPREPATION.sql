drop table salary_fact;
drop table hire_date_dim ;
drop table employees_dim ;
drop table locations_dim;

create table hire_date_dim(
	hire_date date primary key,
	YearNumber nvarchar(255) not null,
	QuaterNumber nvarchar(255) not null,
	MonthNumber nvarchar(255) not null,
	DayNumber nvarchar(255) not null
	
);


create table employees_dim(
	employee_id int primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email varchar(255) not null,
	phone_number varchar(255),
	department_name varchar(255) not null,
	job_title varchar(255) not null
);

create table locations_dim(
	location_id int primary key,
	street_address varchar(255) not null,
	city varchar(255) not null,
	country_name varchar(255) not null,
	region_name varchar(255) not null
);

create table salary_fact (
	hire_date date not null,
	employee_id int not null,
	location_id int not null,
	salary int not null,
	CONSTRAINT fk_hire_date foreign key (hire_date) references hire_date_dim (hire_date),
	CONSTRAINT fk_employee_id foreign key (employee_id) references employees_dim  (employee_id),
	CONSTRAINT fk_location_id foreign key (location_id) references locations_dim  (location_id)
);


select * from salary_fact;
select * from hire_date_dim;
select * from employees_dim;
select * from locations_dim;


truncate table salary_fact;
delete from hire_date_dim;
delete from employees_dim;
delete from locations_dim;
