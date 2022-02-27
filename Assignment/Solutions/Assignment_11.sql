--Assignment-11


drop table emp_copy cascade;

create table emp_copy
as 
select * from employees e ;

drop table dept_copy cascade;
create table dept_copy
as 
select * from departments d ;

drop table loc_copy cascade;
create table loc_copy
as 
select * from locations l ;

drop table coun_copy cascade;
create table coun_copy
as 
select * from countries c  ;

drop table reg_copy cascade;
create table reg_copy
as 
select * from regions r ;

-------------------------------------------------------------------------

create materialized view region_wise_emp_count_mv
as
select r.region_name,count(*) 
from emp_copy e 
inner join dept_copy d 
on e.department_id =d.department_id 
inner join loc_copy l 
on d.location_id =l.location_id 
inner join coun_copy c 
on c.country_id =l.country_id 
inner join reg_copy r 
on r.region_id =c.region_id 
group by 1;


select * from reg_copy rc ;
select * from coun_copy;
select * from locations l ;
select * from departments d ;

update dept_copy 
set location_id =1200
where department_id =50;

select * from region_wise_emp_count_mv;

-------------------------------------------------------------------------

create or replace function refresh_region_wise_emp_count_mv()
returns trigger 
as 
$$
declare 
begin 
	refresh materialized view concurrently region_wise_emp_count_mv;
	return null;
end
$$
language 'plpgsql';




create trigger refresh_region_wise_emp_count_mv_trigger
after insert or delete or update or truncate
on emp_copy
for each statement 
execute procedure refresh_region_wise_emp_count_mv();


create trigger refresh_region_wise_emp_count_mv_trigger
after insert or delete or update or truncate
on dept_copy
for each statement 
execute procedure refresh_region_wise_emp_count_mv();


create trigger refresh_region_wise_emp_count_mv_trigger
after insert or delete or update or truncate
on loc_copy
for each statement 
execute procedure refresh_region_wise_emp_count_mv();


create trigger refresh_region_wise_emp_count_mv_trigger
after insert or delete or update or truncate
on coun_copy
for each statement 
execute procedure refresh_region_wise_emp_count_mv();


create trigger refresh_region_wise_emp_count_mv_trigger
after insert or delete or update or truncate
on reg_copy
for each statement 
execute procedure refresh_region_wise_emp_count_mv();




create unique index idx_mv_region_emp_count on 
region_wise_emp_count_mv(region_name);



