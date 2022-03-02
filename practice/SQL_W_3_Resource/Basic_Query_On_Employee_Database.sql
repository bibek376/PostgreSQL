--
--SQL Exercises, Practice, Solution - exercises on employee Database


--1. From the following table return complete information about the employees.


select * from employees e ;


--2. From the following table, write a SQL query to
--find the salaries of all employees. Return salary. 

select e.salary 
from employees e; 


--3. From the following table, write a SQL query to find the
--unique designations of the employees. Return job name.
select distinct e.job_name 
from employees e; 


--4. From the following table, write a SQL query to list the employees’ 
--name, increased their salary by 15%, and expressed as number of Dollars.
select e.emp_name,'$'||(e.salary+e.salary *0.15) "Salary"
from employees e; 

--5. From the following table, write a SQL query to list the 
--employee's name and job name as a format of "Employee & Job".


select e.emp_name||'  '||e.job_name "Employee & Job" 
from employees e ;


--6. Write a query in SQL to produce the output of employees as follows.
-- Employee
--JONAS(manager).


select e.emp_name||'  ('||e.job_name||')' "Employee & Job" 
from employees e ;
--
--7. From the following table, write a SQL query to find those 
--employees with hire date in the format like February 22, 1991.
--Return employee ID, employee name, salary, hire date.

select e.emp_id,e.emp_name,e.salary,to_char(e.hire_date,'MM  DD,YYYY') 
from employees e ;


--8. From the following table, write a SQL query to count the 
--number of characters except the spaces for each employee name.
--Return employee name length.
select length(trim(e.emp_name)) 
from employees e ;

--9. From the following table, write a SQL query to find the employee 
--ID, salary, and commission of all the employees.

select e.emp_id,e.salary,e.commission 
from employees e ;

--10. From the following table, write a SQL query to find the 
--unique department with jobs. Return department ID, Job name.
select e.dep_id,e.job_name 
from employees e 
group by 1,2;

--OR
SELECT DISTINCT dep_id,
                job_name
FROM employees ;


--11. From the following table, write a SQL query to find 
--those employees who do not belong to the department 2001. 
--Return complete information about the employees.

select *
from employees e 
where e.dep_id !=2001;


--12. From the following table, write a SQL query to find those
--employees who joined before 1991. Return complete information 
--about the employees.
select * 
from employees e 
where e.hire_date < '1991-1-1';


--13. From the following table, write a SQL query to 
--compute the average salary of those employees who work as
--‘ANALYST’. Return average salary

select avg(e.salary) 
from employees e 
where e.job_name='ANALYST'
group by e.job_name;

--OR
SELECT avg(salary)
FROM employees
WHERE job_name = 'ANALYST';

--14. From the following table, write a SQL query to find the 
--details of the employee ‘BLAZE’.
select *
from employees e 
where e.emp_name='BLAZE'; 

--15. From the following table, write a SQL query to find those 
--employees whose commission is more than their salary.
--Return complete information about the employees.
select * 
from employees e
where e.commission >e.salary;


--16. From the following table, write a SQL query to find 
--those employees whose salary exceeds 3000 after giving 25% 
--increment. Return complete information about the employees.

select * from 
(select e.*,(e.salary+e.salary*0.25) "sal" 
from employees e )tt
where tt.sal>3000;


--17. From the following table, write a SQL query to 
--find the names of the employees whose length is six.
--Return employee name.

select e.emp_name from employees e 
where length(e.emp_name)=6; 


--18. From the following table, write a SQL query 
--to find those employees who joined in the month January.
--Return complete information about the employees.

select * from employees e 
where extract (month from e.hire_date)=1;

--OR
SELECT *
FROM employees
WHERE to_char(hire_date, 'mon')='jan';

--OR
select * from employees e 
where to_char(e.hire_date,'mon')='jan'; 

--OR
SELECT * FROM employees e
WHERE date_part('month', e.hire_date) = 1;

--OR
select * from employees e
where to_char(hire_date,'mm')='01';


--19. From the following table, write a SQL query to find 
--the name of employees and  manager separated by the string 'works for'. 
select e.emp_name||' Works For '||m.emp_name 
from employees e,employees m
where e.manager_id=m.emp_id ;

