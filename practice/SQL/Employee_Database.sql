--
--SQL subqueries on employee Database [77 Exercise with Solution]
--
--
--1. From the following table, write a SQL query to find the managers.
--Return complete information about the managers.
select *
from employees e 
where e.emp_id in (select distinct e2.manager_id 
				   from employees e2);

--2. From the following table, write a SQL query to compute
--the experience of all the managers. Return employee ID, 
--employee name, job name, joining date, and experience.
select * from employees e ;


select e.emp_id,e.emp_name,e.job_name,e.hire_date,
				age(now(),e.hire_date) "Experience"  
from employees e 
where e.emp_id in (select distinct e2.manager_id 
				   from employees e2);


--3. From the following table, write a SQL query to find
--those employees who work as 'MANAGERS' and 'ANALYST' 
--and working in ‘SYDNEY’ or ‘PERTH’ with an experience more 
--than 5 years without receiving the commission. Sort the 
--result-set in ascending order by department location.
--Return employee ID, employee name, salary, and department name.
select e.emp_id,e.emp_name,e.salary,d.dep_name
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where e.job_name in ('MANAGER','ANALYST')
and d.dep_location in ('SYDNEY','PERTH')
and e.commission is null
and (now()::date - e.hire_date) > 5*365
order by d.dep_location;


--4. From the following tables, write a SQL query to find 
--those employees work at SYDNEY or working in the FINANCE 
--department with an annual salary above 28000, but the monthly
--salary should not be 3000 or 2800 and who do not work as a
--MANAGER and whose ID contain a digit of '3' or '7' in 3rd position.
--Sort the result-set in ascending order by department ID and 
--descending order by job name. Return employee ID, employee name, 
--salary, department name, department location, department ID, and job name.

select e.emp_id,e.emp_name,e.salary,d.dep_name,d.dep_location,
			d.dep_id,e.job_name 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_location='SYDNEY' 
and d.dep_name='FINANCE'
and 12*e.salary > 28000
and e.salary not in (3000,2800)
and e.job_name !='MANAGER'
and substring(e.emp_id::varchar,3,1) in ('3','7');


--5. From the following table, write a SQL query to find the 
--employees of grade 2 and 3.Return all the information of 
--employees and salary details.
select * from employees e ;
select * from salary_grade sg ;

select * 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal
where sg.grade in (2,3);

--6. From the following table, write a SQL query to find those
--employees of grade 4 or 5 and who work as ANALYST or MANAGER.
--Return complete information about the employees. 
select * 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal
where sg.grade in (4,5)
and e.job_name in ('ANALYST','MANAGER');


--7. From the following table, write a SQL query to find those
--employees whose salary is more than the salary of JONAS.
--Return complete information about the employees.

select *
from employees e 
where e.salary > (select e2.salary from employees e2
				  where e2.emp_name='JONAS');


--8. From the following table, write a SQL query to find those
--employees who work as same designation of FRANK. 
--Return complete information about the employees. 
select *
from employees e 
where e.job_name = (select e2.job_name from employees e2
				  where e2.emp_name='FRANK');


--9. From the following table, write a SQL query to find 
--those employees who are senior to ADELYN. 
--Return complete information about the employees.

select * 
from employees e
where age(now(),e.hire_date) > age(now(),(select e2.hire_date 
								from employees e2
								where e2.emp_name='ADELYN')); 
				 
				 
--OR
SELECT *
FROM employees
WHERE hire_date <
    (SELECT hire_date
     FROM employees
     WHERE emp_name = 'ADELYN');

--10. From the following table, write a SQL query to find those employees 
--of department ID 2001 and whose designation is same 
--as of the designation of department ID 1001. 
--Return complete information about the employees.
select * from employees e
where e.dep_id=2001
and e.job_name in (select e.job_name from employees e
				  where e.dep_id=1001)	 ; 
 --OR   
SELECT *
FROM employees e,
     department d
WHERE d.dep_id = 2001
  AND e.dep_id = d.dep_id
  AND e.job_name IN
    (SELECT e.job_name
     FROM employees e,
          department d
     WHERE e.dep_id = d.dep_id
       AND d.dep_id =1001);
    
