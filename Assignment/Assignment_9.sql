
--Assignment-9

--1. write a dynamic function that take one or many region 
--name in function parameter where query must be display region
--name and total number of employees as region name wise.

--Query
select r.region_name,count(*) 
from employees e 
inner join departments d 
on d.department_id =e.department_id 
inner join locations l 
on l.location_id =d.location_id 
inner join countries c 
on l.country_id =c.country_id 
inner join regions r 
on r.region_id =c.region_id
where r.region_name in ('Europe')
group by 1;


create or replace function region_wise_emp(region_names text[])
returns table(	
	region_name varchar,
	emp_count int
)

as 
$$
declare
dynamicQuery varchar;
innerClause varchar;
regionClasue varchar;
begin
		
	if region_names is null then
		regionClasue :='Europe';
	   dynamicQuery='select r.region_name::varchar,count(*)::int 
					from employees e 
					inner join departments d 
					on d.department_id =e.department_id 
					inner join locations l 
					on l.location_id =d.location_id 
					inner join countries c 
					on l.country_id =c.country_id 
					inner join regions r 
					on r.region_id =c.region_id
					where r.region_name in ('||regionClasue||')
					group by 1';
				
	end if;
	if region_names is not null then
		dynamicQuery='select r.region_name::varchar,count(*)::int 
					from employees e 
					inner join departments d 
					on d.department_id =e.department_id 
					inner join locations l 
					on l.location_id =d.location_id 
					inner join countries c 
					on l.country_id =c.country_id 
					inner join regions r 
					on r.region_id =c.region_id
			where r.region_name in ( select unnest (region_names))
					group by 1';
	return query execute dynamicQuery;

					
		
end;
$$
language 'plpgsql';

select * from region_wise_emp(null);

select * from region_wise_emp('{'Europe','Asia'}');
select * from region_wise_emp(array['Europe','Asia']);
---------------------------------------------------------------------------------

----------------------------------------------------------------------------------

--2. write a dynamic function that take one or many department
--id in function parameter where query must be display department
--name and sum of employees salary as department name.

--Query

select d.department_name,sum(e.salary) 
from employees e 
inner join departments d
on e.department_id =d.department_id 
where d.department_id =60
group by 1;



create table tests(id int,uid int[]);

select * from tests;

insert into tests values (1,array[2,5,6]);
insert into tests values (2,array[2,2,2]);
insert into tests values (1,'{60,90}');

select * from tests;

select unnest (array[2,5,6]);



select d.department_name,sum(e.salary) 
from employees e 
inner join departments d
on e.department_id =d.department_id 
where d.department_id in (select unnest(array[60,90]))
group by 1;




create or replace function dept_wise_sal_2(dept_id int[])
returns table(
	department_name varchar,
	salary int
)

as
$$
declare
	dynamicQuery varchar;
	deptClause   varchar;
begin
	if dept_id is  null then 
	deptClause :='(60)';
	end if;
	if dept_id is not null then         
	deptClause :='(select unnest ($1))';
	end if;
	dynamicQuery='select d.department_name::varchar,sum(e.salary)::int 
				from employees e 
				inner join departments d
				on e.department_id =d.department_id 
				where d.department_id in '||deptClause||'
				group by 1';
	return query execute dynamicQuery using dept_id;
end;
$$
language 'plpgsql';

drop function dept_wise_sal(dept_id int[]);

select * from dept_wise_sal_2(null);

select * from dept_wise_sal_2(array[60,90,100,50]);

select * from dept_wise_sal_2('{50,90}');


-----------------------------------------------------------------------------------




