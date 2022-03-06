--SQL Challenges-1 [42 Challenges with solution]


--1. From the following tables, write a SQL query to find the information
--on each salesperson of ABC Company. Return name, city, country 
--and state of each salesperson.

select * from salespersons ;
select * from address ;

select s.first_name,s.last_name,a.city,a.country,a.state
from salespersons s 
left join address a 
on a.salesperson_id=s.salesperson_id
order by 2;

--2. From the following table, write a SQL query 
--to find the third highest sale. Return sale amount.
select tt.sale_amt from 
(select s.*,
dense_rank() over (order by sale_amt desc) "dn" 
from salemast s)tt
where tt.dn=3;

--3. From the following table, write a SQL query to find the Nth highest sale.
--Return sale amount.

--SQL Logic

select tt.sale_amt from 
(select s.*,
dense_rank() over (order by sale_amt desc) "dn"
from salemast s)tt
where tt.dn=3;

create or replace function Nth_Highest_Sale(nth_num int)
returns table (sales_amt int)
as
$$
declare
begin
	return query
	
	select tt.sale_amt from 
	(select s.*,
	dense_rank() over (order by sale_amt desc) "dn"
	from salemast s)tt
	where tt.dn=nth_num;
end;
$$
language 'plpgsql';


select * from Nth_Highest_Sale(3);


drop function Nth_Highest_Sale(nth_num int);


--4. From the following table, write a SQL query to find the marks, 
--which appear at least thrice one after another without interruption. 
--Return the number. 

select *
from logs a
inner join logs b 
on a.student_id=b.student_id +1
and a.marks=b.marks
inner join logs c
on a.student_id=c.student_id+2
and a.marks =c.marks ;




--5. From the following table, write a SQL query to find all the duplicate 
--emails (no upper case letters) of the employees. Return email id.

select e.email_id
from employeees e
group by 1
having count(*)>1;


--6. From the following tables, write a SQL query to find those customers
--who never ordered anything. Return customer name.
select * from customers;
select * from orders;

explain select c.customer_name 
from customers c
left join orders o 
on c.customer_id=o.customer_id
where o.order_id is null;

--OR

explain select c.customer_name from customers c
where c.customer_id =any (select c.customer_id
							from customers c
							except
							select o.customer_id
							from orders o);

--7. From the following table, write a SQL query to remove all 
--the duplicate emails of employees keeping the unique email with the 
--lowest employee id. Return employee id and unique emails.
delete from employeees
where employee_id in (select tt.employee_id from 						
		(select distinct e.*,
		dense_rank() over (partition by email_id order by employee_id ) "dn" 
		from employeees e)tt
		where tt.dn>1);

select * from employeees e ;

--8. From the following table, write a SQL query to find 
--all dates' city ID with higher pollution compared to its previous dates
-- (yesterday). Return city ID, date and pollution.
select tt.city_id,tt.date,tt.so2_amt
from 
(select s.*,
lag(s.so2_amt) over (order by date) "lag" 
from so2_pollution s)tt
where tt.lag<tt.so2_amt ;

--
--9. A salesperson is a person whose job is to sell products or services.
--From the following tables, write a SQL query to find the top 10 salesperson 
--that have made highest sale. Return their names and total sale amount.

select * from sales;
select * from salesman;

explain select s2.salesman_name,sum(s.sale_amount)
from sales s
inner join salesman s2
on s.salesman_id=s2.salesman_id
group by 1
order by 2 desc
limit 10;

--OR
explain select tt.salesman_name,tt.sum from 
(select s2.salesman_name,
sum(s.sale_amount) over (partition by s.salesman_id)
from sales s
inner join salesman s2
on s.salesman_id=s2.salesman_id) tt
group by 1,2
order by 2 desc
limit 10;

--10. An active customer is simply someone who has bought company's 
--product once before and has returned to make another purchase within 10 days.
--From the following table, write a SQL query to identify the 
--active customers. Show the list of customer IDs of active customers

select * 
from orders o,orders o2
where o.customer_id=o2.customer_id
and o.order_id != o2.order_id
and o.order_date - o2.order_date  BETWEEN 0 AND 3;


