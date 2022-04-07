--
--
--177. Nth Highest Salary
--
--Table: Employee
--
--+-------------+------+
--| Column Name | Type |
--+-------------+------+
--| id          | int  |
--| salary      | int  |
--+-------------+------+
--id is the primary key column for this table.
--Each row of this table contains information about the salary of an employee.
-- 
--
--Write an SQL query to report the nth highest salary from the Employee table. If there is no nth highest salary, the query should report null.
--
--The query result format is in the following example.
--
-- 
--
--Example 1:
--
--Input: 
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--| 2  | 200    |
--| 3  | 300    |
--+----+--------+
--n = 2
--Output: 
--+------------------------+
--| getNthHighestSalary(2) |
--+------------------------+
--| 200                    |
--+------------------------+
--Example 2:
--
--Input: 
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--+----+--------+
--n = 2
--Output: 
--+------------------------+
--| getNthHighestSalary(2) |
--+------------------------+
--| null                   |
--+------------------------+


create table aaa(id int,salary int);
insert into aaa values(1,100),(2,200);

select * from aaa;

select * from 
(select a.*,
dense_rank() over (order by a.salary desc)"dn" 
from aaa a)tt
where dn=1;

create or replace function nth_highest_salary(nth_num int)
returns table(
			salary int
			)
as 
$$
declare 
dynamicQuery varchar;
begin 
	return query
	select tt.salary from 
	(select a.*,
	dense_rank() over (order by a.salary desc)"dn" 
	from aaa a)tt
	where dn=nth_num;
end
$$
language 'plpgsql'

select * from nth_highest_salary(1);

select * from nth_highest_salary(3);








