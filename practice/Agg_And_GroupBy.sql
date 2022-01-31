--PostgreSQL Aggregate Functions and Group by

select * from emp;

-- 1. Write a query to find the number of jobs available in the employees table.

select count(distinct(job_id)) from emp;


-- 2.Write a query to get the total salaries payable to employees.

select sum(salary)|| '$' "Total Salary" from emp;


-- 3. Write a query to get the minimum salary from employees table.

select min(salary) "Min Salary" from emp;


-- 4. Write a query to get the maximum salary of an employee working as C4.

select max(salary) "Max Salary AS A C4" from emp where job_id='C4';


-- 5. Write a query to get the average salary and number of employees 
-- working in the department which ID is 3.

select * from emp;

select avg(salary) from emp where dept_id = 3;


-- 6. Write a query to get the highest, lowest, total, and average salary 
-- of all employees.

select max(salary) "Max Salary",min(salary) "Min Salary",avg(salary) "Avg Salary",
sum(salary) "Total Salary" from emp;


-- 7. Write a query to get the number of employees working in each post.

select * from emp;

select job_id,count(*) from emp group by job_id; 


-- 8. Write a query to get the difference between the highest and lowest salaries.

select max(salary)-min(salary) "Diff. Between High Vs Low" from emp;


-- 9. Write a query to find the manager ID and the salary of the lowest-paid
--  employee under that manager.


select manager_id,min(salary) from emp group by manager_id order by min(salary);



-- 10. Write a query to get the department ID and the total salary payable in each department.


select dept_id,sum(salary) from emp group by dept_id;


-- 11. Write a query to get the average salary for each post excluding C3.

select job_id,avg(salary) from emp where job_id not in('C3') group by job_id;


-- 12. Write a query to get the total salary, maximum, minimum and average 
-- salary of all posts for those departments which ID 3.


select * from emp;

select job_id,max(salary) "Max",min(salary) "Min",avg(salary) "Avg" from emp 
where dept_id=3 group by job_id;


-- 13. Write a query to get the job ID and maximum salary of each post for 
-- maximum salary is at or above $400.

select job_id,max(salary) "Max Salary" from emp where salary>400 group by job_id;


-- 14. Write a query to get the average salary for all departments working more 
-- than 2 employees.

select dept_id,avg(salary) from emp 
group by dept_id having count(*)>2;

























