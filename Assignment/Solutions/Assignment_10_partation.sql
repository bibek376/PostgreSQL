--Assignment 10

-- 1. You are creating a data warehouse to track the number of
--telephone calls for a telecommunications company. 
--The design team has created the following table definition:

--This table will receive 100,00 rows per day.
--In order to manage this database, 
--you want to partition the table so

--that each partition contains the data from each month.
--When the month changes, the new data will be placed into 
--a new partition table.
--You need to define partitions for January 2022 through Feb 2022.

drop table calls;

create table calls
(
call_date	date,
origination_number	bigint,
designation_number	bigint,
duration	numeric
) partition by range(call_date);


create table partation_jan partition of calls for values
from ('2022-01-01') to ('2022-01-30');


create table partation_feb partition of calls for values
from ('2022-02-01') to ('2022-02-28')
  WITH (parallel_workers = 4);


insert into calls values
('2022-01-01',9863680379,9821813294,12.3);
insert into calls values
('2022-02-06',9863680379,9821813240,0.3);
insert into calls values
('2022-01-01',9863680379,9811113294,null);
insert into calls values
('2022-01-01',9821813294,9863680379,2);

insert into calls values
('2022-02-28',9821813294,9863680379,2);


select tableoid::regclass,* from calls ;



--2.  Create a List partition table on employees table where 
--partition should be based on job_id.
--i.e. All the create and insert script with 
--screenshot must be include here.

drop table emp_copy;

CREATE TABLE public.emp_copy (
	employee_id int NOT null ,
	first_name varchar(20) NULL,
	last_name varchar(25) NOT NULL,
	email varchar(25) NOT NULL,
	phone_number varchar(20) NULL,
	hire_date timestamp NOT NULL,
	job_id varchar(10) NOT NULL,
	salary numeric(8, 2) NULL,
	commission_pct numeric(2, 2) NULL,
	manager_id int4 NULL,
	department_id int4 NULL
) partition by list(job_id);


select * from emp_copy ec ;
select * from employees e ;


create table partation_1 partition of emp_copy for values
in ('IT_PROG','AD_VP');


create table partation_2 partition of emp_copy for values
in ('AD_PRES');

create table partation_3 partition of emp_copy default;









