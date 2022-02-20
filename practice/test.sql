create or replace function dept_wise_sal(dept_id int[])
returns table(
	department_name varchar,
	salary int
)

as
$$
declare
begin
				return query
				select d.department_name::varchar,sum(e.salary)::int as sal
				from employees e 
				inner join departments d
				on e.department_id =d.department_id 
				where d.department_id in (select unnest (dept_id))
				group by 1;
end;
$$
language 'plpgsql';

select * from dept_wise_sal(array[60,90]);