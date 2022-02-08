
-- 1> Write a query to display the name (first name and last name) for those employees 
--who gets more salary than the employee whose ID is 163.

select e.first_name||'  '||e.last_name "Name" 
from employees e 
where e.salary > (select e.salary 
					  from employees e 
					  where e.employee_id=163);	

-- 2> Write a query to display the name (first name and last name),
--salary, department id for those employees who earn such amount 
--of salary which is the smallest salary of any of the departments.

select e.first_name||'  '||e.last_name "Name",e.department_id 
from employees e 
where e.salary =(select min(e2.salary) from employees e2);


-- 3> Write a query to display the employee id, employee name (first name and last name) 
--for all employees who earn more than the average salary.

select e.employee_id,e.first_name||'  '||e.last_name "Name"
from employees e 
where e.salary >(select avg(e2.salary) from employees e2);

-- 4> Write a query to display the department number, name (first name and last name),
--job_id and department name for all employees in the Finance department.
select * from departments d ;

select e.department_id ,e.first_name||'  '||e.last_name "Name",e.job_id,
								(select d2.department_name from departments d2 
								where d2.department_id=e.department_id) 
from employees e 
where e.department_id =(select d.department_id from departments d 
						where d.department_name ='Finance');

-- 5> Write a query to display all the information of the employees whose 
--salary is within the range of smallest salary and 2500.

select *
from employees e 
where e.salary between (select min(e2.salary) from employees e2) and 2500;


-- 6> Write a query to display all the information of the employees
--who does not work in those departments where some employees 
--work whose manager id within the range 100 and 200.

select * from employees e 
where e.manager_id not between 100 and 200;



-- 7> Write a query to display the employee number and name (first name and last name)
--for all employees who work in a department with any employee whose name contains a T.
select e.employee_id ,e.first_name||' '||e.last_name "Name"
from employees e 
inner join departments d 
on e.department_id =d.department_id
where e.first_name in (select e.first_name 
					   from employees e
					   where e.first_name like 'T%');



-- 8> Display the employee name (first name and last name), 
--employee id, and job title for all employees whose department location is Toronto.

select e.employee_id,e.first_name||'  '||e.last_name "Name",(select j.job_title from jobs j
															where j.job_id=e.job_id) 
from employees e 
where e.department_id=(select d.department_id 
					   from departments d 
					   where d.location_id =(select l.location_id from locations l 
					  						 where l.city='Toronto'));
 

-- 9> Write a query that will identify all employees
--who work in departments located in the United Kingdom.
select * from employees e 
where e.department_id in (select d.department_id from departments d 
where d.location_id in (select l.location_id from locations l 
						where l.country_id =(select c.country_id 
											from countries c 
											where c.country_name ='United Kingdom')));											  						
					  						
-- 10> Write a query in SQL to display the first and last name, and department code 
--for all employees who work in the department Marketing.		

select e.first_name,e.last_name,e.department_id 
from employees e 
where e.department_id =(select d.department_id 
						from departments d
						where d.department_name ='Marketing');
					  						
					  						
-- 6> Write a query to display all the information of the employees
--who does not work in those departments where some employees 
--work whose manager id within the range 100 and 200.					  						
select * 
from employees 
where manager_id  in   
	(select manager_id 
	from employees 
	where manager_id between 100 and 200)
and department_id is null;



					  						
					  						
					  						
					  						
					  						




					 
					 