-- 11. From the following table, write a SQL query to find 
-- those employees whose salary is the same as the salary 
-- of FRANK or SANDRINE. Sort the result-set in descending 
-- order by salary. Return complete information about the employees.
    
SELECT *
FROM employees 
WHERE salary IN
    (SELECT salary
     FROM employees e
     WHERE (emp_name = 'FRANK'
            OR emp_name = 'BLAZE')
AND employees.emp_id <> e.emp_id)
ORDER BY salary DESC;

    
--12. From the following table, write a SQL query to find 
--those employees whose designation are the same as the 
--designation of MARKER or salary is more than the salary of ADELYN. 
--Return complete information about the employees.
 select * 
 from employees e    
 where e.job_name =(select e2.job_name 
 					from employees e2
 					where e2.emp_name='MARKER')
or e.salary >(select e2.salary 
 			   from employees e2
 			   where e2.emp_name='ADELYN') ;   
    
--13. From the following table, write a SQL query to find 
--those employees whose salary is more than the total 
--remuneration (salary + commission) of the designation SALESMAN.
--Return complete information about the employees.
select * from employees e ;
select * from department d ;
 			  
 select * 
from employees e
where e.salary > (select max(e.salary+e.commission) from employees e
				  where e.job_name='SALESMAN');   
    
    
--14. From the following table, write a SQL query to find those
--employees who are senior to BLAZE and working at PERTH or 
--BRISBANE. Return complete information about the employees.
select * 
from employees e   
inner join department d 
on d.dep_id =e.dep_id 
and d.dep_location in ('PERTH','BRISBANE')
and e.hire_date < (select e2.hire_date 
				   from employees e2
				  where e2.emp_name='BLAZE');
    
--15. From the following tables, write a SQL query to find those 
--employees of grade 3 and 4 and work in the department of FINANCE
--or AUDIT and whose salary is more than the salary of ADELYN and 
--experience is more than FRANK. Return complete information about
--the employees.
select * 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal
inner join department d 
on d.dep_id =e.dep_id 
where sg.grade in (4,3)
and d.dep_name in ('AUDIT','FINANCE')
and e.salary >(select e2.salary 
 			   from employees e2
 			   where e2.emp_name='ADELYN')
and e.hire_date <(select e2.hire_date 
 			   from employees e2
 			   where e2.emp_name='FRANK');
    
--16. From the following table, write a SQL query to 
--find those employees whose designation is same as the 
--designation of SANDRINE or ADELYN. Return complete 
--information about the employees. 				 
select *
from employees e 				 
where e.job_name in (select e2.job_name 
					 from employees e2
					 where e2.emp_name in ('SANDRINE','ADELYN')); 				 
				 
--17. From the following table, write a SQL query to list 
--any job of department ID 1001 which are not found in 
--department ID 2001. Return job name. 
(select e.job_name 
from employees e
where e.dep_id =1001)
except
(select e.job_name 
from employees e
where e.dep_id =2001);					

--OR
SELECT e.job_name
FROM employees e
WHERE e.dep_id = 1001
  AND e.job_name NOT IN
    (SELECT job_name
     FROM employees
     WHERE dep_id =2001);

--18. From the following table, write a SQL query to find 
--the highest paid employee. Return complete information
--about the employees.
      
 select * from employees e 
 where e.salary =(select max(e2.salary)
 				  from employees e2);
    
--19. From the following table, write a SQL query to find the highest
--paid employees in the department MARKETING.
--Return complete information about the employees.
select * from employees e 
where (e.dep_id,e.salary)=(select d.dep_id,max(e.salary) 
							from employees e 
							inner join department d 
							on d.dep_id =e.dep_id 
							where d.dep_name='MARKETING'
							group by 1); 
 				 
--OR
SELECT *
FROM employees
WHERE salary IN
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT d.dep_id
          FROM department d
          WHERE d.dep_name = 'MARKETING'));						
    
--20. From the following tables, write a SQL query to find
--the employees of grade 3 who joined recently and location 
--at PERTH. Return employee ID, employee name, job name, hire date, 
--and salary.     
--    
    
