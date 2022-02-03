--SQL Exercises, Practice, Solution - JOINS


-- 1. From the following tables write a SQL query to find the salesperson
-- and customer who belongs to same city. Return Salesman, cust_name and city.

select * from salesman s ;
select * from customer c ;

select s.name,c.cust_name,c.city from salesman s ,customer c 
where s.city=c.city;


-- 2. From the following tables write a SQL query to find those orders where 
-- order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

select * from orders o ;
select * from customer c ;

select o.ord_no,o.purch_amt,c.cust_name,c.city,o.customer_id,c.customer_id 
from orders o ,customer c 
where purch_amt between 500 and 2000
and o.customer_id =c.customer_id ;


-- 3. From the following tables write a SQL query to find the salesperson(s) and 
-- the customer(s) he handle. Return Customer Name, city, Salesman, commission. 


select * from salesman s ;
select * from customer c ;


select c.cust_name,c.city,s.name,s.commission,s.salesman_id,c.salesman_id 
from salesman s ,customer c 
where s.salesman_id =c.salesman_id ;

-- 4. From the following tables write a SQL query to find those salespersons who received 
-- a commission from the company more than 12%. Return Customer Name, customer city,
-- Salesman, commission.


select * from salesman s ;
select * from customer c ;


select c.cust_name,c.city,s.name,s.commission,s.salesman_id,c.salesman_id 
from customer c ,salesman s 
where s.commission >.12
and s.salesman_id =c.salesman_id ;


--Pure Sol

select c.cust_name,c.city,s.name,s.commission 
from customer c ,salesman s 
where s.commission >.12
and s.salesman_id =c.salesman_id ;

-- 5. From the following tables write a SQL query to find those salespersons
-- do not live in the same city where their customers live and received a commission 
-- from the company more than 12%. Return Customer Name, customer city, Salesman,
-- salesman city, commission.  

select * from salesman s ;
select * from customer c ;

select c.cust_name,c.city,s.name,s.city,s.commission,s.salesman_id ,c.salesman_id 
from customer c ,salesman s 
where s.commission >.12
and s.city !=c.city 
and s.salesman_id =c.salesman_id ;

-- 6. From the following tables write a SQL query to find the details of an order
-- . Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. 

select * from salesman s ;
select * from customer c ;
select * from orders o ;

select o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade,s.name,s.commission
from orders o ,salesman s ,customer c 
where c.customer_id =o.customer_id 
and s.salesman_id =c.salesman_id ;


-- 7. Write a SQL statement to make a join on the tables salesman, customer and 
-- orders in such a form that the same column of each table will appear once and 
-- only the relational rows will come.

select * from salesman s ;
select * from customer c ;
select * from orders o ;

--Natural Join
select * from salesman s 
natural join customer c 
natural join orders o ;

--Same Result

SELECT * 
FROM orders 
NATURAL JOIN customer  
NATURAL JOIN salesman;

-- 8. From the following tables write a SQL query to display the cust_name,
-- customer city, grade, Salesman, salesman city. The result should be ordered by
-- ascending on customer_id.
select * from salesman s ;
select * from customer c ;

select c.cust_name,c.city,c.grade,s.name,s.city from customer c 
inner join salesman s 
on s.salesman_id =c.salesman_id
order by c.customer_id ;

--OR With The Help Of Where Clause 

select c.cust_name,c.city,c.grade,s.name,s.city from customer c,salesman s 
where s.salesman_id =c.salesman_id
order by c.customer_id ;

-- 9. From the following tables write a SQL query to find those customers whose
-- grade less than 300. Return cust_name, customer city, grade, Salesman, saleman 
-- city. The result should be ordered by ascending customer_id. 
select * from salesman s ;
select * from customer c ;


select c.cust_name,c.city,c.grade,s.name,s.city,s.salesman_id ,c.salesman_id 
from salesman s 
inner join customer c 
on s.salesman_id =c.salesman_id
where c.grade <300;

--OR
select c.cust_name,c.city,c.grade,s.name,s.city,s.salesman_id ,c.salesman_id
from salesman s ,customer c 
where  s.salesman_id =c.salesman_id
and c.grade <300
order by c.customer_id ;


