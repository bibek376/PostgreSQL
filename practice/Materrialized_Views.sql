
--Materialized View (Database Optimization Technique)

create table test_mv(id int ,name varchar);

insert into test_mv values(1,'Bibek');

select * from test_mv;

create materialized view test_ma_vi
as 
select * from test_mv
with data;

select * from test_ma_vi ;


insert into test_mv values (2,'Test_Data');

select * from test_ma_vi ;
-- new record is not updated on materialized view 

--So, Let's Update

refresh materialized view test_ma_vi with data ;
--Turncate
--Insert
---------------------------------------------------------------------------
explain select r.region_name,count(*) 
from employees e 
inner join departments d 
on e.department_id =d.department_id 
inner join locations l 
on d.location_id =l.location_id 
inner join countries c 
on c.country_id =l.country_id 
inner join regions r 
on r.region_id =c.region_id 
group by 1;

--Cost is 10
--HashAggregate  (cost=10.68..10.72 rows=4 width=76)

--let's use materialized view
create materialized view hr_mv
as 
select r.region_name,count(*) 
from employees e 
inner join departments d 
on e.department_id =d.department_id 
inner join locations l 
on d.location_id =l.location_id 
inner join countries c 
on c.country_id =l.country_id 
inner join regions r 
on r.region_id =c.region_id 
group by 1;

explain select * from hr_mv;

--Cost is 0 
--Seq Scan on hr_mv  (cost=0.00..17.80 rows=780 width=76)

--So,By using view we can reduce a cost

----------------------------------------------------------------------------

create table test_demo(id int,data numeric);

insert into test_demo
select 1,random() 
from pg_catalog.generate_series(1,5);

drop table test_demo cascade;

select * from test_demo;

create  materialized view test_demo_mv 
as 
select  td.id,count(*),avg(td.data)
from test_demo td
group by 1;


select * from test_demo_mv;


--Concurrently materialized view

create or replace function refresh_test_demo_mv()
returns trigger 
as 
$$
declare 
begin 
	refresh materialized view concurrently test_demo_mv;
	return null;
end
$$
language 'plpgsql';


create trigger refresh_test_demo_mv_trigger
after insert or delete or update or truncate
on test_demo
for each statement 
execute procedure refresh_test_demo_mv();


create unique index idx_mv on test_demo_mv(id);


insert into test_demo
select 2,random() 
from pg_catalog.generate_series(1,5);

select * from test_demo;
select * from 

select * from refresh_test_demo_mv_trigger;


















