--PostgreSQL JOINS - Exercises
--
--


--1. Write a query to find the addresses (location_id, street_address, city, state_province, 
-- country_name) of all the departments.


select * from department d 
natural join employee e;


-- 2. Write a query to make a join with employees and departments table to find
--  the name of the employee, including first_name and last name, department ID 
-- and name of departments.

select e.first_name,e.last_name,e.dept_id,d.dept_name from emp e
inner join dept d on e.dept_id=d.dept_id;


-- 3. Write a SQL query to make a join with three tables employees, 
-- departments and locations to find the name, including first_name and 
-- last_name, jobs, department name and ID, of the employees working in London.

select * from location;


select e.first_name,e.last_name,e.dept_id,d.dept_name from emp e
inner join dept d  on (e.dept_id=d.dept_id)
inner join location l on (l.location_id=d.dept_id)
where l.city='London';



-- 4. Write a query to make a join with two tables employees and itself to 
-- find the employee id, last_name as Employee along with their manager_id
-- and last name as Manager.


--self join


select w1.emp_id "Emp Id",w1.last_name "Employee",w2.emp_id "Manager_id",
w2.last_name "Manager" from emp w1 join emp w2 on w1.emp_id =w2.manager_id ;


-- 5. Write a query to make a join with a table employees and itself to find the
--  name, including first_name and last_name and hire date for those employees who
-- were hired after the employee Jones.


select e.first_name,e.last_name,e.hire_date from emp e
join emp d on (d.last_name='Johnes') where d.hire_date <e.hire_date ;



-- 6. Write a query to make a join with two tables employees and departments
-- to get the department name and number of employees working in each department.

select * from dept d ;
select * from emp e ;

select d.dept_name,count(*) "Numer of Emp" from emp e 
inner join dept d  on e.dept_id =d.dept_id group by d.dept_name ;


-- 7. Write a query to make a join to find the employee ID, job title and 
-- number of days an employee worked, for all the employees who worked in a 
-- department which ID is 90.
--use table jobs and job_history

select * from jobs j ;
select * from job_history jh ;

--Create a clone table 
create table if not exists public.job_clone
as
select * from jobs;


create table if not exists public.job_history_clone
as
select * from job_history;

select j.job_title,jh.employee_id,jh.end_date-jh.start_date "Days" 
from job_history_clone jh
inner join job_clone j  on j.job_id=jh.job_id
where jh.department_id=90;


-- 8. Write a query to make a join with two tables employees and departments to
-- display the department ID, department name and manager_id.

select * from employees ;
select * from departments ;


select e.department_id,d.department_name,d.manager_id,e.first_name 
from (departments d 
inner join employees e 
on d.manager_id=e.employee_id);


-- 9. Write a query to make a join with three tables departments, employees, 
-- and locations to display the department name, emp name, and city.

select * from departments;
select * from employees;
select * from locations;



select w1.department_name,w2.first_name,w3.city from ((departments w1 
inner join employees w2 on (w1.department_id=w2.department_id))
inner join locations w3 on (w1.location_id=w3.location_id));


-- 10. Write a query to make a join with two tables employees and jobs to 
-- display the job title and average salary of employees.

select * from employees;
select * from jobs;


select j.job_title,avg(e.salary) from jobs j 
inner join employees e on j.job_id =e.job_id group by j.job_title;



-- 11. Write a query to make a join with two tables employees and jobs to 
-- display the job title, employee name, and the difference between salary and 
-- the minimum salary of the employees.


select * from employees;
select * from jobs;



select e.first_name,j.job_title,(e.salary-j.min_salary) "Salary - Min" from 
employees e inner join jobs j on (j.job_id=e.job_id) order by e.first_name ;


-- Alternative method
SELECT w2.job_title, w1.first_name, w1.salary,
w2.min_salary,(w1.salary - w2.min_salary) as "Salary - Min_Salary" 
FROM employees  w1
NATURAL JOIN jobs w2;



-- 12. Write a query to make a join with two tables job_history and employees to
-- display the status of employees who is currently drawing the salary above 10000.


select * from job_history;
select * from employees ;

select e.employee_id,jh.job_id,jh.department_id,e.salary from job_history jh 
inner join employees e on (e.employee_id=jh.employee_id)
where e.salary >10000;


-- 13. Write a query to make a join with two tables employees and departments to
-- display department name, first_name and last_name, hire date and salary for
-- all the managers who achieved a working experience is more than 15 years.

select * from employees e ;
select * from departments d ;

select e.first_name,e.last_name,e.hire_date,e.salary,d.department_name,
date_part('year',now()::date) - date_part('year',e.hire_date) "Experiance"
from employees e 
inner join departments d on e.department_id =d.department_id 
--where  date_part('year',now()::date) - date_part('year',e.hire_date)>15;
where date_part('year',age(now(),hire_date)) >15;

select date_part('year', now()::date); 

select date_part('year',age(now(),timestamp '2004-03-2')); 
select date_part('year',now()::date) - date_part('year',timestamp '2004-03-2');

select now()::date; 




































