select * from employees e ;

--OR
select a.emp_name|| ' Works for ' || b.emp_name 
from employees a
join employees b
on a.manager_id= b.emp_id;


--20. From the following table, write a SQL query to find those 
--employees whose designation is ‘CLERK’. Return complete information
--about the employees .
select * 
from employees e 
where e.job_name='CLERK'; 


--21. From the following table, write a SQL query to find those
--employees whose experience is more than 27 years. 
--Return complete information about the employees.
select * 
from employees e
where date_part('year',now()::date)- date_part('year',e.hire_date)>27;

--OR 
SELECT *
FROM employees
WHERE EXTRACT(YEAR
              FROM age(CURRENT_DATE, hire_date)) > 27;

--22. From the following table, write a SQL query to find 
--those employees whose salaries are less than 3500.
--Return complete information about the employees.

select *
from employees e 
where e.salary <3500;
             
--23. From the following table, write a SQL query to find the employee whose
--designation is ‘ANALYST’. Return employee name, job name and salary.
select * 
from employees e 
where e.job_name='ANALYST';

	
--24. From the following table, write a SQL query to find those employees
--who have joined in the year 1991.Return complete information
--about the employees.
select * 
from employees e 
where date_part('year', e.hire_date)=1991; 


--25. From the following table, write a SQL query to find those employees
--who joined before 1st April 1991. Return employee ID, 
--employee name, hire date and salary.
select * 
from employees e 
where e.hire_date < '1991-04-01';


--26. From the following table, write a SQL query to find 
--those employees who are not working under a manager. 
--Return employee name, job name.
select *
from employees e
where e.manager_id is null;

--27. From the following table, write a SQL query to find those employees 
--who joined on 1st May 91. Return complete information about the employees.

select *
from employees e 
where e.hire_date= '1991-05-1'; 


--28. From the following table, write a SQL query to find those employees
--working under the manger whose ID is 68319.
--Return employee ID, employee name, salary, and age.

select * from employees e 
where e.manager_id=68319; 

--29. From the following table, write a SQL query to find those employees who 
--earn more than 100 as daily salary.
--Return employee ID, employee name, salary, and age.
select * from employees e 
where e.salary >100;

--30. From the following table, write a SQL query to find those employees 
--who retired after 31-Dec-99, completion of 8 years of service period.
--Return employee name.

select * 
from employees e
where e.hire_date + interval '8 years' > '1999-12-31'; 


--31. From the following table, write a SQL query to find those 
--employees whose salary is an odd value.
--Return complete information about the employees.
select *
from employees e 
where (e.salary) % 2!=0; 


--32. From the following table, write a SQL query to find those employees
--whose salary contains only three digits.
--Return complete information about the employees.
select * from employees e
where length(e.salary::integer::varchar)=3;

--33. From the following table, write a SQL query to find those 
--employees who joined in the month of APRIL. 
--Return complete information about the employees.
select * from employees e 
where date_part('month',e.hire_date)='05'; 

--34. From the following table, write a SQL query to find those 
--employees who joined in the company before 19th of a month.
--Return complete information about the employees.

select * from  employees e 
where date_part('day',e.hire_date)<19; 

--35. From the following table, write a SQL query to find those employees
--who are SALESMAN and experience more than 10 months. 
--Return complete information about the employees.

select * from employees e 
where e.job_name='SALESMAN'
and (now()::date-e.hire_date)/30 >10; 

--36. From the following table, write a SQL query to find those employees of 
--department id 3001 or 1001 and joined in the year 1991.
--Return complete information about the employees. 
select * from employees e
where e.dep_id in (3001,1001)
and date_part('year',e.hire_date)=1991; 


--37. From the following table, write a SQL query to find those
--employees who are working for the department ID 1001 or 2001.
--Return complete information about the employees.
select * from employees e 
where e.dep_id in (1001,2001);

--38. From the following table, write a SQL query to find those 
--employees whose designation is ‘CLERK’ and work in the 
--department ID 2001. Return complete information about the employees.

