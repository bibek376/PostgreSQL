--SQL Exercises, Practice, Solution - Wildcard and Special operators



-- 1. From the following table, write a SQL query to find the details of those 
-- salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, 
-- name, city, commission.

select * from salesman s ;

select * from salesman s 
where city in('Paris','Rome');


-- 2. From the following table, write a SQL query to find the details of those 
-- salespeople who come from any of the City 'Paris' or 'Rome'. Return salesman_id,
-- name, city, commission. 
select * from salesman s 
where city in('Paris','Rome');


-- 3. From the following table, write a SQL query to find the details of those 
-- salespeople who live in cities apart from 'Paris' and 'Rome'. return
-- salesman_id, name, city, commission.


select * from salesman s 
where city not in('Paris','Rome');

-- 4. From the following table, write a SQL query to find the details of the 
-- customers whose ID belongs to any of the values 3007, 3008 and 3009.
-- Return customer_id, cust_name, city, grade, and salesman_id.  
select * from customer c ;

select * from customer c 
where customer_id in (3007,3008,3009);


-- 5. From the following table, write a SQL query to find the details 
-- of salespeople who get the commission in the range from 0.12 to 0.14 
-- (begin and end values are included).
-- Return salesman_id, name, city, and commission. 


select * from salesman s ;

select * from salesman s 
where commission between 0.12 and 0.14;

--OR
select * from salesman s 
where commission>=0.12 and commission<=0.14;


-- 6. From the following table, write a SQL query to select orders 
-- value within a range 500, 4000 (begin and end values are included). 
-- Exclude orders amount 948.50 and 1983.43.
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

select * from orders o ;

select * from orders o 
where (purch_amt between 500 and 4000) 
and purch_amt not in(948.50,1983.43);


-- 7. From the following table, write a SQL query to find the details of 
-- those salespeople whose name starts with any letter 
-- within 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  

select * from salesman s ;

 select * from salesman s 
where name between 'A' and 'L';


-- 8. From the following table, write a SQL query to find the details 
-- of all salespeople except whose name starts with any letter within 'A' and 'L' 
-- (not inclusive). Return salesman_id, name, city, commission.


 select * from salesman s 
where name not  between 'A' and 'L';



-- 9. From the following table, write a SQL query to find the details
-- of the customers whose name begins with the letter 'B'. 
-- Return customer_id, cust_name, city, grade, salesman_id. 

select * from customer c ;
select * from customer c 
where cust_name like 'B%';

-- 10. From the following table, write a SQL query to find the details 
-- of the customers whose names end with the letter 'n'. 
-- Return customer_id, cust_name, city, grade, salesman_id.

select * from customer c 
where cust_name like '%n';

-- 11. From the following table, write a SQL query to find the details of 
-- those salespeople whose name starts with ‘N’ and the fourth character is 'l'.
-- Rests may be any character.
-- Return salesman_id, name, city, commission.

select * from salesman s ;
select * from salesman s 
where name like 'N__l%';

-- 12. From the following table, write a SQL query to find those 
-- rows where col1 contains the escape character underscore ( _ ). Return col1.

select * from testtable t ;
select * from testtable t 
--where col1  like '%_%';
where col1 like '%/_%' ESCAPE '/';


-- 13. From the following table, write a SQL query to find those rows where col1 
-- does not contain the escape character underscore ( _ ). Return col1.

select * from testtable t 
where col1 not like '%a_%' escape 'a';


-- 14. From the following table, write a SQL query to find those rows where col1 contains 
-- the forward slash character ( / ). Return col1.

select * from testtable t 
where col1 like '%z/%' escape 'z';

-- 15. From the following table, write a SQL query to find those rows where col1 does 
-- not contain the forward slash character ( / ). Return col1.


select * from testtable t 
where col1 not like '%a/%' escape 'a';

-- 16. From the following table, write a SQL query to find those rows
-- where col1 contains the string ( _/ ). Return col1. 


select * from testtable t 
where col1 like '%a_/%' escape 'a';


-- 17. From the following table, write a SQL query to find those rows where col1 does
-- not contain the string ( _/ ). Return col1.  


select * from testtable t 
where col1 not like '%a_/%' escape 'a';


-- 18. From the following table, write a SQL query to find those rows where 
-- col1 contains the character percent ( % ). Return col1.

select * from testtable t 
where col1 like '%a%%' escape  'a';

--Same Result
select * from testtable t 
where col1 like '%/%%' escape  '/';

-- 19. From the following table, write a SQL query to find those rows where col1 does not
-- contain the character percent ( % ). Return col1.


select * from testtable t 
where col1 not like '%/%%' escape '/';


-- 20. From the following table, write a SQL query to find all those customers
-- who does not have any grade.
-- Return customer_id, cust_name, city, grade, salesman_id.

select * from customer c ;
select * from customer c 
where grade is null;

-- 21. From the following table, write a SQL query to find all those 
-- customers whose grade value 
-- exists. Return customer_id, cust_name, city, grade, salesman_id. 

select * from customer c 
where grade is not null;

-- Same
select * from customer c 
where not(grade is null);


-- 22. From the following table, write a SQL query to find the employees 
-- whose last name begins with the character 'D'. 
-- Return emp_idno, emp_fname, emp_lname and emp_dept.


select * from emp_details ed 
where emp_lname like 'D%';







































