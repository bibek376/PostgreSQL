
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

-------------------------------------------------------------------------------------

--DML (Data Manipulations Language)
-- Insert,Update,delete,upsert

insert into demo values(1,'A'),(2,'B'),(3,'C');

update  demo set id=11 where id=1;

delete from demo where id=11;

select * from demo;

--upsert(update + insert+ delete)
insert into demo values(1,'D'); --Error Because of pk_demo

insert into demo values(1,'D')
on conflict(id) do nothing ;

insert into demo values(1,'D') 
on conflict(id) do update set name=excluded.name; 

-------------------------------------------------------------------------------------

--DCL (Data Control Language)
--Grant,Revoke
create role test_role with password '1234';
drop role test_role;

grant all privileges on demo to test_role;

revoke all privileges on demo FROM test_role;

-------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

--SQL Constraints
drop table c_demo;

create table c_demo(id int not null,
					name char(1));

--not null

alter table c_demo alter column name set not null;				
				
-----------------------------------------------------------------------------------

--Unique

drop table c_u_demo ;
create table c_u_demo(id int not null,
					name char(1));
					
create table c_u_demo(id int not null,
					name char(1),
					unique(id,name));

alter table c_u_demo add constraint unique_id_name unique(id,name);

alter table c_u_demo drop constraint unique_id_name;

------------------------------------------------------------------------------------

--Check
create table c_c_demo(id int,
					name char(1),
					check (id >5));

insert into c_c_demo values(2,'A');
					
alter table c_c_demo add constraint check_name check(name in ('A','B','C'));
insert into c_c_demo values(7,'A');

------------------------------------------------------------------------------------

--Primary Key
drop table c_p_demo ;
create table c_p_demo(id int primary key,
					name char(1));
					
alter table c_p_demo drop constraint c_p_demo_pkey;

alter table c_p_demo add constraint c_p_demo_pk primary key(id);

-------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------

--Default

drop table c_d_demo ;
create table c_d_demo(id int,
					  name char(1),
					  address varchar(40) default 'Nepal');

alter table c_d_demo alter column address drop default;

alter table c_d_demo alter column address set default 'Nepal';

insert into c_d_demo(id,name) values(1,'A');

select * from c_d_demo ;


------------------------------------------------------------------------------------

-- Index

create table c_i_demo(id int primary key,name char(1));

--CREATE UNIQUE INDEX c_i_demo_pkey ON public.c_i_demo USING btree (id)
insert into c_i_demo values(1,'A'),(2,'B'); 


create  index name_idx on c_i_demo using brin(name);

drop index name_idx;


-------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

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

--number function
select mod(5,2);
select round(45.926,2);
select trunc(34.42123,3); 

-- date function
select extract(year from '2020-12-12'::date);
-- conversion function
select to_char('2012-12-12'::date,'yyyy');

-------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
















