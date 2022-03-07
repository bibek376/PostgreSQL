--
--SQL Exercises, Practice, Solution - SUBQUERIES


-- 1. From the following tables, write a SQL query to find all the orders issued 
-- by the salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date, customer_id 
-- and salesman_id.

select * from salesman s ;
select * from orders o ;

select * from orders o 
where salesman_id =(select salesman_id from salesman s 
					where name='Paul Adam');
					
				
-- 2. From the following tables, write a SQL query to find all the orders, 
-- which are generated by those salespeople, who live in the city of London.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.				
	
select * from salesman s ;
select * from orders o ;			


select * from orders o 
where salesman_id =(select salesman_id from salesman s
					where city='London');

				
-- 3. From the following tables, write a SQL query to find the orders 
-- generated by the salespeople who may work for customers whose id is 3007.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id. 

select * from orders o 
where salesman_id =(select distinct salesman_id from orders o
					where customer_id=3007)



-- 4. From the following tables, write a SQL query to find the order values
-- greater than the average order value of 10th October 2012. Return ord_no,
-- purch_amt, ord_date, customer_id, salesman_id

select * from salesman s ;
select * from orders o ;						
					
select * from orders o 
where purch_amt >(select avg(purch_amt) from orders 
				  where ord_date='2012-10-10');
					
					
-- 5. From the following tables, write a SQL query to find all the orders generated in New York city.
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 					
select * from orders o 
where salesman_id in (select salesman_id from salesman s
					  where city='New York');
					
					
					
-- 6. From the following tables, write a SQL query to find the commission of 
-- the salespeople work in Paris City. Return commission.					
					 
select * from salesman s ;
select * from customer c ;
					 
select commission from salesman s 
where salesman_id in (select salesman_id from customer c
				   where city='Paris');
					 
					 
-- 7. Write a query to display all the customers whose id is 2001
-- bellow the salesman ID of Mc Lyon.					 
					 
select * from salesman s ;
select * from customer c ;

select * from customer c 
where customer_id =(select salesman_id-2001 from salesman s
					where name='Mc Lyon');


-- 8. From the following tables, write a sql
-- query to count number of customers with grades above the 
-- average grades of New York City. Return grade and count. 
select grade,count(*) from customer c 
where grade > (select avg(coalesce(grade,0))from customer c 
				group by city
				having city='New York')
group by grade
order by grade;
				
-- OR
SELECT grade, COUNT (*)
FROM customer
GROUP BY grade
HAVING grade >
    (SELECT AVG(grade)
     FROM customer
     WHERE city = 'New York') order by grade;
				
			 
-- 9. From the following tables, write a SQL query to find those salespeople
-- who earned the maximum commission. Return ord_no, purch_amt, ord_date,
-- and salesman_id. 					 
select * from customer c ;
select * from orders o ;
select * from salesman s ;
					
select o.ord_no,o.purch_amt,o.ord_date,o.salesman_id 
from orders o 
where salesman_id in (select salesman_id from salesman s 
					  where commission =
					 (select max(commission) from salesman s2));
					  
					  
-- 10. From the following tables, write a SQL query to find the customers whose orders issued
-- on 17th August, 2012. Return ord_no, purch_amt, ord_date, customer_id, 
-- salesman_id and cust_name.					  
select * from customer c ;
select * from orders o ;
					
					
select o.ord_no,o.purch_amt,o.ord_date,o.customer_id,o.salesman_id,c.cust_name
from orders o 
inner join customer c 
on c.salesman_id =o.salesman_id and c.customer_id =o.customer_id 
where o.ord_date='2012-08-17';

--Since salesman_id is foreign in both table so no need to write 

select o.ord_no,o.purch_amt,o.ord_date,o.customer_id,o.salesman_id,c.cust_name
from orders o 
inner join customer c 
on  c.customer_id =o.customer_id 
where o.ord_date='2012-08-17';


-- OR

SELECT b.*, a.cust_name
FROM orders b, customer a
WHERE a.customer_id=b.customer_id
AND b.ord_date='2012-08-17';					
					
