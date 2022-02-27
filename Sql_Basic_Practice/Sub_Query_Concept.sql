
-- Find the employee who earn the highest salary in each department

select * from employees e ;

select  department_id,max(salary) from employees e 
group by department_id ;


select * from employees e 
where (department_id,salary) in (select  department_id,max(salary)
                                 from employees e 
                                 group by department_id );
                                 
  
                                
select * from departments d ;
select * from employees e ;

-- Find the department who don't have any employee.

select department_id from departments d ;

select department_id from employees e ;


select * from departments d 
where department_id not in (select distinct (department_id) from employees e );


-- OR Using Corelated Sub-query

select * from employees e ;

select 1 from employees e where department_id =90;

select * from departments d
where not exists (select 1 from employees e  
                  where e.department_id=d.department_id);



-- find the employee in each department who earn more than the average salary in that dept.
select * from employees e ;

                  
                  
select avg(salary) from  employees e 
where department_id=90;

select department_id ,avg(salary) from employees e 
group by department_id ;


select * from employees e1
where e1.salary > (select avg(salary) from employees e2 
                   where e1.department_id =e2.department_id);
                  
--OR                   
                  
select * from employees e1
where e1.salary > (select avg(salary) from employees e2 
                   group by e2.department_id
                   having e1.department_id=e2.department_id);  










