-- 1. Write a SQL statement to change the email column of the employees table 
-- with 'not available' for all employees.


select * from emp e limit 5;


update emp e set email='Not Available';


-- 2. Write a SQL statement to change the email and commission_pct column 
-- of the employees table with 'not available' and 0.10 for all employees.

alter table emp  alter commission_pct type decimal(5,2);

update emp e set email='not available' , commission_pct=0.10;


-- 3. Write a SQL statement to change the email and commission_pct column of the employees 
-- table with 'not available' and 0.10 for those employees whose department_id is 19.

alter table emp  alter commission_pct type decimal(5,2);

update emp e set email='not available' , commission_pct=0.10 
where dept_id =19;

select * from emp where dept_id = 19;


-- 4. Write a SQL statement to change the email column of employees table with 'not available' 
-- for those employees whose department_id is 80 and gets a commission is less than.20%.


update emp set email='not available' where dept_id =80 and commission_pct <20;

select * from emp where dept_id = 80;



-- 5. Write a SQL statement to change the email column of the employees table with 'not available' 
-- for those employees who belongs to the 'Accounting' department.

select * from dept limit 5;

update dept d email='not available' where dept_name like '%Account%';


update emp e set email='not null' 
where dept_id in (select dept_id from dept where dept_name like '%Account%');


-- 6. Write a SQL statement to change the salary of an employee to 8000 whose ID is 15, 
-- if the existing salary is less than 5.

select * from emp where emp_id =15;

update emp e set salary =8000 where emp_id =15 and salary >5;



-- 7. Write a SQL statement to change the job ID of the employee which ID is 11 to 7283
--  if the employee belongs to a department which ID is 30 and the existing job ID does 
-- not start with 1.

select * from dept;
select * from emp where job_id =11; 

update emp set job_id =7283 where emp_id=11 and dept_id =30 and job_id not in (1);



-- 8. Write a SQL statement to increase the salary of employees under the department 
-- 40, 90 and 10 according to the company rules that, the salary will be increased by 25% of 
-- the department 40, 15% for department 90 and 10% of the department 11 and the rest of the 
--department will remain same.


update emp set salary =case dept_id 
when 40 then salary +(salary *0.25)
when 90 then salary +(salary*0.15)
when 10 then salary +(salary*0.10)
else salary 
end ;

select * from emp;






















