select * from  employees e 
where e.job_name='CLERK'
and e.dep_id =2001;


--39. From the following table, write a query in SQL to find those employees where - 

--1. the employees receive some commission which should not 
--be more than the salary and annual salary including commission is below 34000.

--2. Designation is ‘SALESMAN’ and working in the department ‘3001’.
-- Return employee ID, employee name, salary and job name.


select * from employees e 
where 12*(e.salary+e.commission)<34000
and e.job_name='SALESMAN'
and e.dep_id=3001;


--40. From the following table, write a SQL query to find 
--those employees who are either CLERK or MANAGER. 
--Return complete information about the employees.

select * from employees e 
where e.job_name in ('CLERK','MANAGER');

--41. From the following table, write a SQL query to find those employees 
--who joined in any year except the month of February.
--Return complete information about the employees.

select * from employees e 
where date_part('month', e.hire_date) !=02; 

--42. From the following table, write a SQL query to find those
--employees who joined in the year 91. 
--Return complete information about the employees.
select * from  employees e 
where date_part('year',e.hire_date)=1991; 

--43. From the following table, write a SQL query to find those
--employees who joined in the month of June 1991.
--Return complete information about the employees.
select * from employees e 
where date_part('year', e.hire_date)=1991
and date_part('month',e.hire_date)=06; 

--44. From the following table, write a SQL query to find all the
--employees whose annual salary is within the range 24000 and 50000 
--(Begin and end values are included.). Return complete information
--about the employees.
select * from employees e 
where e.salary *12 between 24000 and 50000;

--45. From the following table, write a SQL query to find all 
--those employees who have joined on 1st May, 
--20th Feb, and 3rd Dec in the year 1991.
--Return complete information about the employees.
select * from employees e 
where to_char(hire_date,'dd-mm-yyyy') in ('01-05-1991',
										 '20-02-1991','03-12-1991'); 

--46. From the following table, write a SQL query to find 
--those employees working under the managers 63679 or 68319 or
--66564 or 69000. Return complete information about the employees.
select * from employees e 
where e.manager_id in (63679,68319,66564,69000);

--47. From the following table, write a SQL query to
--find those employees who joined after the month 
--JUNE in the year 1991 and within this year. 
--Return complete information about the employees
SELECT *
FROM employees
WHERE hire_date BETWEEN '01-JUL-91' AND '31-DEC-91';
--
--48. From the following table, write a SQL query to find
--those employees who joined in 90's. 
--Return complete information about the employees.
select * from employees e 
where e.hire_date between '1990-01-01' and '1999-12-30';

--OR
SELECT *
FROM employees
WHERE to_char(hire_date,'YY') BETWEEN '90' AND '99';

--49. From the following table, write a SQL query to find those
--managers who are in the department 1001 or 2001.
--Return complete information about the employees. 

select *
from employees e
where e.job_name='MANAGER'
and e.dep_id in (1001,2001); 

--50. From the following table, write a SQL query to find those 
--employees who joined in the month FEBRUARY with a salary 
--range between 1001 to 2000 (Begin and end values are included.).
--Return complete information about the employees.
select * from employees e 
where date_part('month',e.hire_date)=02
and e.salary between 1001 and 2000; 


--
--51. From the following table, write a SQL query to find those employees
--who joined before or after the year 1991. Return complete
--information about the employees.

select * from employees e 
where date_part('year', e.hire_date)> 1991 
or date_part('year', e.hire_date)<  1991 ;

--OR

SELECT *
FROM employees
WHERE to_char (hire_date,'YYYY') NOT LIKE '1991';

--
--52. From the following tables, write a SQL query to find employees along 
--with department name. Return employee ID, employee name,
--job name, manager ID, hire date, salary, commission, 
--department ID, and department name.
select * 
from employees e 
inner join department d 
on e.dep_id=d.dep_id ;

--53. From the following tables, write a SQL query to find those 
--employees who earn 60000 in a year or not working as an ANALYST.
--Return employee name, job name, (12*salary) as 
--Annual Salary, department ID, and grade.
select e.emp_name,e.job_name,(e.salary*12) "Annual Salary",d.dep_id,sg.grade  
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where (e.salary*12)>=60000
or e.job_name !='ANALYST';


