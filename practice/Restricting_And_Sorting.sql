--PostgreSQL Restricting and Sorting Data - Exercises

select * from emp;

-- 1. Write a query to display the name, including first_name and last_name and 
-- salary for all employees whose salary is out of the range between $10,00 and
--  $15,00.


select first_name,last_name,salary || '$' "Salary in ($)" from emp
where salary not between 1000 and 1500; 


-- 2. Write a query to display the name, including first_name and last_name, 
-- and department ID who works in the department 3 or 1 and arrange the result
--  in ascending order according to the department ID.

select * from emp;

select first_name,last_name,dept_id from emp e where dept_id in (1,3) order by dept_id;


-- 3. Write a query to display the name, including first_name and last_name, 
-- and salary who works in the department either 3 or 1 and salary is out 
-- of the range between $10,00 and $15,00.


select e.first_name,e.last_name,e.salary from emp e where dept_id in (1,3) and e.salary 
not between 1000 and 1500;


-- 4. Write a query to display the name, including first_name and last_name 
-- and hire date for all employees who were hired in 2021.

select first_name,last_name,hire_date from emp
where extract(year from hire_date)=2021;


-- 5. Write a query to get the first name of the employee who holds the 
-- letter 'c' and 'e' in the first name.

select * from emp e where first_name like '%c%' OR first_name like '%e%';


-- 6. Write a query to display the last name, job_id, and salary for all those 
-- employees who hasn't worked as a C2 or C3 Clerk, and not 
-- drawing the salary $4,50, $10,00, or $15,00.

select last_name,job_id,salary from emp where job_id not in ('C2','C3') and 
salary not in (450,1000,1500);


-- 7. Write a query to display the last names of employees whose name contain 
-- exactly six characters.

select first_name,last_name from emp where char_length(first_name)=6; 


-- 8. Write a query to display the last name of employees having 'e' as 
-- the third character.

select e.last_name from emp e where e.last_name like '__e%'; 


-- 9. Write a query to display the job_id/designations available in the employees 
-- table.


select distinct(job_id) from emp; 


-- 10. Write a query to display the name, including first_name, last_name, 
-- salary and 15% of salary as PF of all employees.

select first_name,last_name,salary || '$' "Salary",salary*.15 || '$' "PF" from emp;


-- 11. Write a query to select all information of employees whose last name is 
-- either 'JONES' or 'BLAKE' or 'SCOTT' or 'KING' or 'FORD'.

select * from emp where last_name in ('Jones','Blake','Scott','King','Ford');
	





















