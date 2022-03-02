

--Update Trigger Operations


drop table emps;
create table emps(id int,first_name varchar(40) not null
					,last_name varchar(40) not null,
					primary key(id)); 
					
create table emp_audits(id int,emp_id int,first_name varchar(40) not null,
						time_change timestamp(6) not null);
						
drop table emp_audits ;					
select * from emps;
select * from emp_audits;


create or replace function log_first_name_change()
returns trigger
as 
$$
declare 
begin 
	if new.first_name<>old.first_name then
	insert into emp_audits(id,emp_id,first_name,time_change)
	values (old.id,old.id,old.first_name,now());
	end if;
	return new;
end;

$$
language 'plpgsql';

drop trigger log_first_name_change on emps;

create trigger first_name_changes
before update 
	on emps
for each row 
execute procedure log_first_name_change();


insert into emps values(1,'Bibek','Rawat');
insert into emps values(2,'Binaya','Rawat');


select * from emps;
select * from emp_audits ;

update emps
set first_name='Carlos'
where id=1;

--------------------------------------------------------------------------------

--Insert Trigger Operations

select * from emp_copy ec ;
CREATE TABLE emp_copys (
	employee_id int4 NULL,
	first_name varchar(20) NULL,
	last_name varchar(25) NULL,
	manager_id int4 NULL,
	department_id int4 NULL
);

insert into emp_copys values(1,'Bibek','Rawat',900,60); 


create table emp_copy_audits(log_id bigserial primary key,emp_id int not null,
							first_name varchar(40),dept_id int,User_name varchar
							,insert_time timestamp not null);
select * from emp_copy_audits ;



create or replace function log_insert()
returns trigger
as 
$$
declare 
begin 
	insert into emp_copy_audits(emp_id,first_name,dept_id,User_name,insert_time)
	values (new.employee_id,new.first_name,new.department_id,current_user,now());
	return new;
end;

$$
language 'plpgsql';


create trigger insert_in_emp
after insert 
	on emp_copys
for each row 
execute procedure log_insert();


select * from emp_copy_audits; 

insert into emp_copys values(10,'Binaya','Rawat',100,90); 

drop trigger insert_in_emp on emp_copys;


----------------------------------------------------------------------------------

--All Trigger Operations at once

drop table emps;

create table emps(emp_name varchar(35),salary int 
);

drop table emp_audits;
create table emp_audits (
	operations char(1),
	stamp timestamp,
	users text not null,
	emp_name text not null,
    salary int 
);


create or replace function log_status()
returns trigger
as 
$$
declare 
begin 
	if (TG_OP='DELETE') then
	insert into emp_audits 
	select 'D',now(),current_user,old.emp_name,old.salary;
	return old;

	elseif (TG_OP='UPDATE') then
	insert into emp_audits 
	select 'U',now(),current_user,old.*;
	return old;

	elseif (TG_OP='INSERT') then
	insert into emp_audits 
	select 'I',now(),current_user,new.*;
	return new;

	end if;
	return null; ---->result is ignored
end;

$$
language 'plpgsql';



create trigger insert_log
after insert or update or delete 
	on emps
for each row 
execute procedure log_status();

select * from emps;
select * from emp_audits;

insert into emps values('Bibek',10213);
insert into emps values('B',10113);
insert into emps values('C',11213);

delete from emps 
where emp_name='C';

update emps set emp_name='Test_Data' where emp_name='Bibek';

----------------------------------------------------------------------------------










