--PostgreSQL Basic Simple - Exercises


-- 1. Write a query to display the names (first_name, last_name) using an alias 
-- name “First Name", "Last Name".

select * from emp;

select first_name "First Name",last_name "Last Name" from emp;


-- 2. Write a query to get a unique department ID from employee table.

select distinct(dept_id) from emp;

-- 3. Write a query to get the details of all employees from the employee 
-- table in descending order by their first name.

select * from emp order by first_name DESC;


-- 4. Write a query to get the names (first_name, last_name), salary and 15% 
--of salary as PF for all the employees.

select first_name "First Name" ,last_name "Last Name" ,salary,salary*0.15 "PF"
from emp;

 

-- 5. Write a query to get the employee ID, names (first_name, last_name) and 
-- salary in ascending order according to their salary.

select e.emp_id,e.first_name,e.last_name,e.salary from emp e order by salary;


-- 6. Write a query to get the total salaries payable to employees.


select sum(salary) from emp;


-- 7. Write a query to get the maximum and minimum salary paid to the employees.

select max(salary) "Max Salary",min(Salary) "Min Salary" from emp;


-- 8. Write a query to get the average salary and number of employees are working.

select avg(salary) "Average Salary",count(*) from emp;


-- 9. Write a query to get the number of employees working with the company.

select count(*) from emp;


-- 10. Write a query to get the unique number of designations available 
-- in the employees table.

select * from emp;

select count(distinct(job_id)) from emp;


-- 11. Write a query to get all the first name from the employees table in 
-- upper case.

select upper(first_name) from emp;


-- 12. Write a query to get the first three characters of the first
--  name for all the employees in the employees table.

select substr(first_name,1,3) "First Three Character" from emp;


-- 13. Write a query to calculate the expression 171*214+625.

select 171*214+625 Result;


-- 14. Write a query to get the name, including first name and last name of
--  all the employees from employees table.

select concat(first_name,'  ',last_name) "Emp Name" from emp;

-- 15. Write a query to get the first names after removing all the leading 
-- and trailing blanks of all the employees from employees table.


select trim(first_name) from emp;



-- 16. Write a query to get the first name, last name and the length of the name,
--  including first_name and last_name of all the employees from employees table.


select first_name,last_name,char_length(concat(first_name,last_name)) "Length" 
from emp;


-- 17. Write a query to check whether the first_name column of the employees
--     table containing any number.


select first_name from emp where first_name like '%[0-9]%';


-- 18. Write a query to select first ten records from a table.


select * from emp limit 10;


-- 19. Write a query to get a monthly salary (rounded up to 2 decimal places) 
-- of each employee.

select emp_id,salary/12 "Monthly Salary" from emp;







