select * 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal
inner join department d 
on d.dep_id =e.dep_id 
where sg.grade =3
and d.dep_location ='PERTH'
order by e.hire_date
limit 1;
    
    
--21. From the following table, write a SQL query to find 
--those employees who are senior to recently hired employee 
--and work under KAYLING. Return complete information about
--the employees.
select * from employees e3 
where e3.hire_date <(select max(e.hire_date) from employees e 
					where e.manager_id=(select e2.emp_id from employees e2
					where e2.emp_name='KAYLING'));


--22. From the following tables, write a SQL query to find 
--those employees of grade 3 to 5 and location at SYDNEY. 
--The employees are not in PRESIDENT designated and salary is more 
--than the highest paid employee of PERTH where no MANAGER and SALESMAN
--are working under KAYLING. Return complete information about the employees.
select * from employees e 
inner join department d 
on e.dep_id =d.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where sg.grade between 3 and 5
and d.dep_location='SYDNEY'
and e.job_name !='PRESIDENT'
and e.salary > (select max(e.salary) 
				from employees e 
				inner join department d 
				on d.dep_id =e.dep_id
				and d.dep_location='PERTH'
				and e.job_name in ('MANAGER','SALESMAN')
				and e.manager_id not in (select e2.emp_id from employees e2 
									where e2.emp_name='KAYLING'));


--23. From the following table, write a SQL query to find 
--those employees who are senior employees as of year 1991. 
--Return complete information about the employees.
select * 
from employees e
where substring(e.hire_date::varchar,1,4)::int < 1991 ;

select * from employees e2 
where e2.hire_date=(select min(e.hire_date) 
			from employees e 
			where to_char(e.hire_date,'yyyy')='1991'); 


--24. From the following table, write a SQL query to find 
--those employees who joined in 1991 in a designation same
--as the most senior person of the year 1991. Return 
--complete information about the employees.
select *
from employees e 
where e.job_name=(select e2.job_name 
				from employees e2 
				where e2.hire_date =(select min(e.hire_date)
				from employees e 
				where to_char(e.hire_date,'yyyy')='1991'))
and to_char(e.hire_date,'yyyy')='1991'; 
		
--25. From the following table, write a SQL query to 
--find the most senior employee of grade 4 or 5, work under KAYLING.
--Return complete information about the employees.
select * 
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
and sg.grade in (4,5)
and manager_id=(select e2.emp_id from employees e2
					where e2.emp_name='KAYLING')
and e.hire_date=(select min(e.hire_date) 
				from employees e 
				inner join salary_grade sg 
				on e.salary between sg.min_sal and sg.max_sal 
				and sg.grade in (4,5)
				and manager_id=(select e2.emp_id from employees e2
									where e2.emp_name='KAYLING'));


--26. From the following table, write a SQL query to compute
--the total salary of the designation MANAGER. Return total salary.
select sum(e.salary)
from employees e 
where e.job_name ='MANAGER';
								

--27. From the following table, write a SQL query to compute
--the total salary of employees of grade 3. Return total salary.
select sum(e.salary)
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
and sg.grade =3;

--28. From the following table, write a SQL query to find those
--employees of department 1001 and whose salary is more than 
--the average salary of employees in department 2001.
--Return complete information about the employees. 
select * from employees e 
where e.dep_id =1001
and e.salary > (select avg(e.salary) 
				from employees e 
				where e.dep_id =2001);

--29. From the following table, write a SQL query to find 
--those departments where maximum number of employees work.
--Return department ID, department name, location and number of employees.
select tt.dep_id,tt.dep_name,tt.dep_location,tt.num from 
(select d.dep_id,d.dep_name ,d.dep_location,
count(*) over (partition by d.dep_id) "num"
from employees e 
inner join department d 
on e.dep_id =d.dep_id)tt
where tt.num=(select max(ttt.count) from 
				(select count(*)
				from employees e
				group by e.dep_id)ttt)
group by 1,2,3,4;



--OR

select d.dep_id ,d.dep_name,d.dep_location ,count(*)
from employees e 
inner join department d 
on d.dep_id =e.dep_id 
group by 1,2,3
having count(*)=(select max(tt.num)
				from 
				(select e.dep_id,count(*) "num"
				from employees e 
				inner join department d 
				on d.dep_id =e.dep_id 
				group by 1)tt
				);