-- 11. From the following tables, write a SQL query to find the salespeople who had more
-- than one customer. Return salesman_id and name.					
select * from customer c ;
select * from salesman s ;


select salesman_id,name from salesman s 
where 1<(select count(*) from customer c 
		where salesman_id=s.salesman_id);

					
select count(*) from customer c 
where salesman_id =5001;
					
-- 12. From the following tables, write a SQL query to find those orders,
-- which are higher than average amount of the orders. 
-- Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 					
					
select * from orders o ;
select * from customer c ;

select * from orders o 
where purch_amt > (select avg(purch_amt) from orders
					where o.customer_id =customer_id 
				  );
-- 13. From the following tables, write a SQL query to find those orders,
-- which are equal or higher than average amount of the orders. return
-- ord_no, purch_amt, ord_date, customer_id and salesman_id.  				 
select * from orders o ;
select * from customer c ;

select * from orders o 
where purch_amt >= (select avg(purch_amt) from orders
					where o.customer_id =customer_id 
				  );				 
				 
				 
-- 14. Write a query to find the sums of the amounts from the orders table, grouped by date,
-- eliminating all those dates where the sum was not at least 1000.00 above 
-- the maximum order amount for that date.

--Corelated Subquery				 
select ord_date,sum(purch_amt),count(*) from orders o 
group by ord_date 
having sum(purch_amt)>(select 1000+max(purch_amt) from orders
					  where o.ord_date=ord_date);

				 
SELECT 1000.00 + MAX(purch_amt) 
     FROM orders b 
     WHERE   b.ord_date='2012-04-25';				 
				 
				 
-- 15. Write a query to extract all data from the customer table if and only if one or more of 
-- the customers in the customer table are located in London.  				 
  select * from customer c 
  where 1<=(select count(*) from customer
  			where city='London'); 
 
--OR 				 
				 
 select * from customer c 
  where exists (select count(*) from customer
  			where city='London');				 
				 
-- 16. From the following tables, write a SQL query to find
-- the salespeople who deal multiple customers. Return salesman_id, name, city and commission.				 
select * from customer c ;
select * from salesman s ;


select * from salesman s 
where salesman_id in (select salesman_id from customer c  		
 					  group by salesman_id having count(*) >1);


 -- 17. From the following tables, write a SQL query to find the salespeople 
-- who deal a single customer. Return salesman_id, name, city and commission. 		
  		
select * from customer c ;
select * from salesman s ; 		
 
select * from salesman s 
where salesman_id in (select salesman_id from customer c  		
 					  group by salesman_id having count(*) =1);
  		
  		
 -- 18. From the following tables, write a SQL query to find the 
-- salespeople who deal the customers with more than one order. 
 -- Return salesman_id, name, city and commission.  		
select * from customer c ;
select * from salesman s ; 	
select * from orders o ;
  		
 select * from salesman s 
 where salesman_id in (select salesman_id from customer c 
 						where customer_id in 
 						( select customer_id from orders o 
 						group by customer_id 
 						having count(*)>1));
 
 
-- 19. From the following tables, write a SQL query to find the salespeople who
-- deals those customers who live in the same city. Return salesman_id, name,
-- city and commission. 
select * from customer c ;
select * from salesman s ; 
 

 select * from salesman s 
 where city in (select city from customer c
 			where s.salesman_id =c.salesman_id );

-- 20. From the following tables, write a SQL query to find the salespeople
-- whose place of living (city) matches with any of the city where customers
-- live. Return salesman_id, name, city and commission.		
 select * from salesman s 
 where city in (select distinct(city) from customer c);
  	
-- 21. From the following tables, write a SQL query to find all those salespeople 
-- whose name exist alphabetically after the customer’s name. Return salesman_id,
-- name, city, commission. 		
select * from customer c ;
select * from salesman s ; 

SELECT *
FROM salesman a
WHERE EXISTS
   (SELECT *
	FROM CUSTOMER b
	WHERE  a.name  < b.cust_name);


select 'c'< 'i'; ----True

-- 22. From the following table, write a SQL query to find all those customers 
-- who have a greater grade than any customer who belongs to the alphabetically 
-- lower than the city of New York. Return customer_id, cust_name, city, grade, salesman_id 		