--11. From the following table, write a SQL query to convert negative numbers 
--to positive and vice verse. Return the number. 

select * from tablefortest ;

explain select t.pos_neg_val, case 
			when t.pos_neg_val >=0 then -1 * (t.pos_neg_val)
			when t.pos_neg_val < 0 then -1 * (t.pos_neg_val)
		end "conversion"
from tablefortest t;

--OR
explain select t.pos_neg_val,-1*(t.pos_neg_val) "conversion"
from tablefortest t;

--12. From the following table, write a SQL query to find the century 
--of a given date. Return the century.
select t.date_of_birth,
substring(extract(year from t.date_of_birth)::varchar,1,2)::int+1 "Century"
from tablefortest t;

--13. From the following table, write a SQL query to find the even
--or odd values. Return "Even" for even number and "Odd" for odd number
explain select t.col_val,'odd' "result"
from tablefortest t
where t.col_val % 2 !=0
union all
select t.col_val,'Even' 
from tablefortest t
where t.col_val % 2 =0;

--OR

explain select t.col_val,case 
					when t.col_val % 2=0 then 'Even'
					else 'odd'
				 end "result"
from tablefortest  t;


--14. From the following table, write a SQL query to find the unique marks.
--Return the unique marks.

explain select distinct marks_achieved
from student_test ;

--OR
explain select marks_achieved
from student_test 
group by 1;


--15. From the following table, write a SQL query to find those students 
--who have referred by the teacher whose id not equal to 602. Return the 
--student names.


explain select * from students
except
select * 
from students s 
where s.teacher_id =602;

--OR

explain SELECT student_name 
FROM students WHERE teacher_id <> 602 
OR teacher_id IS NULL;


--16. From the following table, write a SQL query to find the 
--salesperson that makes maximum number of sales amount.
--If there are, more than one saleperson with maximum number of 
--sales amount find all the salespersons. Return salesperson id.
select s.order_id,count(salesperson_id)
from salemast s 
group by 1
limit 1;

select * from salemast s ;


--17. A city is big if it has an area bigger than 50K square km or 
--a population of more than 15 million.
--From the following table, write a SQL query to find big cities
--name, population and area.
select * 
from cities_test c
where c.city_area > 50000
or c.city_population > 15000000;


--18. From the following table, write a SQL query to find those items, 
--which have ordered 5 or more times. Return item name and number of orders.
select o.item_desc,count(*)
from orders o 
group by 1
having count(*)>5;


--19. From the following tables, write a SQL query to find the overall rate
--of execution of orders, which is the number of orders execution divided 
--by the number of orders quote. Return rate_of_execution rounded
--to 2 decimals places.

select * from orders_issued;
select * from orders_executed;


select 
(select count(*) from (select distinct oe.orders_from,oe.executed_from
from orders_executed oe) tt /
select count(*) from (select distinct o.distributor_id,o.company_id
from orders_issued o) ttt);


--20. From the following table write an SQL query to display the records
--with four or more rows with consecutive match_no's, and the crowd 
--attended more than or equal to 50000 for each match. Return match_no,
-- match_date and audience. Order the result by visit_date, descending.

with
  tt as 
	(select m.*,
	row_number() over (),
	m.match_no - (row_number() over ()) "diff"  
	from match_crowd m
	where m.audience >= 50000),
 ttt as
 	(select tt.*,
 	count(*) over (partition by tt.diff)
 	from tt)
 
select ttt.match_no,ttt.match_date,ttt.audience
from ttt
where ttt.count=4
order by 1;




--21. From the following table write a SQL query to know the availability 
--of the doctor for consecutive 2 or more days. Return visiting days.
with 
	tt as
	(select d.*,
	row_number() over () "rn",
	right(d.visiting_date::varchar,2)::int - row_number() over () "diff"
	from dr_clinic d
	where d.availability=true),
	ttt as
	(select tt.*,
	count(*) over (partition by tt.diff)
	from tt)
select ttt.visiting_date from ttt
where ttt.count>=2;


--
--22. From the following tables find those customers who did not make 
--any order to the supplier 'DCX LTD'. Return customers name.

select * from orders o ;
select * from supplier ;
select * from customers c ;


