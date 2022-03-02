--SQL Exercises, Practice, Solution - Query on Multiple Tables


-- 1. From the following tables, write a SQL query to find the salespersons 
-- and customers who live in same city. Return customer name, salesperson name
-- and salesperson city.

select * from salesman s ;
select * from customer c ;

select c.cust_name,s.name,s.city from salesman s ,customer c
where s.city=c.city;


-- 2. From the following tables, write a SQL query to find all the 
-- customers along with the salesperson who works for them. Return customer name,
-- and salesperson name. 

select c.cust_name,s.name from customer c ,salesman s 
where c.salesman_id =s.salesman_id ;



-- 3. From the following tables, write a SQL query to find
-- those sales people who generated orders for their customers but 
-- not located in the same city.
-- Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table).

select * from orders o ;
select * from customer c ;
select * from salesman s ;

select o.ord_no,c.cust_name,o.customer_id,o.salesman_id 
from orders o ,customer c,salesman s 
where  o.salesman_id=s.salesman_id 
and c.city !=s.city
and o.customer_id =c.customer_id ;


SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city
AND orders.customer_id = customer.customer_id
AND orders.salesman_id = salesman.salesman_id;


-- 4. From the following tables, write a SQL query to 
-- find those orders made by customers. Return order number, customer name.

select * from orders o ;
select * from customer c ;

select o.ord_no,c.cust_name from orders o ,customer c 
where o.customer_id = c.customer_id ;



select o.ord_no,c.cust_name from orders o ,customer c 
where o.customer_id in (select customer_id from customer );




-- 5. From the following tables, write a SQL query to find those customers
-- where each customer has a grade and served by at least a salesperson who belongs
-- to a city. Return cust_name as "Customer", grade as "Grade". 



select * from orders o ;
select * from customer c ;
select * from salesman s ;



-- 6. From the following table, write a SQL query to find those customers 
-- who served by a salesperson and the salesperson works at the commission in the 
-- range 12% to 14% (Begin and end values are included.). Return cust_name 
-- AS "Customer", city AS "City".


select * from customer c ;
select * from salesman s ;

select cust_name "Customer",city "City" from customer c 
where salesman_id in (select salesman_id from salesman 
					  where commission between 0.12 and 0.14);



-- 7. From the following tables, write a SQL query to find those orders executed
-- by the salesperson, ordered by the customer whose grade is greater than or equal 
-- to 200. Compute purch_amt*commission as "Commission". Return customer name, 
-- commission as "Commission%" and Commission. 

					 
select * from orders o ;
select * from customer c ;
select * from salesman s ;

select c.cust_name,s.commission "Commission %",(o.purch_amt*s.commission) "Commission"
from orders o ,customer c ,salesman s 
where c.grade >=200
and o.salesman_id =s.salesman_id
and o.customer_id =c.customer_id ;

-- 8.From the following table, write a SQL query to find those customers 
-- who made orders on October 5, 2012. Return customer_id, cust_name, city, grade, 
-- salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id. 
				 
select * from orders o ;
select * from customer c ;
select * from salesman s ;

select * from orders o ,customer c 
where o.ord_date='2012-10-05'
and o.customer_id = c.customer_id ;










