--54. From the following table, write a SQL query to find those employees 
--whose salary is higher than the salary of their managers.
--Return employee name, job name, manager ID, salary, manager 
--name, manager's salary.

SELECT w.emp_name,
       w.job_name,
       w.manager_id,
       w.salary,
       m.emp_name "Manager",
       m.emp_id,
       m.salary "Manager_Salary"
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary > m.salary;


--55. From the following table, write a SQL query to find those 
--employees whose salary is between 2000 and 5000 
--(Begin and end values are included.) and location is PERTH. 
--Return employee name, department ID, salary, and commission.
 
select * from employees e 
inner join department d 
on e.dep_id =d.dep_id
where d.dep_location='PERTH'
and e.salary between 2000 and 5000;


--56. From the following table, write a SQL query to find those employees
--whose department ID is 1001 or 3001 and salary grade is not 4.
--They joined the company before 1992-12-31. Return grade, employee name.
select sg.grade,e.emp_name 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where e.dep_id in (1001,3001)
and sg.grade !=4
and e.hire_date < '1992-12-31'
order by 1;


--57. From the following table, write a SQL query to find those 
--employees whose manager name is JONAS. Return employee id,
--employee name, job name, manager ID, hire date, salary, department ID,
--employee name.
select e.emp_id,e.emp_name,e.manager_id,e2.emp_id,e2.emp_name "Manager",e2.manager_id
from employees e,employees e2
where e.manager_id=e2.emp_id 
and e2.emp_name='JONAS' ;


--58. From the following table, write a SQL query to find 
--the name and salary of the employee FRANK. Salary should be
--equal to the maximum salary within his or her salary group.

select e.emp_name,e.salary 
from employees e 
inner join salary_grade sg
on e.salary between sg.min_sal and sg.max_sal 
where e.emp_name='FRANK'
and e.salary=sg.max_sal;

--59. From the following table, write a SQL query to find those employees
--who are working either as a MANAGER or an ANALYST with 
--a salary in the range 2000, 5000 (Begin and end values are included.)
--without any commission. Return complete information about the employees.

select * 
from employees e 
where e.job_name in ('MANAGER','ANALYST')
and e.salary between 2000 and 5000; 

--
--60. From the following table, write a SQL query to find those 
--employees working at PERTH, or MELBOURNE with an experience over 10 years
--. Return employee ID, employee name, department ID, salary,
--and department location.

select *
from employees e
inner join department d 
on e.dep_id =d.dep_id
where d.dep_location in ('PERTH','MELBOURNE')
and (now()::date-hire_date)>10*365; 

--61. From the following table, write a SQL query to find those
--employees whose department location is SYDNEY or 
--MELBOURNE with a salary range of 2000, 5000 
--(Begin and end values are included.) and joined in 1991.
--Return employee ID, employee name, department ID, salary, and 
--department location.
select * from employees e
inner join department d 
on e.dep_id =d.dep_id
where d.dep_location in ('SYDNEY','MELBOURNE')
and e.salary between 2000 and 5000
and date_part('year',e.hire_date)=1991;

--62. From the following table, write a SQL query to find those employees
--of MARKETING department come from MELBOURNE or 
--PERTH within the grade 3 ,4, and 5 and experience over 25 years.
--Return department ID, employee ID,
--employee name, salary, department name, department location and grade.
select * from employees e 
inner join department d 
on e.dep_id=d.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where d.dep_name ='MARKETING'
and d.dep_location in ('MELBOURNE','PERTH')
and sg.grade in (3,4,5)
and (now()::date-hire_date)>25*365;


--63. From the following table, write a SQL query to find those
--employees who are senior to their manager.
--Return complete information about the employees.
select e.emp_id,e.emp_name,e2.manager_id,e2.emp_id,e2.emp_name,e2.manager_id  
from employees e,employees e2 
where e.manager_id =e2.emp_id
and e.hire_date < e2.hire_date ;

select * from employees e ;


