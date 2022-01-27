select * from location limit 5;

alter table location alter column location_id set not null;


-- 1. Write a SQL statement to rename the table location to location_new.

alter table location rename to location_new;

-- 2. Write a SQL statement to add a column region_id to the table location_new.
alter table location_new add column "region id" varchar(30);


select * from location_new limit 5;


-- 3. Write a SQL statement to change the data type of the column region_id to
--    text in the table location_new.

alter table location_new alter "region id" type text;


-- 4. Write a SQL statement to drop the column region id from the table 
-- locations_new.


alter table location_new drop "region id";

-- 5. Write a SQL statement to change the name of the column state_province 
--    to state, keeping the data type and size same.


alter table location_new rename column state_province  to state;



-- 6. Write a SQL statement to add a primary key for the columns 
-- location_id in the locations_new table.


select * from location_new limit 5;


alter table location_new add constraint pk_loc_id primary key(location_id);

-- 7. Write a SQL statement to add a primary key for a combination of columns 
--location_id and country_id.

-- Let's drop the primary constraint first
alter table location_new drop constraint pk_loc_id;



alter table location_new add constraint pk_loc_ids 
primary key(location_id,country_id);


-- 8. Write a SQL statement to drop the existing primary from the table 
-- locations_new on a combination of columns location_id and country_id.

alter table location_new drop constraint pk_loc_ids;

-- 9. Write a SQL statement to add a foreign key on job_id column of job_history 
-- table referencing to the primary key job_id of jobs table.

create table jobs(
	job_id int not null,
	job_title varchar(30),
	min_salary numeric(6,0),
	max_salary numeric(6,0),
	primary key(job_id)
);

create table job_history(
	employee_id int not null,
	start_date date,
	end_date date,
	job_id varchar(30),
	department_id numeric(4,0)
);

-- Change the type varchar into int
alter table job_history alter job_id type int using job_id::integer;


alter table job_history add constraint job_pkey foreign key(job_id) 
references jobs(job_id);

--alter table job_history drop constraint jobs_pkey;

-- 10. Write a SQL statement to add a foreign key constraint named 
-- fk_job_id on job_id column of job_history table referencing to 
-- the primary key job_id of jobs table.

alter table job_history drop constraint job_pkey;

alter table job_history add constraint fk_job_id foreign key(job_id)
references jobs(job_id); 


-- 11. Write a SQL statement to drop the existing foreign key fk_job_id from 
-- job_history table on job_id column which 
-- is referencing to the job_id of jobs table.

alter table job_history drop constraint fk_job_id;


-- 12. Write a SQL statement to add an index named index_job_id on job_id 
-- column in the table job_history.

CREATE UNIQUE INDEX CONCURRENTLY index_job_id ON job_history(job_id);

alter table job_history add constraint index_job_id primary key
using index index_job_id;


-- 13. Write a SQL statement to drop the index indx_job_id from job_history table.

alter table job_history drop constraint index_job_id; 














