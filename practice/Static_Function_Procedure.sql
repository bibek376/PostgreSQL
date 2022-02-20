
--Function and Procedure

--function--> return type
--Procedure--> No return type

--insert,delete,update-->return boolean


create table accounts (
    id int ,
    name varchar(100) not null,
    balance dec(15,2) not null,
    primary key(id)
);

insert into accounts(id,name,balance)
values(1,'Bob',10000);

insert into accounts(id,name,balance)
values(2,'Alice',10000);


--Syntax

--
--create or replace function abc
--
--is/as
--
--declare 
--
--begin 
--	
--	actual logic
--
--	exception handeling
--	
--end;


--Insert Function
select * from accounts a ;


create or replace function account_insert(u_id int,name varchar(30),
										  balance dec)
returns boolean

as 
$$
declare 
dynamicQuery varchar;
begin 
	insert into accounts values(u_id,name,balance);
	return true;

end;
$$

language 'plpgsql';

select * from accounts a ;

select * from account_insert(3,'Bibek',20000);
select * from account_insert(4,'Test_Data',2000);


--Update 
--SQL Logic
--update accounts a set a.balance=----
--where condition 

update accounts  set name='Test_Data' 
where id=4;

create or replace function update_account(v_id int,v_name varchar(30) )
returns boolean

as
$$
declare
	dynamicQuery varchar;
begin
	update accounts  
	set name= v_name 
	where id=v_id; 
	return true;
end;
$$
language 'plpgsql';


select * from accounts a ;

select * from update_account(4,'Test');

drop function update_account(v_id int,v_name varchar(30) );


--Delete 

create or replace function acc_delete(u_id int)
returns boolean

as 
$$
declare 
	dynamicQuery varchar;
begin 
	delete from accounts where id=u_id;
	return true;
end;

$$
language 'plpgsql';


select * from acc_delete(4); 

select * from accounts a ;




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