--OR
SELECT d.dep_id,
       d.dep_name,
       d.dep_location,
       count(*)
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
GROUP BY d.dep_id
HAVING count(*) =
  (SELECT MAX (mycount)
   FROM
     (SELECT COUNT(*) mycount
      FROM employees
      GROUP BY dep_id) a);


--30. From the following table, write a SQL query to find 
--those employees whose manager is JONAS. Return complete 
--information about the employees.
select * from employees e 
where e.manager_id =(select e2.emp_id from employees e2
					where e2.emp_name='JONAS');


--31. From the following table, write a SQL query to find 
--those employees who are not working in the department MARKETING.
--Return complete information about the employees.
select e.*
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
and d.dep_name !='MARKETING';

--32. From the following table, write a SQL query to find 
--those employees who are working as a manager.
--Return employee name, job name, department name, and location.
SELECT e.emp_name,
       e.job_name,
       d.dep_name,
       d.dep_location
FROM employees e,
     department d
WHERE e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT manager_id
     FROM employees);

--33. From the following table, write a SQL query to 
--find those employees who receive the highest salary of 
--each department. Return employee name and department ID.   
select e2.emp_name,e2.dep_id 
from employees e2 
where (e2.dep_id,e2.salary )=any(select e.dep_id,max(e.salary) 
								from employees e 
								group by 1);

--34. From the following table, write a SQL query to find those 
--employees whose salary is equal or more to the average of 
--maximum and minimum salary. Return complete information about
--the employees.
SELECT *
FROM employees
WHERE salary >=
    (SELECT (max(salary)+min(salary))/2
     FROM employees);

--35. From the following table, write a SQL query to find
--those managers whose salary is more than the average salary of
--his employees. Return complete information about the employees.
SELECT *
FROM employees m
WHERE m.emp_id IN
    (SELECT manager_id
     FROM employees)
  AND m.salary >
    (SELECT avg(e.salary)
     FROM employees e
     WHERE e.manager_id = m.emp_id );
    
--36. From the following table, write a SQL query to find those employees 
--whose salary is less than the salary of his manager
--but more than the salary of any other manager. 
--Return complete information about the employees.
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary < m.salary
  AND w.salary > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id IN
         (SELECT manager_id
          FROM employees));

    
-- 37. From the following table, write a SQL query to compute
-- department wise average salary of employees. 
-- Return employee name, average salary, department ID as "Current Salary".   
 select e.emp_name,
 avg(e.salary) over (partition by e.dep_id)  ,
 e.dep_id "Current Salary	"
 from employees e 
 
--OR
SELECT e.emp_name,
       d.avgsal,
       e.dep_id AS "Current Salary"
FROM employees e,

  (SELECT avg(salary) avgsal,
          dep_id
   FROM employees
   GROUP BY dep_id) d
WHERE e.dep_id=d.dep_id;         
         
--38. From the following table, write a SQL query to find five
--lowest paid workers. Return complete information about the employees.
select * from 
(select e.*,
rank() over (order by e.salary) 
from employees e)tt          
where tt.rank<=5;         
         
--OR
SELECT *
FROM employees e
WHERE 5>
    (SELECT count(*)
     FROM employees
     WHERE e.salary >salary);

--39. From the following table, write a SQL query to find those
--managers who are not working under the PRESIDENT. 
--Return complete information about the employees.
select * from employees e
where e.emp_id in (select e2.manager_id from employees e2)
and e.manager_id !=(select e.emp_id from employees e 
where e.job_name ='PRESIDENT');


--41. From the following table, write a SQL query to find those departments 
--where the number of employees is equal to the number of characters 
--in the department name. Return complete information about the employees.
select d.dep_name,count(*) 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
group by 1
having length(d.dep_name)=count(*);

--OR
SELECT *
FROM department d
WHERE length(dep_name) IN
    (SELECT count(*)
     FROM employees e
     WHERE e.dep_id = d.dep_id );


--42. From the following tables, write a SQL query to find 
--those departments where the highest number of employees works. 
--Return department name.
select d.dep_name 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
group by 1
having count(*)=(select max(tt.count) from  (select count(*) from 
				employees e2
				group by e2.dep_id)tt);
  