--64. From the following tables, write a SQL query to find those 
--employees whose grade is 4 and salary between minimum and maximum salary.
--Return all information of each employees and 
--their grade and salary related details.
select * from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where sg.grade =4;

--65. From the following tables, write a SQL query to find 
--those employees, excluding MARKER or ADELYN of the department 
--PRODUCTION or AUDIT and joined after 1991. Return employee name.

select * from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_name in ('PRODUCTION','AUDIT')
AND e.emp_name NOT IN ('MARKER',
                         'ADELYN')
AND to_char(hire_date,'YYYY') >'1991';

--66. From the following table, write a SQL query to find the
--employees and their salaries. Sort the result-set in ascending
--order by salaries. Return complete information about the employees.

select * from employees e 
order by e.salary ;

--67. From the following table, write a SQL query to list employees 
--in ascending order on department ID and descending order on jobs.
--Return complete information about the employees.
select * from employees e 
order by e.dep_id,e.job_name desc; 

--68. From the following table, write a SQL query to find 
--the entire unique jobs in descending order. Return job name.
select distinct e.job_name 
from employees e 
order by 1 desc;

--69. From the following table, write a SQL query to find 
--the employees in the ascending order of their annual salary.
--Return employee ID, employee name, monthly salary, salary/30 
--as Daily_Salary, and 12*salary as Anual_Salary.

select e.emp_id ,e.emp_name,e.salary "Monthly",e.salary/30 "Daily_Salary",
e.salary*12 "Anual_Salary"  
from employees e 
order by 5 desc;

--70. From the following table, write a SQL query to find those 
--employees who are either 'CLERK' or 'ANALYST’. 
--Sort the result set in descending order 
--on job_name. Return complete information about the employees.  
select * from employees e 
where e.job_name in ('CLERK','ANALYST')
order by e.job_name desc;

--71. From the following table, write a SQL query to find 
--the department location of employee ‘CLARE’. 
--Return department location.

select d.dep_location 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where e.emp_name ='CLARE' ;

--72. From the following table, write a SQL query to find 
--those employees who joined on 1-MAY-91, or 3-DEC-91, or 19-JAN-90.
--Sort the result-set in ascending order by hire date. 
--Return complete information about the employees.
select * from employees e 
where e.hire_date in ('1991-05-01','1991-12-03','1990-01-19');


--73. From the following table, write a SQL query to find 
--those employees who draw salary less than 1000.
--Sort the result-set in ascending order by salary. 
--Return complete information about the employees.
select * from employees e 
where e.salary <1000;


--74. From the following table, write a SQL query to list the 
--employees in ascending order on the salary.
--Return complete information about the employees.
select * from employees e 
order by e.salary ;


--75. From the following table, write a SQL query to list the employees 
--in the ascending order on job name and descending order on employee id.
--Return complete information about the employees.
select * from employees e 
order by e.job_name,e.emp_id desc;

--76. From the following table, write a SQL query to list the
--unique jobs of department 2001 and 3001 in descending order.
--Return job name.
select distinct e.job_name 
from employees e 
where e.dep_id in (2001,3001);

--77. From the following table, write a SQL query to list all the
--employees except PRESIDENT and MANAGER in ascending 
--order of salaries. Return complete information about the employees .
select * from employees e 
where e.job_name not in ('PRESIDENT','MANAGER')
order by e.salary ;

--78. From the following table, write a SQL query to find the
--employees whose annual salary is below 25000. 
--Sort the result set in ascending order of the salary.
--Return complete information about the employees.
select * from employees e 
where e.salary *12 < 25000;


--79. From the following table, write a SQL query to list the 
--employees who works as a SALESMAN. 
--Sort the result set in ascending order of annual salary.
--Return employee id, name, annual salary, daily salary of all the employees.
select * from employees e 
where e.job_name='SALESMAN'
order by e.salary *12 ;

--80. From the following table, write a SQL query to list the employee 
--ID, name, hire date, current date and experience of the
--employees in ascending order on their experiences.
select * from employees e 
order by e.hire_date desc;

--81. From the following table, write a SQL query to list 
--the employees in ascending order of designations of those 
--joined after the second half of 1991. 
SELECT *
FROM employees
WHERE hire_date>('1991-6-30')
  AND date_part('year',hire_date)=1991
