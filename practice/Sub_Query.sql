-- PostgreSQL Subquery 

-- 1. Write a query to find the first_name, last_name and salaries of the 
-- employees who have a higher salary than the employee whose last_name is Orta.

select e.first_name,e.last_name,e.salary from emp e
where e.salary > (select e.salary from emp e where last_name='Orta');



-- 2. Write a SQL subquery to find the first_name and last_name of all 
-- employees who works in the Account department.

select * from emp e;
select * from dept d; ----> Account

select e.first_name,e.last_name from emp e where dept_id in 
(select dept_id from dept where dept_name like '%Account%');


-- 3. Write a SQL subquery to find the first_name and last_name of the employees
--  under a manager who works for a department based in the United States.

-- Hint : Write single-row and multiple-row subqueries

select * from employees e ;
select * from departments d ;
select * from locations l ;


select first_name,last_name 
from employees 
where manager_id in 
(select manager_id from departments 
where location_id in 
(select location_id from locations where country_id='US'));


-- 4. Write a SQL subquery to find the first_name and last_name of the employees who are
-- working as a manager.



select first_name,last_name from employees where 
employee_id in (select manager_id from employees);



-- 5. Write a SQL subquery to find the first_name, last_name and salary, which is greater
--  than the average salary of the employees.

select * from employees e ;


select first_name,last_name,salary from employees 
where salary > (select avg(salary) from employees);


-- 6. Write a SQL subquery to find the first_name, last_name and salary, which is equal
--  to the minimum salary for this post, he/she is working on.


select * from employees e ;
select * from jobs j ;


select e.first_name,e.last_name,e.salary from employees e
where e.salary =(select j.min_salary from jobs j where e.job_id=j.job_id);


-- 7. Write a SQL Subquery to find the first_name, last_name and salary of the employees
-- who earn more than the average salary and works in any of the IT departments.

select * from employees e ;
select * from departments d ;

select first_name,last_name,salary from employees  
where department_id in
(select department_id from departments  where department_name like '%IT%'
and salary > (select avg(salary) from employees ));



-- 8. Write a SQL subquery to find the first_name, last_name and salary of the employees
-- who draw a more salary than the employee, which the last name is Bell.


select first_name,last_name,salary from employees 
where salary > (select salary from employees where last_name='Bell') order by first_name;


-- 9. Write a SQL subquery to find all the information of the employees who draws 
-- the same salary as the minimum salary for all departments.


select * from employees ;
select * from departments ;


select * from employees  where salary =(select min(salary) from employees);


-- 10. Write a SQL subquery to find all the information of the employees whose salary
-- greater than the average salary of all departments.



select * from employees where salary > (select avg(salary) from employees);



-- 11. Write a subquery to find the first_name, last_name, job_id and salary of the 
-- employees who draws a salary that is higher than the salary of all the Shipping Clerk 
-- (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.



select * from employees e ;


select first_name,last_name,job_id,salary from employees
where salary > (select max(salary) from employees where job_id ='SH_CLERK') order by salary;


select max(salary) from employees where job_id ='SH_CLERK';


-- OR 
SELECT first_name,last_name, job_id, salary 
FROM employees 
WHERE salary >
all (SELECT salary 
FROM employees 
WHERE job_id = 'SH_CLERK') 
ORDER BY salary ;



-- 13. Write a SQL subquery to find the employee ID, first name, last name and department 
-- names of all employees.

select * from employees e ;
select * from departments d ;

select employee_id,first_name,last_name,(select department_name from departments where
employees.department_id=departments.department_id) "Dp.Name" from employees  ;


-- 14. Write a SQL subquery to find the employee ID, first name, last name and salary 
-- of all employees whose salary is above the average salary for their departments.


select * from employees e ;

select * from departments d ;


select e.employee_id,e.first_name,e.last_name,e.salary from employees e
where salary > (select avg(salary) from employees  where e.department_id=department_id);



select department_id,avg(salary) from employees group by department_id;




-- 15. Write a subquery to find the 5th maximum salary of all salaries.

select * from employees e ;

select distinct(salary) from employees e order by salary desc offset 4 limit 1;


-- 16. Write a subquery to find the 4th minimum salary of all the salaries.


select distinct(salary) from employees e order by salary  offset 3 limit 1;


-- 17. Write a subquery to select last 10 records from a table.


select * from (select * from employees order by employee_id desc limit 10) sub;




-- 19. Write a query to get three maximum salaries.

select distinct(salary) from employees e order by salary desc limit 3;



-- 20. Write a query to get three minimum salaries.


select distinct(salary) from employees e order by salary  limit 3;



-- 21. Write a query to get nth max salaries of employees.


select * from employees e ;

select * from employees e1
where N-1=(select count(distinct(e2.salary)) from employees e2
where e2.salary>e1.salary );


























































































































































