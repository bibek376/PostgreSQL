--SQL Exercises, Practice, Solution - UNION


-- 1. From the following tables, write a SQL query to 
-- find all salespersons and customer who located in 'London' city. 

select * from salesman s ;
select * from customer c ;

select s.salesman_id "ID",s.name,'Salesman'
from salesman s where s.city='London' 
union 
select c.customer_id,c.cust_name,'Customer'
from customer c where c.city ='London';

-- 2. From the following tables, write a SQL query to find 
-- distinct salesperson and their cities.
-- Return salesperson ID and city.

select salesman_id, city from salesman s 
group by salesman_id ,city;

-- 3. From the following tables, write a SQL query to find all those 
-- salespersons and customers who involved in inventory management system.
-- Return salesperson ID, customer ID

select * from orders o ;
select * from customer c ;

SELECT salesman_id, customer_id
FROM customer
UNION 
(SELECT salesman_id, customer_id
FROM orders);



-- 4. From the following table, write a SQL query to find those salespersons
-- generated the largest and smallest orders on each date. Return salesperson ID,
-- name, order no., highest on/ lowest on, order date.
select * from orders o ;
select * from salesman s ;


select s.salesman_id,s.name,o.ord_no,'Highest on',o.ord_date 
from orders o 
inner join salesman s 
on s.salesman_id =o.salesman_id 
where (o.ord_date ,o.purch_amt )= any (select ord_date,max(purch_amt) 
								  from orders o 
								  group by ord_date)
union
(select s.salesman_id,s.name,o.ord_no,'Lowest on',o.ord_date 
from orders o 
inner join salesman s 
on s.salesman_id =o.salesman_id 
where (o.ord_date ,o.purch_amt )= any (select ord_date,min(purch_amt) 
								  from orders o 
								  group by ord_date)); 


--OR 
SELECT a.salesman_id, name, ord_no, 'highest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MAX (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date)
UNION
(SELECT a.salesman_id, name, ord_no, 'lowest on', ord_date
FROM salesman a, orders b
WHERE a.salesman_id =b.salesman_id
AND b.purch_amt=
	(SELECT MIN (purch_amt)
	FROM orders c
	WHERE c.ord_date = b.ord_date));
								 
								 
-- 5. From the following tables, write a SQL query to find those salespersons who 
-- generated the largest and smallest orders on each date. Sort the result-set on
-- 3rd field. Return salesperson ID, name, order no., highest on/lowest on, order date.


select s.salesman_id,s.name,o.ord_no,'Highest on',o.ord_date 
from orders o 
inner join salesman s 
on s.salesman_id =o.salesman_id 
where (o.ord_date ,o.purch_amt )= any (select ord_date,max(purch_amt) 
								  from orders o 
								  group by ord_date)
union
(select s.salesman_id,s.name,o.ord_no,'Lowest on',o.ord_date 
from orders o 
inner join salesman s 
on s.salesman_id =o.salesman_id 
where (o.ord_date ,o.purch_amt )= any (select ord_date,min(purch_amt) 
								  from orders o 
								  group by ord_date))
order by 3; 

-- 6. From the following table, write a SQL query to find those salespersons
-- who have same cities where customer lives as well as do not have customers in 
-- their cities and indicate it by ‘NO MATCH’. Sort the result set on 2nd 
-- column (i.e. name) in descending order. Return salesperson ID, name, customer name, 
-- commission.

select * from salesman s ;
select * from customer c ;


select s.salesman_id ,s.name,c.cust_name ,s.commission from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id 
where s.city =c.city 
union 
(select s.salesman_id ,s.name,'No Match' ,s.commission  from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id 
where s.city != c.city) 
order by 2;

--OR 

SELECT s.salesman_id,s.name, s.city as CITY, c.cust_name as CUSTOMER
FROM salesman s, customer c
WHERE s.salesman_id=c.salesman_id
AND s.city=c.city AND
c.customer_id is NOT NULL
UNION
(SELECT s.salesman_id,s.name, s.city as CITY, 'No Match' as Customer
FROM salesman s, customer c
WHERE s.salesman_id=c.salesman_id
AND s.city<>c.city)
ORDER BY salesman_id;

--7. From the following tables, write a SQL query that appends strings to
--the selected fields, indicating whether a specified city of any salesperson was
--matched to the city of any customer. return
--salesperson ID, name, city, MATCHED/NO MATCH. 
select * from salesman s ;
select * from customer c ;


select s.salesman_id,s.name,s.city,'Matched' from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id 
where s.city=c.city
union
(select s.salesman_id,s.name,s.city,'No Match' from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id 
where s.city != c.city)
order by 2 desc;

--OR 

select s.salesman_id ,s.name ,s.city ,c.city,case 
											 when s.city=c.city then 'Matched'
											 else 'No Match'
											 end "Status"
from customer c ,salesman s 
where c.salesman_id =s.salesman_id ;


--8. From the following table, write a SQL query to create a union of 
--two queries that shows the customer id, cities, and ratings of all customers. 
--Those with a rating of 300 or greater will have the words 'High Rating', while 
--the others will have the words 'Low Rating'.
select * from customer c ;

select c.customer_id,c.city ,case 
							 	when coalesce(c.grade,0) >=300 then 'High Rating'
							 	else 'Low Rating'
							 end "Status"
from customer c ;



--OR

select c.customer_id,c.city,'High Rating' from customer c 
where coalesce(c.grade,0)>=300
union 
(select c.customer_id ,c.city ,'Low Rating' 
from customer c 
where coalesce(c.grade,0)<300);



















