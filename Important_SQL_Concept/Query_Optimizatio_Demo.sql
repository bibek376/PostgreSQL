
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

---------------------------------------------------------------------------

select e.first_name , (select d.department_id from department d where
d.department_id=e.department_id
limit 1)from employee e ;

select tt.first_name , tt.department_id
from (select e.first_name , d.department_id , row_number() over (partition by
d.department_id ) as rn
from employee e join department d
on d.department_id=e.department_id ) tt
where tt.rn=1;

-------------------------------------------------------------------------
--IN versus EXISTS

explain select d.department_id ,d.department_name from department d
where d.department_id in (select p.department_id from project p);

explain select d.department_id ,d.department_name from department d
where exists (select p.department_id from project p
where d.department_id=p.department_id);

----------------------------------------------------------------
--Avoid operator

explain SELECT e.employee_id , d.department_name
FROM employee e join department d
on e.department_id =d.department_id
where salary >= 3000 and salary<= 5000 ;

explain SELECT e.employee_id , e.first_name
FROM employee e join department d
on e.department_id =d.department_id
WHERE salary BETWEEN 3000 and 5000;

--------------------------------------------------------------------
--Combine multiples scans with case statements

explain
select e.department_id ,
(select count(e.employee_id) from employee e where salary<1100),
(select count(e.employee_id) from employee e where salary between
1100 and 3000),
(select count(e.employee_id) from employee e where salary>3000)
from employee e
group by e.department_id ;



explain select e.department_id ,count( case when salary<1100 then 1 else null end ) count1,
count(case when salary between 1100 and 3000 then 1 else null end) count2,
count( case when salary>3000 then 1 else null end) count3
from employee e
group by e.department_id ;

--------------------------------------------------------------------------
--Making joins less complicated

explain
SELECT d.department_name,
count(employee_id) totalemp,
SUM(salary) AS salary ,
count(p.project_id) totalproject
from employee e join department d
on e.department_id =d.department_id
join project p on p.department_id =d.department_id
group by d.department_name;


explain
SELECT d.department_name ,a.totalemp,a.salary,p.totalproject
FROM department d
INNER JOIN (
SELECT department_id,
count(employee_id) totalemp,
SUM(salary) AS salary
FROM employee GROUP BY department_id
) a
ON d.department_id = a.department_id
join (select department_id,
count(p.project_id) totalproject
from project p
group by department_id ) p onp.department_id=d.department_id ;


---------------------------------------------------------------------
--Wrong Join Case gives wrong results

explain select d.department_name , count(e.employee_id), count(p.project_id)
from department d join employee e
on e.department_id = d.department_id
join project p on p.department_id =d.department_id
group by d.department_name;


select d.department_name , ee.ecount, pp.pcount
from department d
left join (select e.department_id,count(e.employee_id) ecount
from employee e
group by e.department_id ) ee on d.department_id =
ee.department_id
left join (select p2.department_id,count(p2.project_id) pcount
from project p2
group by p2.department_id ) pp
on pp.department_id=ee.department_id;













