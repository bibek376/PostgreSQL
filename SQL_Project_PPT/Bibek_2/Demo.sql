
--SQL Command Types

--DDL(Data Defination Language)
-- create , Drop,Alter,truncate 

create table demo(id int,name char(1));

drop table demo;

truncate table demo;

alter table demo add constraint pk_demo primary key (id);

alter table demo add column "address" varchar(30) not null;

alter table demo drop constraint pk_demo;

alter table demo rename to demo1;

------------------------------------------------------------------------------------------------

--DML (Data Manipulations Language)
-- Insert,Update,delete,upsert

insert into demo values(1,'A'),(2,'B'),(3,'C');
insert into demo values(1,'A');
update  demo set id=11 where id=1;

delete from demo where id=11;

select * from demo;

--upsert(update + insert)
insert into demo values(1,'D'); --Error Because of pk_demo

insert into demo values(1,'D')
on conflict(id) do nothing ;

insert into demo values(1,'D') 
on conflict(id) do update set name=excluded.name; 

------------------------------------------------------------------------------------------------

--DCL (Data Control Language)
--Grant,Revoke
create role test_role with password '1234';
drop role test_role;

grant all privileges on demo to test_role;

revoke all privileges on demo FROM test_role;

--------------------------------------------------------------------------------------------------

--TCL (Transaction Control Language)
--savepoint,commit,rollback


start transaction;

drop table test1;
create table test1(id int ,name char(1));

insert into test1 values(4,'D');

insert  into test1 values(1,'A'),(2,'B'),(3,'C');


select * from test1;

savepoint test1_insert;

commit;


delete from test1 where id=1;
delete from test1 where id=2;

select * from test1;

rollback;

rollback to test1_insert;

end transaction;
-----------------------------------------------------------
--Deadlock
drop table deadlock_problem ;
create table deadlock_problem(id int ,name char(1));
insert into deadlock_problem values(1,'A'),(2,'B'),(1,'C'); 

select * from deadlock_problem;

update deadlock_problem set id=id+7 where id=1;

delete from deadlock_problem 
where id=1;

commit;

--------------------------------------------------------------------------------------------------

--DQL (Data Query Language)

select * from test1;

--SQL Injection
select * from test1 
where id=1 or 1=1-- ;


select * from test1 
where name='asdf' or 1=1-- ;

select * from test1 t 
where name='A' --' and id=123; 

select * 
from test1
where id=1;
drop table test2;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--SQL Constraints
drop table c_demo;

create table c_demo(id int not null,
					name char(1));

--not null

alter table c_demo alter column name set not null;				
				
--------------------------------------------------------------------------------------------------

--Unique

drop table c_u_demo ;
create table c_u_demo(id int not null,
					name char(1));
					
create table c_u_demo(id int not null,
					name char(1),
					unique(id,name));

alter table c_u_demo add constraint unique_id_name unique(id,name);

alter table c_u_demo drop constraint unique_id_name;

--------------------------------------------------------------------------------------------------

--Check
drop table c_c_demo;
create table c_c_demo(id int,
					name char(1),
					check (id >5));

insert into c_c_demo values(2,'A');
					
alter table c_c_demo add constraint check_name check(name in ('A','B','C'));
insert into c_c_demo values(7,'A');

--------------------------------------------------------------------------------------------------

--Primary Key
drop table c_p_demo ;
create table c_p_demo(id int primary key,
					name char(1));
					
alter table c_p_demo drop constraint c_p_demo_pkey;

alter table c_p_demo add constraint c_p_demo_pk primary key(id);

--------------------------------------------------------------------------------------------------

--Foreign Key

insert into c_p_demo values(1,'A'),(2,'B'),(3,'C'),(4,'C');

select * from c_p_demo ;

drop table c_f_demo ;
create table c_f_demo (ids int,
						name varchar(30),
						foreign key(ids) references c_p_demo(id));

alter table c_f_demo drop constraint c_f_demo_ids_fkey;	

alter table c_f_demo add constraint c_f_fk_id foreign key(ids)
								references c_p_demo(id);

insert into c_f_demo values(1,'Bibek');
insert into c_f_demo values(6,'Bibek'); -- did not insert

--------------------------------------------------------------------------------------------------

--Default

drop table c_d_demo ;
create table c_d_demo(id int,
					  name char(1),
					  address varchar(40) default 'Nepal');

alter table c_d_demo alter column address drop default;

alter table c_d_demo alter column address set default 'Nepal';

insert into c_d_demo(id,name) values(1,'A');

select * from c_d_demo ;


--------------------------------------------------------------------------------------------------

-- Index

drop table c_i_demo ;

create table c_i_demo(id int,name char(1));


insert into c_i_demo values(1,'A'),(2,'B');

select * from c_i_demo ;

create unique index unique_idx_id on c_i_demo((id is null)) where id is null;

insert into c_i_demo values(null,'D');

drop index unique_idx_id;



--------------------------------------------------------------------------------------------------

--User Define Constraint
--https://regex101.com/

drop  domain domain_email cascade ;

