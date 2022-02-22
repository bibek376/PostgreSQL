

create table emp_copy 
as
select * from employees e ;

update emp_copy set first_name ='Test Data'
				where employee_id=102;

select * from emp_copy ec 
where ec.employee_id =102;

drop view view_emp_copy;

create or replace view view_emp_copy
as 
select * 
from emp_copy ec
where ec.salary >13000;


select * from view_emp_copy ;


--main_table(update,delete,insert) <---->view_table(update,delete,insert)

delete from view_emp_copy 
where employee_id=102;