select * from customer c 
where grade > any (select grade from customer 
					where city <'New York');
 		
 		
-- 23. From the following table, write a SQL query to find all those orders
-- whose order amount greater than at least one of the orders of September 
-- 10th 2012. Return ord_no, purch_amt, ord_date, customer_id and salesman_id
 select * from orders o 
 where purch_amt > (select min(purch_amt) from orders o 
				    where ord_date ='2012-09-10');
					
select min(purch_amt) from orders o 
where ord_date ='2012-09-10';
 	
select  substring('2012-08-3'::varchar,6,2);		

--OR 
SELECT *
FROM Orders
WHERE purch_amt > ANY
   (SELECT purch_amt
	FROM orders
	WHERE  ord_date='2012/09/10');

 -- 24. From the following tables, write a SQL query to find those orders where an
 -- order amount less than any order amount of a customer lives in London City.
 -- Return ord_no, purch_amt, ord_date, customer_id and salesman_id. 		
 
select * from orders o ;
select * from customer c ;

select * from orders o 
where purch_amt < (select max(purch_amt)
				   from orders o 
				   where customer_id in 
				   (select customer_id from orders o 
					where customer_id in 
					(select customer_id from customer c 
                      where city ='London')));

-- OR
                     
SELECT *
FROM orders
WHERE purch_amt < 
   (SELECT MAX (purch_amt)
	FROM orders a, customer b
	WHERE  a.customer_id=b.customer_id
	AND b.city='London');


 	
-- 26. From the following tables, write a SQL query to find those customers
-- whose grade are higher than customers living in New York City. Return 
-- customer_id, cust_name, city, grade and salesman_id.

select * from customer c
where grade > all (select grade from customer c
				where city='New York');

-- 27. From the following tables, write a SQL query to calculate the total order 
-- amount generated by a salesman. The salesman should belong to the cities
-- where any of the customer living. Return salesman name, city and total order amount.

select * from orders o ;
select * from customer c ;
select * from salesman s ;


select s.name,s.city,sq_1.total_amt 
from salesman s ,(select salesman_id,sum(purch_amt) total_amt 
				  from orders o 
				  group by salesman_id) sq_1
where sq_1.salesman_id=s.salesman_id 
and s.city in (select distinct city from customer c);


-- 28. From the following tables, write a SQL query to find those customers
-- whose grade doesn't same of those customers live in London City.
 -- Return customer_id, cust_name, city, grade and salesman_id.

select * from customer c 
where grade != any (select grade from customer c2
				where city='London');


-- 29. From the following tables, write a SQL query to find those customers
-- whose grade are not same of those customers living in Paris. Return customer_id, 
-- cust_name, city, grade and salesman_id.


select * from customer c 
where grade != any (select distinct grade from customer c2
				where city='Paris')

--OR
SELECT *
FROM customer 
WHERE grade NOT IN
   (SELECT grade
	FROM customer
	WHERE city='Paris');

-- 30. From the following tables, write a SQL query to find all those customers
-- who have different grade than any customer lives in Dallas City. Return customer_id,
-- cust_name,city, grade and salesman_id

select * from customer c ;

select * from customer c 
where grade != all (select distinct grade from customer c2
					where city='Dallas');

-- OR
SELECT *
FROM customer 
WHERE NOT grade = ANY
   (SELECT grade
	FROM customer
	WHERE city='Dallas');
 
-- 31. From the following tables, write a SQL query to find the average price
-- of each manufacturer's product along with their name. Return Average
 -- Price and Company.				
select * from company_mast cm ;
select * from item_mast im ;

select c.com_name,avg(i.pro_price) from item_mast i
inner join company_mast c
on c.com_id=i.pro_com 
group by c.com_name ;

--OR

select c.com_name,avg(i.pro_price) from company_mast c
inner join item_mast i
on c.com_id=i.pro_com 
group by c.com_name ;