-- 10. Write a SQL statement to make a report with customer name, city, order number,
-- order date, and order amount in ascending order according to the order date to find 
-- that either any of the existing customers have placed no
-- order or placed one or more orders.
select * from orders o ;
select * from customer c ;

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,o.ord_date
from orders o 
inner join customer c 
on o.customer_id =c.customer_id and o.salesman_id =c.salesman_id
order by o.ord_date ;


-- 11. Write a SQL statement to make a report with customer name, city, order number, 
-- order date, order amount salesman name and commission to find that either any of
-- the existing customers have placed no order or placed one or more orders by their
-- salesman or by own .
select * from orders o ;
select * from customer c ;
select * from salesman s ;

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,s.name,s.commission
from orders o 
inner join customer c 
on o.customer_id =c.customer_id and o.salesman_id =c.salesman_id 
inner join salesman s 
on s.salesman_id =c.salesman_id;

-- 12. Write a SQL statement to make a list in ascending order for the salesmen who 
-- works either for one or more customer or not yet join under any of the customers.
select * from customer c ;
select * from salesman s ;

select c.cust_name ,s.salesman_id ,s.name,s.city,s.commission 
from salesman s 
inner join customer c 
on c.salesman_id =s.salesman_id 
order by 2;

-- 13. From the following tables write a SQL query to list all salespersons 
-- along with customer name, city, grade, order number, date, and amount. 
select * from orders o ;
select * from customer c ;
select * from salesman s ;

select s.name,c.cust_name,c.city,c.grade,o.ord_no,o.ord_date,o.purch_amt
from orders o 
inner join customer c 
on o.salesman_id =c.salesman_id and c.customer_id =o.customer_id 
inner join salesman s 
on s.salesman_id =c.salesman_id ;

-- 14. Write a SQL statement to make a list for the salesmen who either 
-- work for one or more customers or yet to join any of the customer. The 
-- customer may have placed, either one or more orders on or above order amount 
-- 2000 and must have a grade, or he may not have placed any 
-- order to the associated supplier.

select s.name,c.cust_name,c.city,c.grade,o.ord_no,o.ord_date,o.purch_amt
from orders o 
inner join customer c 
on o.salesman_id =c.salesman_id and c.customer_id =o.customer_id 
inner join salesman s 
on s.salesman_id =c.salesman_id
where o.purch_amt >=2000 and c.grade is not null;

-- 15. Write a SQL statement to make a report with customer name, city,
-- order no. order date, purchase amount for those customers from the existing
-- list who placed one or more orders or which order(s) have been placed
-- by the customer who is not on the list. 
select * from orders o ;
select * from customer c ;

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
from orders o 
inner join customer c 
on o.customer_id =c.customer_id and o.salesman_id =c.salesman_id;


-- 16. Write a SQL statement to make a report with customer name, city, 
-- order no. order date, purchase amount for only those customers on the 
-- list who must have a grade and placed one or more orders or which order(s) 
-- have been placed by the customer who is neither in the list nor have a grade. 

select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt,c.grade 
from orders o 
inner join customer c 
on o.customer_id =c.customer_id and o.salesman_id =c.salesman_id
where c.grade is not null;

-- 17. Write a SQL query to combine each row of salesman 
-- table with each row of customer table. 
select * from salesman s,customer c ;

--OR 

SELECT * 
FROM salesman a 
CROSS JOIN customer b;

-- 18. Write a SQL statement to make a cartesian product between 
-- salesman and customer i.e. each salesman will appear for all 
-- customer and vice versa for that salesman who belongs to a city.
select * from salesman s ,customer c
where c.grade is not null;

--OR

SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL;


-- 19. Write a SQL statement to make a cartesian product between salesman and 
-- customer i.e. each salesman will appear for all customer and vice versa for those 
-- salesmen who belongs to a city and the customers who must have a grade.
select * from salesman s ,customer c 
where s.city is not null and c.grade is not null;