select c.customer_name 
from customers c 
inner join orders o 
on c.customer_id=o.customer_id
inner join supplier s
on s.supplier_id=o.supplier_id
where s.supplier_name !='DCX LTD';

--23. Table students contain marks of mathematics for several students
--in a class. It may same marks for more than one student.
--From the following table write a SQL table to find the highest unique 
--marks a student achieved. Return the marks.
with 
tt as
	(select s.marks_achieved ,count(*)
	from students s 
	group by 1),
ttt as
	  (select min(count) from tt)
select tt.marks_achieved from tt
where tt.count=(select * from ttt);


--24. In a hostel, each room contains two beds. After every 6 months
--a student have to change their bed with his or her room-mate.
--From the following tables write a SQL query to find the new beds 
--of the students in the hostel. Return original_bed_id, student_name,
--bed_id and student_new.

select * 
from bed_info b; 

select count(*) from bed_info ;



--25. From the following table, write a SQL query to find the first login
--date for each customer. Return customer id, login date


SELECT b.customer_id,min(b.login_date) "Login Date"
FROM bank_trans b
group by 1;

select * from bank_trans ;


--26. From the following table, write a SQL query to find those salespersons 
--whose commission is less than ten thousand. Return salesperson name, commission.

select s.salesman_name,c.commision_amt
from salemast s 
inner join commision c
on s.salesman_id=c.salesman_id
where c.commision_amt < 10000;


--27. From the following table write a SQL query to find those distributors 
--who purchased all types of item from the company. Return distributors ids.

select * from orders o ;
select * from items ;

select distinct ttt.distributor_id from 
(select tt.*,
count(*) over (partition by tt.distributor_id)
from 
(select distinct o.distributor_id,o.item_ordered
from orders o
inner join items i 
on i.item_code=o.item_ordered)tt)ttt
where ttt.count=(select count(*) from items);



--28. From the following tables write a SQL query to find those 
--directors and actors who worked together at least three or more movies.
--Return the director and actor name.
select * from actor_test;
select * from director_test ;
select * from movie_test ;
select * from mov_direction_test ;



select distinct dt.dir_name,a.act_name
from mov_direction_test md
inner join movie_test mt 
on mt.mov_id=md.mov_id
inner join director_test dt
on dt.dir_id=md.dir_id
inner join actor_test a
on a.act_id=md.act_id
where (md.dir_id,md.act_id)=any(select md.dir_id,md.act_id
							from mov_direction_test md
							inner join movie_test mt 
							on mt.mov_id=md.mov_id
							inner join director_test dt
							on dt.dir_id=md.dir_id
							inner join actor_test a
							on a.act_id=md.act_id
							group by md.dir_id,md.act_id
							having count(*)>=3);


--29. From the following tables write a SQL query to find those students 
--who achieved 100 percent in various subjects in every year.
--Return examination ID, subject name, examination year, number of students.
select * from exam_test ;
select * from subject_test ;


--30. From the following tables write a SQL query to find those 
--students who achieved 100 percent marks in every subject for all the year.
--Return subject ID, subject name, students for all year.

--Questions Not Clear

--31. From the following tables write a SQL query that will generate a 
--report which shows the total number of students achieved 100 percent 
--for the first year of each examination of every subject.



--32. From the following tables write a SQL query to display those managers
--who have average experience for each scheme.

with
tt as
	(select m.manager_id,s.scheme_code,m.running_years,
	avg(m.running_years) over (partition by s.scheme_code)
	from managing_body m
	inner join scheme s 
	on m.manager_id=s.scheme_manager_id)
select distinct tt.scheme_code,tt.avg from tt
where tt.running_years>=tt.avg;


--33. From the following tables write a SQL query to find those schemes 
--which executed by minimum number of employees. Return scheme code.
select * from scheme;
select * from managing_body ;

with
tt as
	(select s.*,
	count(*) over (partition by scheme_code)
	from scheme s)
select tt.scheme_code from tt
where tt.count=(select min(count) from tt);


--34. From the following tables write a SQL query to find those experienced 
--manager who execute the schemes. Return scheme code and scheme manager ID.
select * from scheme;
select * from managing_body ;


