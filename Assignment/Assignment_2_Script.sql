
-- Assignment 2 

-- 1> Write a query in SQL to display the first name, last name,
--department number, and department name for each employee.

select e.first_name,e.last_name,e.department_id,d.department_name 
from employees e 
left join department d 
on d.department_id =e.department_id ;

-- 2> Write a query in SQL to display the first and last name, 
--department, city, and state province for each employee.

select * from departments d ;
select * from employees e ;
select l.city,l.state_province from locations l ;


select e.first_name,e.last_name,d.department_name, l.city,l.state_province 
from employees e 
left join departments d 
on d.department_id =e.department_id
left join locations l 
on l.location_id =d.location_id ;


-- 3> Write a query in SQL to display the first name, last name, 
--department number and department name, for all employees for departments 80 or 40.

select e.first_name,e.last_name, d.department_id,d.department_name
from employees e 
inner join departments d 
on d.department_id =e.department_id 
where d.department_id in (80,40);

-- 4> Write a query in SQL to display the full name (first and last name), 
--and salary of those employees who working in any department located in London.

select * from locations l ;


select e.first_name||'  '||e.last_name "Full Name",e.salary 
from employees e 
inner join departments d 
on d.department_id =e.department_id 
inner join locations l 
on l.location_id =d.location_id 
where l.city ='London';


-- 5> Write a query in SQL to display those employees who contain a letter z
--to their first name and also display their last name, department, city, and state province.


select e.first_name,e.last_name,d.department_name,l.city ,l.state_province 
from employees e 
inner join departments d
on d.department_id =e.department_id 
inner join locations l
on l.location_id =d.location_id 
where lower(e.first_name) like '%z%';


--6> Write a query in SQL to display all departments including those where
--does not have any employee.

select * from departments d 
where d.department_id not in (select distinct e.department_id from employees e);

--
--7> Write a query in SQL to display the first name, last name,
--department number and name, for all employees who have or have not any department.

select e.first_name,e.last_name ,e.department_id,d.department_name 
from employees e 
left join departments d 
on d.department_id =e.department_id ;


--8> Write a query in SQL to display job title and average salary of employees.

select avg(e.salary) from employees e ;

select j.job_title,round(avg(e.salary),2) 
from jobs j 
inner join employees e
on e.job_id =j.job_id
group by j.job_title ;

--9> Write a query in SQL to display the department name and number 
--of employees in each of the department.

select d.department_name,count(*) 
from employees e 
inner join departments d 
on e.department_id =d.department_id 
group by d.department_name ;

--
--10> Write a query in SQL to display the name of the department, 
--average salary and number of employees working in that department who got commission.

select * from employees e ;
select * from departments d ;

select e.department_id,avg(salary),count(*) 
from employees e 
group by e.department_id ;

select d.department_name,count(*),round(avg(e.salary),2)  
from employees e 
left join departments d 
on d.department_id =e.department_id 
where e.commission_pct is not null
group by d.department_name ;