ORDER BY job_name ASC;

--82. From the following tables, write a SQL query to find the
--location of all the employees working in FINANCE or AUDIT 
--department. Sort the result-set in ascending order by department ID.
--Return complete information about the employees. 

select * from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_name in ('FINANCE','AUDIT')
order by e.dep_id ; 

--83. From the following tables, write a SQL query to find the 
--employees along with grades in ascending order. 
--Return complete information about the employees.
select * from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal ;


--84. From the following table, write a SQL query to find the 
--employees according to the department in ascending order.
--Return name, job name, department, salary, and grade.
select e.emp_name,e.job_name,d.dep_name,e.salary 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
order by 3;

--85. From the following tables, write a SQL query to find all employees 
--except CLERK and sort the result-set in descending order by salary. 
--Return employee name, job name, salary, grade and department name.

select * from  employees e 
where e.job_name !='CLERK'
order by e.salary desc ;


--86. From the following table, write a SQL query to find those
--employees work in the department 1001 or 2001. Return employee ID,
--name, salary, department, grade, experience, and annual salary.
select e.*,e.salary*12 "Anual Sal" from employees e 
inner join department d 
on d.dep_id =e.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where e.dep_id in (1001,2001);


--87. From the following table, write a SQL query to list the details 
--of the employees along with the details of their departments

select * from employees e 
inner join department d 
on e.dep_id =d.dep_id ;

--88. From the following table, write a SQL query to list the
--employees who are senior to their MANAGERS.
--Return complete information about the employees.

select * from employees e ;

select e.emp_id,e.emp_name,e.manager_id,e.hire_date 
,e2.emp_id,e2.emp_name,e2.manager_id,e2.hire_date  
from employees e ,employees e2 
where e.manager_id=e2.emp_id 
and e.hire_date < e2.hire_date ;

--89. From the following table, write a SQL query to find those
--employees who work in the department 1001. Sort the 
--result-set in ascending order by salary. Return employee ID,
--employee name, salary and department ID.
select * from employees e 
where e.dep_id =1001
order by e.salary ;

--90. From the following table, write a SQL 
--query to find the highest salary. Return highest salary.  
select max(e.salary) from employees e ;

--91. From the following table, write a SQL query to find the average 
--salary and average total remuneration (salary and commission) 
--for each type of job. Return name, average salary and average total remuneration. 

select e.job_name,avg(e.salary),avg(e.salary+coalesce(e.commission,0)) 
from employees e 
group by 1;


select e.job_name,avg(e.salary),avg(e.salary+e.commission) 
from employees e 
group by 1;

--
--92. From the following table, write a SQL query to compute the
--total annual salary distributed against each job in the year
--1991. Return job name, total annual salary.
select e.job_name,sum(e.salary *12) 
from employees e 
group by 1;

--93. From the following table, write a SQL query to list 
--the employee id, name, department id, location of all the employees.
select * from employees e 
inner join department d 
on d.dep_id =e.dep_id ;


--94. From the following table, write a SQL query to find 
--those employees who work in the department ID 1001 or 2001.
--Return employee ID, employee name, department ID, 
--department location, and department name.
select * from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where e.dep_id in (1001,2001);

--95. From the following table, write a SQL query to find those
--employees whose salary is in the range minimum and maximum salary 
--(Begin and end values are included.). 
--Return employee ID, name, salary and grade.
select e.emp_id,e.emp_name,e.salary,sg.grade,sg.min_sal,sg.max_sal 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal ;

--96. From the following table, write a SQL query to list
--the managers and number of employees work under them. 
--Sort the result set in ascending order on manager. 
--Return manager ID and number of employees under them.

select e.manager_id,count(*)
from employees e ,employees e2 
where e.manager_id=e2.emp_id 
group by 1;

--97. From the following table, write a SQL query to count the
--number of employees of each designation in each department.
--Return department id, job name and number of employees.
select d.dep_id,e.job_name,count(*) 
from employees e 
inner join department d 
on d.dep_id =e.dep_id 
group by 1,2;