-- 20. Write a SQL statement to make a cartesian product between salesman and customer
-- i.e. each salesman will appear for all customer and vice versa for those salesmen
-- who must belong a city which is not the same as his customer and the customers should
-- have an own grade. 
select * from 
salesman s ,customer c 
where s.city !=c.city 
and c.grade is not null;

-- OR

SELECT * 
FROM salesman a 
CROSS JOIN customer b 
WHERE a.city IS NOT NULL 
AND b.grade IS NOT NULL 
AND  a.city<>b.city;


-- 21. From the following tables write a SQL query to select all rows from
-- both participating tables as long as there is a match between pro_com and com_id.

select * from company_mast cm ;
select * from item_mast im ;

select * 
from company_mast cm 
inner join item_mast im 
on cm.com_id=im.pro_com ;

-- 22. Write a SQL query to display the item name, price,
-- and company name of all the products. 


select im.pro_name ,im.pro_price 
from company_mast cm 
inner join item_mast im 
on cm.com_id=im.pro_com ;


-- 23. From the following tables write a SQL query to calculate the average 
-- price of items of each company. Return average value and company name.


select cm.com_name,avg(im.pro_price) 
from company_mast cm 
inner join item_mast im 
on cm.com_id=im.pro_com 
group by cm.com_name;

-- 24. From the following tables write a SQL query to calculate and find the
-- average price of items of each company higher than or equal to Rs. 350.
-- Return average value and company name

select cm.com_name,avg(im.pro_price) 
from company_mast cm 
inner join item_mast im 
on cm.com_id=im.pro_com 
group by cm.com_name
having avg(im.pro_price)>=350; 


-- 25. From the following tables write a SQL query to find the most 
-- expensive product of each company. Return pro_name, pro_price and com_name.  



select cm.com_name, im.pro_name ,im.pro_price
from company_mast cm 
inner join item_mast im 
on cm.com_id=im.pro_com
and im.pro_price =(select max(pro_price) from item_mast
				  where item_mast.pro_com=cm.com_id);
				 
select * from company_mast cm ;
select * from item_mast im ;

--OR
select cm.com_name, im.pro_name,im.pro_price
from company_mast cm ,item_mast im 
where im.pro_com =cm.com_id 
and im.pro_price =(select max(pro_price) from item_mast
				   where item_mast.pro_com =cm.com_id 
					)

					
-- 26. From the following tables write a SQL query to display all the data of
-- employees including their department.
select * from emp_department;
select * from emp_details ed ;
					
					
select * from emp_department ed 
inner join emp_details ed2 
on ed.dpt_code =ed2.emp_dept ;

-- OR

SELECT emp_idno, A.emp_fname AS "First Name", emp_lname AS "Last Name",
    B.dpt_name AS "Department", emp_dept, dpt_code,  dpt_allotment
     FROM emp_details A 
      INNER JOIN emp_department B
        ON A.emp_dept = B.dpt_code;

-- 27. From the following tables write a SQL to display the first name
-- and last name of each employee, along with the name and sanction amount
-- for their department.

select a.emp_fname,a.emp_lname,b.dpt_name,b.dpt_allotment
from emp_details a 
inner join emp_department b 
on b.dpt_code =a.emp_dept ;

-- 28. From the following tables write a SQL query to find the departments with 
-- a budget more than Rs. 50000 and display the first name and last name of employees.


select a.emp_fname,a.emp_lname
from emp_details a 
inner join emp_department b 
on b.dpt_code =a.emp_dept 
where b.dpt_allotment >50000;

-- 29. From the following tables write a SQL query to find the names of 
-- departments where more than two employees are working. Return dpt_name. 


select distinct(b.dpt_name)
from emp_details a 
inner join emp_department b 
on b.dpt_code =a.emp_dept 
where b.dpt_code in (select emp_dept from emp_details
	                 group by emp_dept 
	                 having count(*)>2);

-- OR 
	                
SELECT emp_department.dpt_name
  FROM emp_details 
     INNER JOIN emp_department
       ON emp_dept =dpt_code
        GROUP BY emp_department.dpt_name
          HAVING COUNT(*) > 2;

