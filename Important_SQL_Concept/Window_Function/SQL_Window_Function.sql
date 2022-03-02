
--window Function

select e.department_id,max(e.salary) 
from employees e
group by 1;


select e.*,max(e.salary) over () 
from employees e ;

select e.*,max(e.salary) over (partition by e.department_id) "Max_Salary_By Department"
from employees e ;

--Department Wise max_salary using partation by
select distinct e.department_id,max(e.salary) over (partition by e.department_id)  
from employees e;

---Row_number() --->pagination

--simple row number
select e.employee_id,e.first_name,e.salary,e.department_id 
,row_number() over () 
from employees e ;

--for max salary
select e.employee_id,e.first_name,e.salary,e.department_id 
,row_number() over (order by  e.salary desc) 
from employees e ;


--for department wise pagenatiob
select e.employee_id,e.first_name,e.salary,e.department_id 
,row_number() over (partition by e.department_id order by e.department_id) "rn"
from employees e ;

--fetch the first 2 employee from each department to join the company 
select * from
(select e.employee_id,e.first_name,e.salary,e.department_id,
row_number() over (partition by e.department_id order by e.employee_id) "rn"
from employees e ) tt
where tt.rn<=2;


--Rank() 

--fetch the top 3 employee from each department who earn maximum salary


select * from
(select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
rank () over (partition by e.department_id order by salary desc)
from employees e)tt 
where tt.rank <4;

--Denase_rank()

--fetch the top 3 employee from each department who earn unique maximum salary

select * from 
(select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
dense_rank() over (partition by department_id order by salary desc) "dense_rank" 
from employees e) tt
where tt.dense_rank < 4;


--row_number(),rank(),dense_rank()
select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
row_number() over (partition by e.department_id order by salary desc),
rank() over (partition by e.department_id order by salary desc),
dense_rank () over (partition by e.department_id order by salary desc)
from employees e ;


--LEAD() and LAG()


--fetch a query to display if the salary of an employee is higher,lower or equal
-- to the previous employee.

select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
lag(e.salary) over (partition by e.department_id order by e.employee_id) "prev_emp_salary"
from employees e ;

select e.employee_id,e.first_name,e.last_name,e.salary,e.department_id,
lead(e.salary) over (partition by e.department_id order by e.employee_id) "next_emp_salary"
from employees e ;
