--43. From the following table, write a SQL query to find 
--those employees who joined in the company on the same date. 
--Return complete information about the employees.
select *
from employees e 
where e.hire_date in (select e2.hire_date 
					  from employees e2
					  where e.emp_id <>e2.emp_id)

					
select *
from employees e 
where e.hire_date in (select e2.hire_date 
					  from employees e2
					  where e.emp_id =e2.emp_id)					
					
--OR
select  e.* 
from employees e 
join employees e2 
on e.hire_date=e2.hire_date
and e.emp_id <>e2.emp_id;

--44. From the following table, write a SQL query to find those
--departments where more than average number of employees works. 
--Return department name.
select d.dep_name 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
group by 1
having count(*) > (select avg(tt.count) from  (select count(*) from 
				employees e2
				group by e2.dep_id)tt);

--45. From the following table, write a SQL query to find those 
--managers who handle maximum number of employees. 
--Return managers name, number of employees.
select e.emp_name,ttt.count from 
(select e.manager_id,count(*)
from employees e 
group by 1
having count(*)=(select max(tt.count) from 
				(select e.manager_id ,count(*)
				from employees e 
				group by 1)tt))ttt
inner join employees e 
on e.emp_id =ttt.manager_id;


--46. From the following table, write a SQL query to find those 
--managers who receive less salary then the employees work under
--them. Return complete information about the employees.
select distinct e2.*
from employees e ,employees e2 
where e.manager_id =e2.emp_id 
and e.salary > e2.salary;

--OR
SELECT *
FROM employees w
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE w.salary<salary);

--47. From the following table, write a SQL query to find those 
--employees who are sub-ordinates of BLAZE. 
--Return complete information about the employees.
 
select * from employees e
where e.manager_id =(select e2.emp_id 
					from employees e2
					where e2.emp_name='BLAZE');


--48. From the following table, write a SQL query to find those
--employees who work as managers. Return complete information about 
--the employees. Use co-related subquery. 
select * from employees e 
where e.emp_id in (select e2.manager_id from employees e2);

--49. From the following table, write a SQL query to list
--the name of the employees for their manager JONAS and 
--the name of the manager of JONAS.
select tt.emp_name,'JONAS' "Manager for employees",(select e.emp_name 
										from employees e 
							where e.emp_id =(select e2.manager_id 
												from employees e2
												where e2.emp_name='JONAS'))
												"manager of JONAS"
from 
(select e.emp_name,e.manager_id 
from employees e 
where e.manager_id =(select e2.emp_id 
					from employees e2
					where e2.emp_name='JONAS')) tt;


--50. From the following table, write a SQL query to find those 
--employees who receive minimum salary for a designation. 
--Sort the result-set in ascending order by salary. 
--Return complete information about the employees.
select * from 				
(select e.*,
min(e.salary) over (partition by e.job_name order by salary)
from employees e)tt 
where tt.salary=tt.min;

--51. From the following table, write a SQL query to find those employees
--who receive maximum salary for a designation.
--Sort the result-set in descending order by salary.
--Return complete information about the employees.
 select * from 				
(select e.*,
max(e.salary) over (partition by e.job_name order by e.salary desc)
from employees e)tt 
where tt.salary=tt.max;
				
				
--52. From the following table, write a SQL query to find recently 
--hired employees of every department.
--Sort the result-set in descending order by hire date.
--Return complete information about the employees.
select *
from employees e 
where (e.dep_id,e.hire_date)= any(select e.dep_id ,max(e.hire_date) 
								from employees e 
								group by 1
								);

--53. From the following table, write a SQL query to 
--find those employees who receive a salary higher 
--than the average salary of their department. 
--Sort the result-set in ascending order by department ID.
--Return employee name, salary, and department ID. 
select e.emp_name,e.salary,e.dep_id 
from employees e 
where e.salary > (select avg(e2.salary) 
					from employees e2 
					where e.dep_id =e2.dep_id 
					group by e2.dep_id)
				order by 3;

--54. From the following table, write a SQL query to find those
--employees who earn a commission and receive maximum salary.
--Return complete information about the employees.
select * 
from employees e
where e.commission is not null
and e.salary = (
				select max(e.salary) 
				from employees e
				where e.commission is not null
				);

