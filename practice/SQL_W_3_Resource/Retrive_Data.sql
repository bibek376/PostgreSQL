--SQL Exercises, Practice, Solution - Retrieve data from tables
-- https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php


-- 1. Write a SQL statement to display all the information of all salesmen. 

select * from salesman s;

--2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 


select 'This is SQL Exercise, Practice and Solution' ;


-- 3. Write a query to display three numbers in three columns.

select 4,5,6;

--4. Write a query to display the sum of two numbers 10 and 15 from RDMS sever.

select 10+15;



--5. Write a query to display the result of an arithmetic expression.   



select 2*3+3 "Result";


--
--6 Write a SQL statement to display specific columns like name and 
--commission for all the salesmen.


select name,commission from salesman;

-- 7. Write a query to display the columns in a specific order like order date, salesman id,
-- order number and purchase amount from for all the orders.  


select ord_date,salesman_id ,ord_no,purch_amt from orders;

select * from orders o ;


-- 8 From the following table, write a SQL query to find 
-- the unique salespeople ID. Return salesman_id

select distinct(salesman_id) from orders o ;


--9. From the following table, write a SQL query to find the salespeople who lives 
--in the City of 'Paris'. Return salesperson's name, city. 

select * from salesman s ;

select name,city from salesman  where city='Paris';


-- 10. From the following table, write a SQL query to find those customers whose grade is 200.
-- Return customer_id, cust_name, city, grade, salesman_id.

select * from customer c ;

select * from customer where grade =200;


-- 11. From the following table, write a SQL query to find the orders, which are delivered 
-- by a salesperson 
-- of ID. 5001. Return ord_no, ord_date, purch_amt.

select * from orders o ;

select ord_no,ord_date,purch_amt from orders where salesman_id =5001;



-- 12. From the following table, write a SQL query to find the Nobel Prize winner(s)
-- in the year 1970. Return year, subject and winner.

select * from nobel_win nw ;

select year,subject,winner from nobel_win nw  where year=1970;



-- 13. From the following table, write a SQL query to find the Nobel 
-- Prize winner in 'Literature' in the year 1971. Return winner. 


select winner from nobel_win nw  where year=1970 and subject='Literature';



-- 14. From the following table, write a SQL query to find the Nobel Prize 
-- winner 'Dennis Gabor'. Return year, subject


select * from nobel_win nw ;


select year,subject from nobel_win nw where winner='Dennis Gabor';



-- 15. From the following table, write a SQL query to find the Nobel Prize winners 
-- in 'Physics' since the year 1950. Return winner

select winner from nobel_win nw where year>=1950 and subject='Physics';


-- 16. From the following table, write a SQL query to find the Nobel
-- Prize winners in 'Chemistry' between the years 1965 to 1975.
--Begin and end values are included. Return year, subject, winner, and country


select year,subject,winner,country from nobel_win nw 
where (year between 1965 and 1975) and subject='Chemistry';



-- 17. Write a SQL query to show all details of the Prime Ministerial winners after 1972 
-- of Menachem Begin and Yitzhak Rabin.

select * from nobel_win nw where year>=1972 and category ='Prime Minister';

--OR
SELECT * FROM nobel_win
 WHERE year >1972
  AND winner IN ('Menachem Begin',
                  'Yitzhak Rabin');


-- 18. From the following table, write a SQL query to find the details of the 
-- winners whose first name matches with 
-- the string 'Louis'. Return year, subject, winner, country, and category.


select * from nobel_win nw ;

select * from nobel_win nw where winner like 'Louis%';
                 
                 
--19. From the following table, write a SQL query to combine the winners in Physics, 1970 and
-- in Economics, 1971. Return year, subject, winner, country, and category.                  
                 
                 
select * from nobel_win nw
where (year=1970 and subject='Physics') or (year=1971 and subject='Economics');           
                 
-- OR

SELECT * FROM nobel_win  WHERE (subject ='Physics' AND year=1970)
UNION 
(SELECT * FROM nobel_win  WHERE (subject ='Economics' AND year=1971));

                 
-- 20. From the following table, write a SQL query to find the Nobel
-- Prize winners in 1970 excluding the
-- subjects Physiology and Economics. Return year, subject, winner, country, and category                 
                 
select * from nobel_win nw
where year=1970 and subject not in ('Physiology','Economics');               
                 
                 
-- 21. From the following table, write a SQL query to combine the winners
-- in 'Physiology' before 1971 and 
-- winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category                 
    

select * from nobel_win nw 
where year<1971 and subject='Physiology'
union 
select * from nobel_win nw2 
where year>=1974 and subject='Peace';


-- 22. From the following table, write a SQL query to find the details of the Nobel Prize
-- winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.                 
       
select * from  nobel_win nw where winner='Johannes Georg Bednorz';



-- 23. From the following table, write a SQL query to find the Nobel Prize 
-- winners for the subject not started with the letter 'P'. Return year, 
--subject, winner, country, and category. Order the result by year, descending. 

select * from nobel_win nw 
where subject not like 'P%' order by year desc;



-- 24. From the following table, write a SQL query to find the details
-- of 1970 Nobel Prize winners. Order the result by subject, ascending except
-- ‘Chemistry’ and ‘Economics’ which will come at the end of result set. Return year, 
-- subject, winner, country, and category.

(select * from nobel_win 
where year='1970' and subject not in ('Chemistry','Economics') 
order by subject) 
union 
(select * from nobel_win 
where year='1970' and subject in ('Chemistry','Economics'));

--OR 
select * from nobel_win nw  
where year=1970 order by 
case
	when  subject in ('Chemistry','Economics') then 1
	else 0
end ASC,
subject ;






-- 26. From the following table, write a SQL query to
-- calculate the average price for manufacturer code equal to 16. Return avg.  


select * from item_mast im ;

select avg(pro_price) from item_mast im where pro_com=16;


-- 27. From the following table, write a SQL 
-- query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.' 

select pro_name "Item Name",pro_price "Price in Rs" from item_mast im ;


-- 28. From the following table, write a SQL query to find the items whose
-- prices are higher than or equal to $250. Order the result by product price 
-- in descending, then product name in ascending. Return pro_name and pro_price.


select pro_name,pro_price from item_mast im 
where pro_price >=250  order by pro_price desc , pro_name ;



-- 29. From the following table, write a SQL query to calculate average 
-- price of the items of each company. Return average price and company code. 


select pro_com,avg(pro_price) from item_mast im 
group by pro_com ;


-- 30. From the following table, 
-- write a SQL query to find the cheapest item(s). Return pro_name and, pro_price. 


select pro_name,pro_price from item_mast 
where pro_price=(select min(pro_price) from item_mast );



-- 31. From the following table, write a SQL query to
-- find unique last name of all employees. Return emp_lname.  


select * from emp_details ed ;

select distinct(emp_lname) from emp_details; 


-- 32. From the following table, write a SQL query to find the details of employees whose
-- last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept

select * from emp_details where emp_lname ='Snares';



-- 33. From the following table, write a SQL query to find the details of the employees 
-- who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept. 

select * from emp_details where emp_dept =57;

































                 








