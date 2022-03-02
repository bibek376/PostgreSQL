--SQL Exercises with Solution - VIEW


--
--1. From the following table, create a view for
--those salespersons belong to the city 'New York'. 

select * from salesman s ;

create view newyork
as
(select * from salesman
where city='New York');

select * from newyork;
--
--2. From the following table, create a view for all salespersons. 
--Return salesperson ID, name, and city.  

create view view_1
as
(select s.salesman_id ,s.name,s.city from salesman s);

select * from view_1;

--3. From the following table, create a view to find the salespersons of the city 'New York'.
create view newyork
as
(select * from salesman
where city='New York');

--4. From the following table, create a view to count the number of customers in each grade.  
select * from customer c ;

create view grade_count(grade,numbers)--> grade,numbers -->column name
as
(select grade ,count(*) from customer c 
group by grade);

select * from grade_count;

--
--5. From the following table, create a view to count the number of unique customer,
--compute average and total purchase amount of customer orders by each date.
select * from orders o ;

create view view_2
as
(select o.ord_date,count(*),avg(purch_amt),sum(purch_amt) 
from orders o
group by 1);

select * from view_2;

-- 6. From the following tables, create a view to get the salesperson and 
-- customer by name. Return order name, purchase amount, salesperson ID, name, 
-- customer name.
select * from salesman s ;
select * from customer c ;
select * from orders o ;


create view view_3
as
(select o.ord_no,o.purch_amt,s.salesman_id,s.name,c.cust_name
from orders o 
inner join customer c 
on c.customer_id =o.customer_id 
inner join salesman s 
on s.salesman_id =c.salesman_id);


--
--7. From the following tables, create a view to find the
--salesperson who handles a customer who makes the highest order of
--a day. Return order date, salesperson ID, name.

select * from salesman s ;
select * from orders o ;

create view view_4
as 
(select o.ord_date,s.salesman_id,s.name from orders o 
inner join salesman s 
on o.salesman_id =s.salesman_id
where (o.ord_date,o.purch_amt)=any(select o.ord_date,max(purch_amt)
								   from orders o
								   group by 1)); 

--OR
								  
SELECT b.ord_date, a.salesman_id, a.name
FROM salesman a, orders b
WHERE a.salesman_id = b.salesman_id
AND b.purch_amt =
    (SELECT MAX (purch_amt)
       FROM orders c
       WHERE c.ord_date = b.ord_date);

--
--8. From the following tables, create a view to find the salesperson 
--who handles the customer with the highest order, at least 3 times 
--on a day. Return salesperson ID and name.
select * from salesman s ;
select * from customer c ;    
      

select c.salesman_id,count(*) from customer c 
group by c.salesman_id 
having count(*)>=2;


SELECT COUNT (*)
    FROM customer c
    WHERE c.salesman_id =5001;


-- 9. From the following table, create a view to find all the customers who
-- have the highest grade. Return all the fields of customer.
   
 create view view_5
 as
(select * from customer c 
where grade=(select max(grade) from customer c));

select * from view_5;


--10. From the following table, create a view to count number of the salesperson in each city. Return city, number of salespersons.
select * from salesman s ;

create view  view_6
as
(select city,count(*) 
from salesman s
group by city);

select * from view_6;

--
--11. From the following table, create a view to compute average purchase
--amount and total purchase amount for each salesperson. Return name, average 
--purchase and total purchase amount. (Assume all names are unique).
select * from orders o ;
select * from salesman s ;
create view view_7
as
(select s.name,sq_1.avg,sq_1.sum 
from salesman s,(select o.salesman_id,avg(o.purch_amt),sum(o.purch_amt) 
				 from orders o 
				group by salesman_id) sq_1
where sq_1.salesman_id=s.salesman_id);

-- OR

SELECT name, AVG(purch_amt), SUM(purch_amt)
FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id
GROUP BY name;
--
--12. From the following tables, create a view to find those salespeople who
--handle more than one customer. Return all the fields of salesperson.


select * from salesman s ;
select * from customer c ;


--method 1
select s.name,count(*) from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id
group by s.name
having count(*)>1;


--method 2
select s.name,count(*) from salesman s ,customer c 
where s.salesman_id =c.salesman_id 
group by s.name
having count(*)>1;

--method 3

select s.name from salesman s 
where salesman_id =any (select salesman_id
		from customer c
		group by salesman_id
		having count(*)>1);

--method 4

select s.name from salesman s 
where salesman_id in (select salesman_id
		from customer c
		group by salesman_id
		having count(*)>1);

--method 5
	
select s.name from salesman s 
where 1<(select count(*) from customer c
		where c.salesman_id=s.salesman_id);
	

create view view_8
as
(select s.name from salesman s 
where 1<(select count(*) from customer c
		where c.salesman_id=s.salesman_id));
--
--13. From the following tables, create a view that shows all matches of 
--customers with salesperson such that at least one customer in the city of customer
--served by a salesperson in the city of the salesperson.

select * from salesman s ;
select * from customer c ;

create view view_9(Customer_City,Salesman_City)
as
(SELECT DISTINCT a.city, b.city
FROM customer a, salesman b
WHERE a.salesman_id = b.salesman_id);


select * from view_9;
--
--14. From the following table, create a view to get number of 
--orders in each day. Return order date and number of orders.

select * from orders o ;
create view view_10 (Order_date,Number_Of_Order)
as
(select o.ord_date,count(*) 
from orders o 
group by ord_date);

select * from view_10;

--
--15. From the following tables, create a view to find the salespersons
--who issued orders on October 10th, 2012. Return all the fields of salesperson.

select * from salesman s ;
select * from orders o ;

create view view_11
as
(select * from salesman s 
where s.salesman_id =any (select o.salesman_id 
						from orders o 
						where o.ord_date ='2012-10-10'));
select * from view_11;					

--
--16. From the following table, create a view to find the salespersons who 
--issued orders on either August 17th, 2012 or October 10th, 2012. Return 
--salesperson ID, order number and customer ID.

create view view_12
as
(select o.salesman_id ,o.ord_no ,o.customer_id from orders o 
where o.ord_date in ('2012-08-17','2012-10-10'));

select * from view_12;


select salesman_id, ord_no, customer_id
FROM orders
WHERE ord_date IN('2012-08-17', '2012-10-10');