--55. From the following table, write a SQL query to find those 
--employees who do not work in the department 1001 but work in 
--the same designation and salary as the employees in department 3001. 
--Return employee name, job name and salary.
select e.emp_name,e.job_name,e.salary 
from employees e 
where e.dep_id !=1001
and (e.job_name,e.salary)=any(select e.job_name,e.salary 
						from employees e 
						where e.dep_id =3001);

--56. From the following table, write a SQL query to find those employees 
--who get a commission percent and works as a SALESMAN and 
--earn maximum net salary. Return department ID, name, designation,
--salary, and net salary (salary+ commission).
select e.dep_id,e.emp_name ,e.job_name,e.salary,(e.salary +e.commission) "Net Sal" 
from employees e 
where e.job_name ='SALESMAN'
and e.commission is not null
and(e.salary +e.commission)=(select max(e2.salary +e2.commission)
							from employees e2 
							where e2.job_name='SALESMAN'
							and e2.commission is not null);

--57. From the following table, write a SQL query to find those employees
--who gets a commission and earn the second highest net salary 
--(salary + commission). Return department id, employee name, 
--designation, salary, and net salary.  				
select e.dep_id,e.emp_name,e.job_name,e.salary 
,e.salary +e.commission "net_sal"
from employees e
where e.commission is not null
and (e.salary +e.commission)=(select max(e.salary +e.commission)
						from employees e 
						where e.commission is not null
						and (e.salary +e.commission) not in
						(select max(e.salary +e.commission) "net_sal" 
						from employees e 
						where e.commission is not null));
				
				
--58. From the following table, write a SQL query to find those 
--departments where the average salary is less than the averages 
--for all departments. Return department ID, average salary.				
select e.dep_id,avg(e.salary) 
from employees e 
group by 1
having avg(e.salary) <(select avg(e.salary) 
					  from employees e ) ;
					
					
--59. From the following tables, write a SQL query to find 
--the unique department of the employees. Return complete 
--information about the employees.
select * 
from department d 
where d.dep_id in (select distinct e.dep_id  from employees e );
					

--60. From the following tables, write a SQL query 
--to list the details of the employees working at PERTH.
select e.* from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_location ='PERTH';


--61. From the following tables, write a SQL query to list the 
--employees of grade 2 or 3 and the department where he or
--she works, is located in the city PERTH. 
--Return complete information about the employees.
select e.* from employees e 
inner join department d 
on e.dep_id =d.dep_id 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where d.dep_location ='PERTH'
and sg.grade in (2,3);

--62. From the following table, write a SQL query to find those employees
--whose designation is same as the designation of ADELYN or the 
--salary is more than the salary of WADE. Return complete 
--information about the employees.
select * 
from employees e 
where e.job_name=(select e2.job_name 
				 from employees e2
				 where e2.emp_name='ADELYN') 
or e.salary > (select e2.salary 
				 from employees e2
				 where e2.emp_name='WADE');
				
--63. From the following table, write a SQL query to find those 
--employees of department 1001 whose salary is more than the
--salary of ADELYN. Return complete information about the employees.          
 select *
from employees e 
where e.dep_id =1001
and e.salary >(select e2.salary 
				 from employees e2
				 where e2.emp_name='ADELYN')  ;
				
--64. From the following table, write a SQL query to find those managers
--who are senior to KAYLING and who are junior to SANDRINE. 
--Return complete information about the employees. 
SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees
     WHERE hire_date<
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'KAYLING' )
       AND hire_date >
         (SELECT hire_date
          FROM employees
          WHERE emp_name = 'SANDRINE'))
  AND manager_id IS NOT NULL;

--65. From the following tables, write a SQL query to find those employees
--who work in the department where KAYLING works. 
--Return employee ID, employee name, department location, 
--salary department name.				
select e.emp_id,e.emp_name,d.dep_location,d.dep_name 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where e.dep_id =(select e2.dep_id 
				 from employees e2
				 where e2.emp_name ='KAYLING')
and e.emp_name !='KAYLING';
			