--OR 
SELECT AVG(pro_price) AS "Average Price", 
   company_mast.com_name As "Company"
   FROM item_mast, company_mast
        WHERE item_mast.pro_com= company_mast.com_id
           GROUP BY company_mast.com_name;


 -- 32. From the following tables, write a SQL query to calculate the average 
 -- price of the products and find price which are more than or equal to 350.
 -- Return Average Price and Company.         
          
select * from company_mast cm ;
select * from item_mast im ;          
          
 
select c.com_name,avg(i.pro_price) from item_mast i
inner join company_mast c
on c.com_id=i.pro_com 
group by c.com_name
having avg(i.pro_price)>=350;
          
-- 33. From the following tables, write a SQL query to find the most expensive product
-- of each company. Return Product Name, Price and Company.          
          
select cm.com_name ,im.pro_name ,im.pro_price 
from company_mast cm 
inner join item_mast im 
on im.pro_com =cm.com_id 
where im.pro_price =(select max(pro_price) from item_mast
					where item_mast.pro_com=cm.com_id);
          
          
 -- 34. From the following tables, write a SQL query to find those employees whose 
 -- last name is 'Gabriel' or 'Dosio'. Return emp_idno, emp_fname, emp_lname and emp_dept.         
  select * from emp_details ed ;       
  
 select * from emp_details ed 
 where emp_lname = any (select emp_lname from emp_details ed2
 						where emp_lname='Gabriel' or emp_lname='Dosio');
 
--OR 
 					
select * from emp_details ed 
where emp_lname in ('Gabriel','Dosio');
          
 -- 35. From the following tables, write a SQL query to find the
 -- employees who work in department 89 or 63. Return emp_idno, emp_fname,
 -- emp_lname and emp_dept.         
          
select * from emp_details ed1 ;
select * from emp_department ed2 ;
select * from emp_details ed 
where ed.emp_dept in (89,63);

-- 36. From the following tables, write a SQL query to find those employees
-- who work for the department where the department allotment amount is more 
-- than Rs. 50000. Return emp_fname and emp_lname.
select * from emp_details ed1 ;
select * from emp_department ed2 ;		
  		
select ed1.emp_fname,ed1.emp_lname from emp_details ed1
where ed1.emp_dept in (select dpt_code from emp_department 
						where dpt_allotment >50000);


 --OR 
  		
select ed1.emp_fname,ed1.emp_lname from emp_details ed1
where ed1.emp_dept = any (select dpt_code from emp_department 
						where dpt_allotment >50000);


-- 37. From the following tables, write a SQL query to find the departments 
-- where the sanction amount is higher than the average sanction amount of all 
-- the departments. Return dpt_code, dpt_name and dpt_allotment.
select * from emp_department ed ;

select * from emp_department ed 
where dpt_allotment > (select avg(dpt_allotment) from emp_department );


-- 38. From the following tables, write a SQL query to find the departments 
-- where more than two employees work. Return dpt_name.
select * from emp_details ed1 ;
select * from emp_department ed2 ;		
  		

select dpt_name from emp_department ed 
where ed.dpt_code=any(select emp_dept 
				  from emp_details ed 
				  group by emp_dept 
				  having count(*)>2);

--OR
select ed.dpt_name from emp_department ed 
inner join emp_details ed2 
on ed2.emp_dept =ed.dpt_code 
group by dpt_name 
having count(*) >2;


-- 39. From the following tables, write a SQL query to find the departments 
-- where the sanction amount is second lowest. Return emp_fname and emp_lname.

select * from emp_details ed1 ;
select * from emp_department ed2 ;

select emp_fname,emp_lname from emp_details ed 
where emp_dept = any (select dpt_code 
					 from emp_department ed 
					 where dpt_allotment =
					 (select dpt_allotment from emp_department ed 
                      order by dpt_allotment asc offset 1 limit 1));



-- OR
                     
 SELECT emp_fname, emp_lname 
FROM emp_details 
WHERE emp_dept IN (
  SELECT dpt_code
  FROM emp_department 
  WHERE dpt_allotment= (
    SELECT MIN(dpt_allotment)
    FROM emp_department 
    WHERE dpt_allotment >
 (SELECT MIN(dpt_allotment) 
      FROM emp_department )));
                    