with
tt as
	(select m.manager_id,s.scheme_code,m.running_years,
	max(m.running_years) over (partition by s.scheme_code)
	from managing_body m
	inner join scheme s 
	on m.manager_id=s.scheme_manager_id)
select distinct tt.scheme_code,tt.manager_id from tt
where tt.running_years>=tt.max;


--35. From the following tables write an SQL query to find the best 
--seller by total sales price. Return distributor ID , If there is a tie, 
--report them all.
select * from sales_info ;
select * from item;


explain with 
tt as
	(select s.distributor_id,sum(s.total_cost)
	from sales_info s
	group by 1)
select tt.distributor_id from tt
where tt.sum=(select max(tt.sum) from tt);

--OR 

explain SELECT distributor_id
FROM sales_info
GROUP BY distributor_id
HAVING SUM(total_cost) >= 
ALL(SELECT SUM(total_cost) FROM sales_info GROUP BY distributor_id);

--
--36. From the following table write a SQL query to find those retailers 
--who have bought 'key board' but not 'mouse'. Return retailer ID.

select * from sales_info ;
select * from item;


select s.retailer_id from sales_info s
inner join item i 
on i.item_code=s.item_code
where i.item_desc ='key board'
and i.item_desc !='mouse';


--37. From the following table write a SQL query to display those items
--that were only sold in the 2nd quarter of a year, i.e. April 1st to 
--June end for the year 2020. Return item code and item description.
explain select distinct s.item_code,i.item_desc
from sales_info s
inner join item i
on s.item_code=s.item_code
where s.date_of_sell between '2020-04-01' and '2020-06-30'
and (s.item_code,i.item_desc)=any(select i.item_code,i.item_desc from item i);



explain SELECT item_code, item_desc
FROM item
WHERE item_code IN (
SELECT item_code
FROM sales_info
WHERE date_of_sell BETWEEN '2020-04-01' AND '2020-06-30'
);


--38. From the following table write a SQL query to find the highest
--purchase with its corresponding item for each customer. 
--In case of a same quantity purchase find the item code which is smallest.
--The output must be sorted by increasing of customer_id. 
--Return customer ID,lowest item code and purchase quantity.
with 
tt as
	(select p.customer_id,p.item_code,max(p.purch_qty)
	from purchase p 
	group by 1,2
	order by 1),
ttt as 
	(select tt.*,
	max(tt.max) over (partition by tt.customer_id) "wmax"
	from tt)
select tt.*
from tt
where (tt.max,tt.customer_id)=any(select ttt.wmax,ttt.customer_id from ttt);


--39. From the following table write a SQL query to find all the writers 
--who rated at least one of their own topic. Sorted the result in ascending 
--order by writer id. Return writer ID.

select t.writer_id 
from topics t
where t.writer_id=t.rated_by;


--40. From the following table write a SQL query to find all the writers 
--who rated more than one topics on the same date, sorted in ascending 
--order by their id. Return writr ID.


--41. From the following table write a SQL query to make a report such that 
--there is a product id column and a sale quantity column for each quarter.
--Return product ID and sale quantity of each quarter.


select s.product_id,
sum(case when s.qtr_no='qtr1' then s.sale_qty else null end)"qtr1",
sum(case when s.qtr_no='qtr2' then s.sale_qty else null end)"qtr2",
sum(case when s.qtr_no='qtr3' then s.sale_qty else null end)"qtr3",
sum(case when s.qtr_no='qtr4' then s.sale_qty else null end)"qtr4"
from sale s 
group by 1
order by 1;


--42. From the following table write a SQL query to find for each month and 
--company, the number of orders issued and their total quantity, the number 
--of orders booked and their total order quantity. Return month, name of 
--the company, number of orders issued, number of booked orders, total order 
--quantity and total booked orders quantity.


select substring(o.stat_date::varchar,1,7),o.com_name,
count(case when o.ord_qty> 0 then 10 end) "no_of_orders",
count(case when o.ord_stat='Booked' then 0 else null end) "booked_orders",
sum(o.ord_qty) "total_order_qty",
sum(case when o.ord_stat='Booked' then ord_qty else 0 end) "no_of_booked_qty"
from order_stat o 
group by 1,2;


select * from order_stat o;



