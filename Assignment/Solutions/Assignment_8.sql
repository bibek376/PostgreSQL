
--Assignment-8
--
--1. Create a function that takes department ID for
--the department to the employee in the department with highest salary. 


-- Logic in SQL Query

select * from 
(select e.employee_id,e.salary,e.department_id ,
dense_rank() over (partition by e.department_id order by e.salary desc) "dr"
from employees e)tt
where tt.department_id=50
and tt.dr=1;


--Function Part
create or replace function dept_wise_highest_salary(dept_id int)
returns table(
			employee_id int,
			salary numeric(8,2),
			department_id int,
			dr bigint 
)
		
as
$$
declare 
id varchar;
begin 
	return query
		select * from 
		(select e.employee_id,e.salary,e.department_id ,
		dense_rank() over (partition by e.department_id order by e.salary desc) "dr"
		from employees e)tt
		where tt.department_id=dept_id
		and tt.dr=1;
end;
$$
language 'plpgsql';


--Function Call
select * from dept_wise_highest_salary(90);

--Function Drop
drop function dept_wise_highest_salary(dept_id int);





--2. Create a function that takes employee ID and 
--return the total number of jobs done by the employee in the past.

--SQL Logic

select * from job_history jh ;

select jh.employee_id ,count(jh.job_id) "job_count" 
from job_history jh
where jh.employee_id=200
group by jh.employee_id;


select count(jh.job_id) "job_count" 
from job_history jh
group by jh.employee_id;

--Function Creation 

create or replace function jobs_done(e_id int)
returns table(
			emp_id int,
			job_count bigint
)

as 
$$
declare
begin
	return query
	select jh.employee_id ,count(jh.job_id) "job_count" 
	from job_history jh
	where jh.employee_id=e_id
	group by jh.employee_id;
	
end;
$$
language 'plpgsql';

select * from jobs_done(200);

--Function Drop
drop function jobs_done(e_id int);

--3. Create a function where Display
--5th and 10th employees in Employees table.

--SQL Logic

select tt.employee_id,tt.first_name,tt.last_name,tt.salary
from 
(select e.*,
row_number() over (order by e.employee_id) "rn"  
from employees e)tt
where tt.rn=5 
or tt.rn=10;

--Function Creation 
create or replace function v_and_x()
returns table(
			emp_id int,
			first_name varchar,
			last_name varchar,
			salary numeric
)

as
$$
declare
begin
	return query
	select tt.employee_id,tt.first_name,tt.last_name,tt.salary
	from 
	(select e.*,
	row_number() over (order by e.employee_id) "rn"  
	from employees e)tt
	where tt.rn=5 
	or tt.rn=10;
end;
$$
language 'plpgsql';

--Value Check
select * from v_and_x();

--Function Drop
drop function v_and_x();

--4. Create a function to find out the
--name of the employee and their name of the cities.

--SQL Logic
select e.first_name,l.city 
from employees e
inner join departments d
on d.department_id=e.department_id 
inner join locations l 
on l.location_id =d.location_id;


create or replace function emp_and_city()
returns table(
			first_name varchar,
			city varchar
)

as
$$
declare
begin
	return query
	select e.first_name,l.city 
	from employees e
	inner join departments d
	on d.department_id=e.department_id 
	inner join locations l 
	on l.location_id =d.location_id;
end;

$$

language 'plpgsql';


select * from emp_and_city();





