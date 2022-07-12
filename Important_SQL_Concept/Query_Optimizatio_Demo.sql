
--Use Column Names Instead of * in a SELECT Statement

select * from employee e;

select first_name ,department_id from employee e ;

----------------------------------------------------------------------------

--Eliminate Unnecessary DISTINCT Conditions

explain SELECT DISTINCT e.department_id
FROM employee e;

explain SELECT e.department_id from employee e
group by e.department_id ;

----------------------------------------------------------------------------

--Use EXISTS instead of DISTINCT when using table joins that
--involves tables having one-to-many relationships

explain select distinct d.department_name
 from department d join employee e
 on d.department_id =e.department_id
 and salary>2000;

explain select d.department_name
 from department d
 where exists ( select 1 from employee e
 where e.department_id=d.department_id
 and salary>2000);


---------------------------------------------------------------------------


--. Try to use UNION ALL in place of UNION

explain SELECT p.project_id , p.project_name
from project p
UNION
SELECT e.employee_id , e.first_name
FROM employee e ;

explain SELECT p.project_id , p.project_name
from project p
UNION ALL
SELECT e.employee_id , e.first_name
FROM employee e ;


---------------------------------------------------------------------

--Consider using an IN predicate when querying an indexed column

explain select e.employee_id ,d.department_name
from employee e join department d
on e.department_id =d.department_id
where e.department_id =5 or e.department_id =3
or e.department_id =2;


explain select e.employee_id ,d.department_name
from employee e join department d
on e.department_id =d.department_id
where e.department_id in (5,3,2);

-------------------------------------------------------------------------

--Avoid using OR in join conditions

explain SELECT d.department_name,
count(employee_id) totalemp
from employee e join department d
on e.department_id =d.department_id
or e.first_name =d.department_name
group by d.department_name;

explain SELECT d.department_name,
count(employee_id) totalemp
from employee e join department d
on e.department_id =d.department_id
group by d.department_name;

----------------------------------------------------------------------
-- Wildcard vs Substr

--Full Wildcard
select * from employee e
where e.first_name like '%430201A%';
--Prefix Wildcard
select * from employee e
where e.first_name like '%430201A';


select e.first_name,e.last_name from employee e
where substring(e.first_name,1,6)= '430201';

------------------------------------------------------------------------------

--Create JOINs with INNER JOIN (not WHERE)

explain SELECT d.department_id , d.department_name ,
e.first_name, p.project_name
FROM employee e, department d , project p
WHERE e.department_id = d.department_id
and d.department_id =p.department_id ;


explain SELECT d.department_id , d.department_name ,
e.first_name,p.project_name
FROM employee e join department d
on e.department_id = d.department_id
join project p on d.department_id =p.department_id;

--------------------------------------------------------------------------
--Ignore linked subqueries

select e.first_name , (select d.department_id from department d where
d.department_id=e.department_id)
from employee e ;


select e.first_name , d.department_id
from employee e join department d
on d.department_id=e.department_id;















