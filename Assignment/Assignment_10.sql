
--Assignment-10


--1. Whenever the job is changed for an employee write 
--the following details into job history. 
--Employee ID, old job ID, old departmen t ID, hire date of 
--the employee for start date, system date for end date.
drop table employee;
create table employee(e_id int primary key,dept_id int not null,
					job_id int,hire_date date not null );

drop table employee_audit;
create table employee_audit(e_id int,dept_id int,job_id int,
						    hire_date date,system_date timestamp);



create or replace function job_history_log()
returns trigger 
as 
$$
declare 
begin 
	if (TG_OP='DELETE') then
	insert into employee_audit 
	values(old.*,now());
	return old;

	elseif (TG_OP='UPDATE') then
	insert into employee_audit 
	values(old.*,now());
	return old;

	end if;
	return null; ---->result is ignored
end;

$$
language 'plpgsql';



create trigger history_log
after update or delete 
	on employee
for each row 
execute procedure job_history_log();

select * from employee;
select * from employee_audit; 

insert into employee values(1,900,60,'2012-08-12');
insert into employee values(2,900,50,'2012-08-1');
insert into employee values(3,200,90,'2014-09-12');
insert into employee values(4,400,50,'2016-12-12');

delete from employee where e_id=4;
update employee
set job_id=100 where e_id=1;

drop trigger history_log on employee;

--2. Create a trigger to ensure no changes can be 
--made to EMPLOYEES table before 6am and after 10pm in a day. 
--Hint: 
--if to_char(current_date,'hh24') < 6 or to_char(current_date,'hh24') > 10 then 
--RAISE EXCEPTION 'Sorry! No change can be made before 6 AM and after 10 PM'
-- end if; 
drop table emps;
create table emps(id int not null,name varchar not null);

drop table emps_audit;
create table emps_audit(id int,name varchar,change_time timestamp);

select * from emps;
select * from emps_audit;

create or replace function emp_log_restriction()
returns trigger 
as 
$$
declare 
begin
	if to_char(now()::time,'hh24')::int < 6 or to_char(now()::time,'hh24')::int > 22 then
	RAISE EXCEPTION 'Sorry! No change can be made before 6 AM and after 10 PM';
	end if;
	return null;
end;

$$
language 'plpgsql';


create trigger emp_log
after update or delete or insert
	on emps
for each row 
execute procedure emp_log_restriction();

insert into emps values(1,'Test_Date');


select * from emps;
select * from emps_audit;

drop trigger emp_log on emps;

--3. Create a trigger to ensure no changes can be 
--made to EMPLOYEES table from Thursday to Friday.
drop table emps;
create table emps(id int not null,name varchar not null);

drop table emps_audit;
create table emps_audit(id int,name varchar,change_time timestamp);

select * from emps;
select * from emps_audit;


create or replace function emp_log_restriction()
returns trigger 
as 
$$
declare 
begin
	if to_char(now()::date,'DAY') ='THURSDAY' or 
	to_char(now()::date,'DAY') ='FRIDAY'   then
	RAISE EXCEPTION 'Sorry! No change ';
	end if;
	return new;
end;

$$
language 'plpgsql';

create trigger emp_log
after update or delete or insert
	on emps
for each row 
execute procedure emp_log_restriction();

insert into emps values(1,'Test_Date');

select * from emps;
select * from emps_audit;

drop trigger emp_log on emps;


--4. Create a trigger to ensure that salary must be 
--insert between minimum and maximum department wise salary in employees table.
--Hint:
--IF (NEW.Sal < (select min(salary) from employees group by department_id)
--  OR 	NEW.Sal > (select max(salary) from employees group by department_id)) 
--THEN
--    		RAISE EXCEPTION 'Salary_out_of_range’
--	 END IF;

select * from emp_copy ec ;

create table emp_copy_audit(e_id int,first_name varchar,
							salary int,change_time timestamp);


select distinct e.department_id,
max(e.salary) over (partition by department_id order by salary),
min(e.salary) over (partition by department_id order by salary)
from employees e ;




create or replace function emp_copy_audit_log()
returns trigger
as 
$$
declare 
begin 
	if (NEW.salary < (select min(salary) from emp_copy group by department_id) 
	OR 	NEW.salary > (select max(salary) from emp_copy group by department_id)) then
	
	RAISE EXCEPTION 'Salary_out_of_range’;
end;

$$
language 'plpgsql';