create domain domain_email as text
check (
	value ~ '^\w+@[a-zA-Z]+?\.[a-zA-Z]{2,3}$'
);


create table c_email(email domain_email);

insert into c_email values('bibekrawat123@gmail.com');
insert into c_email values('cu.18bcs6728@gmail.com');

select * from c_email;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--Single Row Function

--case conversion function

select now()::date::varchar;

--general functions
--case,coalesce
select coalesce(null,4,5); 

--character function
--length,lower,upper,initcap,concat,substr,lpad,rpad,trim

select upper('Bibek');
select initcap('Bibek rawat');
select length('Bibek');
select 'bibek'|| 'rawat' "Full Name";
select rpad('bibek',7,'*');
select substring('Bibek',1,3);
select left('Bibek',3);
select trim(leading 'B' from 'Bibek');

drop table space_remove;
create table space_remove(name varchar(30));

insert into space_remove values('Bibek R awat'),('test_data'),('A');

select * 
from space_remove t 
where lower(replace(t.name,' ',''))='bibekrawat';



--number function
select mod(5,2);
select round(45.926,2);
select trunc(34.42123,3); 

-- date function
select extract(year from '2020-12-12'::date);
select age(now()::date,'2020-12-12');
select now();
select now()::time;
select date_part('year', timestamp '2002-09-17 19:27:45');
select date_part('sec', timestamp '2002-09-17 19:27:45');



-- conversion function
select cast('1' as int);
select to_char('2012-12-12'::date,'yyyy');
select to_date('2012-1-2','yyyy-mm-dd');


--------------------------------------------------------------------------------------------------

--Multi Row Function

--sum(),count(),max(),min(),avg(),variance()

drop table multi_row_demo ;

create table multi_row_demo(a int);

insert into multi_row_demo
select x from generate_series(1,100,5) as x; 

select * from multi_row_demo ;

select sum(a) from multi_row_demo ;
select count(a) from multi_row_demo ;
select max(a) from multi_row_demo ;
select min(a) from multi_row_demo ;

--standard deviation =(varianec)^^0.5
select variance(a) from multi_row_demo ;

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--Windows Functions


--row_number(),rank(),dense_rank()
select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
row_number() over (partition by e.department_id order by salary desc),
rank() over (partition by e.department_id order by salary desc),
dense_rank () over (partition by e.department_id order by salary desc)
from employees e ;

-------------------------------------------------------------------------------------------

--Write an SQL query to display the records
--with four or more rows with consecutive match_no's, and the crowd 
--attended more than or equal to 50000 for each match. Return match_no,
--match_date and audience. Order the result by visit_date, descending.

select * from match_crowd ;

with
  tt as 
	(select m.*,
	row_number() over (),
	m.match_no - (row_number() over ()) "diff"  
	from match_crowd m
	where m.audience >= 50000),
 ttt as
 	(select tt.*,
 	count(*) over (partition by tt.diff)
 	from tt)
select ttt.match_no,ttt.match_date,ttt.audience,ttt.count
from ttt
where ttt.count=4
order by 1;

---------------------------------------------------------------------------------------
--Delete Duplicate Row

select * from window_delete ;

delete from window_delete 
where window_delete.id in (select tt.id from(select wd.*,
				row_number() over (partition by name ) "rn"
				from window_delete wd)tt
				where tt.rn >1);

------------------------------------------------------------------------------------------
			
--fetch the top 3 employee from each department who earn  maximum salary

select * from 
(select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
dense_rank() over (partition by department_id order by salary desc) "dense_rank" 
from employees e) tt
where tt.dense_rank < 4;

------------------------------------------------------------------------------------------
--Nth max salary 
select * from employees ;

select e1.employee_id,e1.first_name,e1.salary  
from employees e1
where 5-1=(select count(distinct salary) from employees e2
			where e2.salary > e1.salary);

select * from		
(select e.employee_id,e.first_name,e.salary,
dense_rank() over (order by e.salary desc) "dn"
from employees e)tt
where tt.dn=5;


---------------------------------------------------------------------------------------

--Percent_rank() and Ntile()
select e.employee_id,e.first_name,e.job_id,e.department_id,e.salary,
percent_rank() over (order by e.salary),
ntile(4) over (order by e.salary) 
from employees e
order by 5 desc;


-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

--value Window Functions


--LAG()
select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
lag(e.salary) over (partition by e.department_id order by e.salary) "prev_emp_salary"
from employees e ;

--LEAD()
select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
lead(e.salary) over (partition by e.department_id order by e.salary) "next_emp_salary"
from employees e ;

--First_value()
select e.employee_id,e.first_name,e.salary,e.department_id,
first_value(e.first_name) over (order by e.salary desc)
from employees e ;


--Last_value()
drop table A;
create table A (id int ,name char(1));

insert into A values (1,'A'),(2,'B'),(1,'C'),(2,'D'),(3,'A');

select A.*,
last_value(name) over (order by id) 
from A;


select A.*,
nth_value(name,4) over (order by id) 
from A;

-------------------------------------------------------------------------------------------
				-- 			Thank You