--98. From the following table, write a SQL query to find 
--those departments where at least two employees work.
--Return department id, number of employees.  
select e.dep_id,count(*) 
from employees e 
group by 1
having count(*)>=2;

--99. From the following table, write a SQL query to list the
--grade, number of employees, and maximum salary of each grade .

select sg.grade,count(*),max(e.salary) 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
group by 1;

--100. From the following table, write a SQL query to find those
--departments where at least two employees work as a 
--SALESMAN in each grade. Return department name, grade 
--and number of employees. 


select d.dep_name,sg.grade,count(*) 
from employees e 
inner join department d 
on d.dep_id =e.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where e.job_name='SALESMAN'
group by 1,2
having count(*)>=2;

--
--101. From the following table, write a SQL query to find those
--departments where less than four employees work. Return 
--department ID, number of employees. 

select e.dep_id,count(*) 
from employees e 
group by 1
having count(*)<4;


--102. From the following tables, write a SQL query to find 
--those departments where at least two employees work.
--Return department name, number of employees.
select e.dep_id,count(*) 
from employees e 
group by 1
having count(*)>2;


--103. From the following table, write a SQL query to check
--whether the employees ID are unique or not.
--Return employee id, number of employees.
select e.emp_id,count(*) 
from employees e 
group by 1;

--104. From the following table, write a SQL query to find
--number of employees and average salary. Group the result
--set on department id and job name. Return number of employees,
--average salary, department ID, and job name.
select count(*),e.dep_id,e.job_name,avg(e.salary) 
from employees e 
group by 2,3;


--105. From the following table, write a SQL query to find 
--those employees whose name start with 'A' and six characters
--in length. Return employee name.

select e.emp_name 
from employees e 
where length(e.emp_name)=6 
and e.emp_name like 'A%';

--106. From the following table, write a SQL query 
--to find those employees whose name is six characters in 
--length and the third character must be 'R'.
--Return complete information about the employees. 
select e.* 
from employees e 
where length(e.emp_name)=6 
and e.emp_name like '__R%';

--107. From the following table, write a SQL query to find
--those employees whose name is six characters in length,
--starting with 'A' and ending with 'N'. Return number of employees.

select * 
from employees e 
where length(e.emp_name)=6 
and e.emp_name like 'A%N';

--108. From the following table, write a SQL query to find 
--those employees who joined in the month of where the second 
--letter is 'a'. Return number of employees.
select * from employees e 
where to_char(e.hire_date,'mon') like '_a%'; 

--109. From the following table, write a SQL query to 
--find those employees whose names contain the character 
--set 'AR' together. Return complete information about the employees.
select * from employees e 
where e.emp_name like '%AR%';

--110. From the following table, write a SQL query to
--find those employees who joined in 90's.
-- Return complete information about the employees.
select * from employees e 
where to_char(e.hire_date,'yy') like '9%'; 

--111. From the following table, write a SQL query to find 
--those employees whose ID not start with the digit 68. 
--Return employee ID, employee ID using trim function.
 
select * from employees e 
where e.emp_id::varchar not like '68%'; 

--OR

SELECT emp_id,
       trim(to_char(emp_id,'99999'))
FROM employees
WHERE trim(to_char(emp_id,'99999')) NOT LIKE '68%';

--112. From the following table, write a SQL query to 
--find those employees whose names contain the letter 'A’.
-- Return complete information about the employees. 

select * from employees e 
where e.emp_name like '%A%';


--113. From the following table, write a SQL query to 
--find those employees whose name ends with 'S' 
--and six characters long. Return complete information about the employees.

select * from employees e 
where e.emp_name like'%S'
and length(e.emp_name)=6;

--114. From the following table, write a SQL query to find
--those employees who joined in any month, but the month name 
--contain the character ‘A’. Return complete information about the employees.

select * from employees e 
where to_char(e.hire_date,'MONTH') like '%A%'; 


--115. From the following table, write a SQL query to find those
--employees who joined in any month, but the name of the month 
--contain the character ‘A’ in second position. return
--complete information about the employees.


select * from employees e 
where to_char(e.hire_date,'MONTH') like '_A%'; 






















































































































































































