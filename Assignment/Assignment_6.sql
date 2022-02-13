

--Window Function Assignment
--
--
--1. What are the top 5 most well paid employees?
select tt.employee_id,tt.first_name,tt.last_name,tt.department_id,tt.salary
from
(select e.*,
row_number () over (order by e.salary desc) "rank"
from employees e)tt
where tt.rank <6;

--2. What are the top 5 most well paid employees?
select tt.employee_id,tt.first_name,tt.last_name,tt.department_id,tt.salary
from
(select e.*,
row_number () over (order by e.salary desc) "rank"
from employees e)tt
where tt.rank <6;


--3. Find top 2 employee with highest salary of each department.
select * from 
(select e.employee_id,e.first_name,e.salary,e.department_id,
row_number() over (partition by e.department_id order by salary desc)
from employees e )tt
where tt.row_number<=2;



--4. Find top 5 cities where highest number of employee are worked.
select * from 
(select tt.*,
row_number() over(order by tt.count desc) 
from 
(select l.city,count(*)
from employees e
inner join departments d 
on d.department_id=e.department_id 
inner join locations l 
on l.location_id=d.location_id
group by 1)tt)ttt
where ttt.row_number<=5;

--5. Find top 2 department where 
-- Who works in the same department as Clark? 
-- (Solution should be from subquery)
select * from departments d ;
select * from employees e ;


--7. Who are the employees that receive more 
--   than the average salary of their department?
--   (Solution should be from subquery)

select e.employee_id,e.first_name,e.last_name,e.salary 
from employees e
where e.salary >(select tt.salary from 
				  (select e2.department_id,avg(e2.salary)"salary"
				  from employees e2 
				  where e2.department_id=e.department_id 
				  group by 1)tt);

				 
--OR
select * from 				 
(select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id ,
avg(e.salary) over(partition by e.department_id)"avg_salary" 
from employees e)tt 
where tt.salary>tt.avg_salary;




