--Assignment-5

--1. Find the set of all employees who belong to either IT dept. or
--salary is greater than employee_id of 101.



select * from employees e 
where e.department_id=(select d.department_id 
						from departments d 
						where d.department_name='IT') 
union 
select * 
from employees e 
where e.salary > (select e2.salary from
				  employees e2
				  where e2.employee_id=101);


-- 2. Find out if all employee who are in both departments 20 and 30, and 
--exclude any employee who are in department 40.
				 
select e.employee_id 
from employees e 
where e.department_id=20
and e.department_id !=40 
intersect 
select e2.employee_id 
from employees e2 
where e2.department_id =30 
and e2.department_id !=40;
				 
select * from employees e ;
select * from departments d ;
				 
				 
				 				 
				 
--3. To identify all employees who have not changed job, 
-- query the EMPLOYEES table and remove 
--all those who have a row in JOB_HISTORY.

create table emp_copy
as 
(select * from employees e);

select * from employees e ;
select * from job_history jh ;


select * 
from emp_copy ec
where ec.employee_id not in (select distinct jh.employee_id 
							from job_history jh 
							);
