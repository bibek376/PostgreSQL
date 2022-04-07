--
--180. Consecutive Numbers
--
--Table: Logs
--
--+-------------+---------+
--| Column Name | Type    |
--+-------------+---------+
--| id          | int     |
--| num         | varchar |
--+-------------+---------+
--id is the primary key for this table.
-- 
--
--Write an SQL query to find all numbers that appear at least three times consecutively.
--
--Return the result table in any order.
--
--The query result format is in the following example.
--
-- 
--
--Example 1:
--
--Input: 
--Logs table:
--+----+-----+
--| id | num |
--+----+-----+
--| 1  | 1   |
--| 2  | 1   |
--| 3  | 1   |
--| 4  | 2   |
--| 5  | 1   |
--| 6  | 2   |
--| 7  | 2   |
--+----+-----+
--Output: 
--+-----------------+
--| ConsecutiveNums |
--+-----------------+
--| 1               |
--+-----------------+
--Explanation: 1 is the only number that appears consecutively for at least three times.
--

drop table aaa;
create table aaa(id int,num int);
insert into aaa values(1,1),(2,1),(3,1),(4,1),(5,2),(6,2),(7,3);
insert into aaa values(8,3);
insert into aaa values(9,3);

select * from aaa;


explain with 
t1 as
	(select * from 
	(select a.*,
	lag(num) over(),
	lead(num) over()
	from aaa a)tt
	where tt.num=tt.lead or tt.num=tt.lag),
t2 as 
	(select t1.*,
	count(*) over (partition by t1.num)
	from t1)
select distinct t2.num "ConsecutiveNums" from t2
where t2.count>=3;


explain select distinct ttt.num from 
(select tt.*,
count(*) over (partition by num)"count" 
from 
(select * from 
(select a.*,
lag(num) over() "lag",
lead(num) over() "lead"
from aaa a)tt
where tt.num=lead or tt.num=lag)tt)ttt
where count>=3;