--66. From the following tables, write a SQL query to find those employees 
--whose salary grade is greater than the grade of MARKER. 
--Return complete information about the employees.
select e.*
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
where sg.grade > (select sg.grade 
				  from employees e 
				  inner join salary_grade sg 
				  on e.salary between sg.min_sal and sg.max_sal
				  where e.emp_name ='MARKER');

--67. From the following tables, write a SQL query to find those 
--employees whose grade same as the grade of TUCKER or experience 
--is more than SANDRINE and who are belonging to SYDNEY or PERTH.
--Return complete information about the employees.
select e.*
from employees e 
inner join salary_grade sg 
on e.salary between sg.min_sal and sg.max_sal 
inner join department d 
on e.dep_id =d.dep_id 
where sg.grade = (select sg.grade 
				  from employees e 
				  inner join salary_grade sg 
				  on e.salary between sg.min_sal and sg.max_sal
				  where e.emp_name ='TUCKER')
or e.hire_date < (SELECT hire_date
          		  FROM employees
          		  WHERE emp_name = 'SANDRINE')					  
and d.dep_location in ('SYDNEY','PERTH');  				
				
--68. From the following tables, write a SQL query to find those employees
--whose salary is same as any one of the employee. 
--Return complete information about the employees.
select * 
from employees e
where e.salary = any(select e2.salary 
				  from employees e2
				  where e.emp_id !=e2.emp_id)
				
--69. From the following tables, write a SQL query to 
--find compute the total remuneration (salary + commission) 
--of all sales person of MARKETING department. 
--Return complete information about the employees.
select e.*,(e.salary +e.commission) "remuneration" 
from employees e 
inner join department d 
on e.dep_id =d.dep_id
where d.dep_name ='MARKETING'
and e.job_name ='SALESMAN';
				  
				  
--70. From the following table, write a SQL query to find the recently hired 
--employees of department 3001. Return complete information 
--about the employees.
select * 
from employees e
where e.dep_id =3001
and e.hire_date = (select max(e.hire_date) 
				   from employees e
				   where e.dep_id =3001);	
				  
--71. From the following tables, write a SQL query to find the highest paid 
--employees of PERTH who joined before recently hired employee
--of grade 2. Return complete information about the employees.
select * 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_location='PERTH'
and e.hire_date < (select max(e.hire_date)
				from employees e 
				inner join salary_grade sg 
				on e.salary between sg.min_sal and sg.max_sal 
				and sg.grade =2)
and e.salary =(select max(e.salary) 
from employees e 
inner join department d 
on e.dep_id =d.dep_id 
where d.dep_location='PERTH'
and e.hire_date < (select max(e.hire_date)
				from employees e 
				inner join salary_grade sg 
				on e.salary between sg.min_sal and sg.max_sal 
				and sg.grade =2));
				  
--72. From the following table, write a SQL query to find the highest paid 
--employees work under KAYLING. Return complete information
--about the employees.
select * 
from employees e2 
where e2.manager_id =(select e.emp_id 
					from employees e
					where e.emp_name ='KAYLING')
and e2.salary =(select max(e2.salary) 
				from employees e2 
				where e2.manager_id =(select e.emp_id 
					from employees e
					where e.emp_name ='KAYLING'));					
			
			
--74. From the following table, write a SQL query to find those
--employees whose salaries are greater than the salaries of 
--their managers. Return complete information about the employees.
select *
from employees e
where e.salary > (select e2.salary 
				  from employees e2
				  where e.manager_id=e2.emp_id)
				  

--75. From the following table, write a SQL query to 
--find the maximum average 
--salary drawn for each job except for PRESIDENT.

select max(tt.avg) from  
(select avg(e.salary) 
from employees e 				  
where e.job_name !='PRESIDENT'
group by e.job_name)tt;
				  
--76. From the following table, write a SQL query to count the number of 
--employees who work as a manager. Return number of employees.
select count(distinct e.manager_id) 
from employees e
where e.manager_id is not null;

--77. From the following table, write a SQL query to 
--find those departments where no employee works.
--Return department ID. 
select d.dep_id 
from employees e 
right join department d 
on e.dep_id =d.dep_id 
where d.dep_id is not null
and e.dep_id is null;

		  

				  