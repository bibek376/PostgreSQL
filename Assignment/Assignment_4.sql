

CREATE
TABLE SALES (


  CUSTOMER_ID VARCHAR(1),

  ORDER_DATE DATE,

  PRODUCT_ID INTEGER

);




INSERT INTO SALES VALUES

  ('A', '2021-01-01', '1'),

  ('A', '2021-01-01', '2'),

  ('A', '2021-01-07', '2'),

  ('A', '2021-01-10', '3'),

  ('A', '2021-01-11', '3'),

  ('A', '2021-01-11', '3'),

  ('B', '2021-01-01', '2'),

  ('B', '2021-01-02', '2'),

  ('B', '2021-01-04', '1'),

  ('B', '2021-01-11', '1'),

  ('B', '2021-01-16', '3'),

  ('B', '2021-02-01', '3'),

  ('C', '2021-01-01', '3'),

  ('C', '2021-01-01', '3'),

  ('C', '2021-01-07', '3');

 




CREATE TABLE MENU (

  PRODUCT_ID INTEGER,

  PRODUCT_NAME VARCHAR(5),

  PRICE INTEGER

);




INSERT INTO MENU VALUES

  ('1', 'sushi', '10'),

  ('2', 'curry', '15'),

  ('3', 'ramen', '12');

  




CREATE TABLE MEMBERS (

  CUSTOMER_ID VARCHAR(1),

  JOIN_DATE DATE

);




INSERT INTO MEMBERS VALUES

  ('A', '2021-01-07'),

  ('B', '2021-01-09');
 
 
 
select * from sales s ;
select * from members m ;
select * from menu m ;


--1. What is the total amount each customer spent at the restaurant?

select ttt.customer_id,sum(ttt.result) "Total Amount"
from
(select tt.customer_id, tt.total_number_of_product * (select price
									  from menu
									  where menu.product_id=tt.product_id) "result" 
					from 
					(select s.customer_id,s.product_id ,count(*) "total_number_of_product" 
					from sales s 
					group by s.customer_id,s.product_id) tt) ttt
group by ttt.customer_id;


--OR 
select s.customer_id,sum(m.price) 
from 
sales s inner join menu m 
on m.product_id =s.product_id 
group by s.customer_id ;

--OR

 SELECT  S.CUSTOMER_ID, SUM(M.PRICE) FROM SALES S 
 JOIN MENU M ON 
 S.PRODUCT_ID = M.PRODUCT_ID
 GROUP BY  S.CUSTOMER_ID;
 


--2. How many days has each customer visited the restaurant?

select * from sales s ;
select tt.customer_id,count(*) 
from
				(select s.customer_id ,s.order_date 
				from sales s 
				group by s.customer_id ,s.order_date)tt
group by tt.customer_id;

--OR
SELECT S.CUSTOMER_ID, COUNT(DISTINCT(S.ORDER_DATE))
 FROM SALES S 
 GROUP BY S.CUSTOMER_ID;


--3. What is the most purchased item on the menu
--   and how many times was it purchased by all customers?
select * from sales s ;
select * from menu m ;


select * 
from menu m 

select s.product_id ,count(*) "product_count" 
		from sales s
		group by s.product_id 
		having count(*)=(select max(tt.product_count)
						 from (select s.product_id,count(*) "product_count" 
								from sales s
								group by s.product_id ) tt);
							
--OR
select m.product_name ,count( s.product_id)
from sales s 
inner join menu m 
on m.product_id =s.product_id 
group by m.product_name
having count(*)= (select max(tt.product_count)
						 from (select s.product_id,count(*) "product_count" 
								from sales s
								group by s.product_id ) tt);
							
--OR
SELECT M.PRODUCT_NAME, COUNT(*) AS TOTALSALES
 FROM SALES S 
 JOIN MENU M ON 
 S.PRODUCT_ID = M.PRODUCT_ID
 GROUP BY M.PRODUCT_NAME
 ORDER BY TOTALSALES DESC LIMIT 1;							
							
							
--4. What is the total items and amount spent for 
--    each member before they became a member?

select * from sales s ;
select * from menu m ;
select * from members m ;

select tttt.customer_id,sum(tttt.product_count) "Total Product",sum(tttt.result) "Total Price"
from 
	(select ttt.customer_id,ttt.product_count, ttt.product_count *(select m.price from menu m 
							   where m.product_id=ttt.product_id ) "result"  
	from 
		(select tt.customer_id,tt.product_id,count(*) "product_count"
		from
		(select * from  sales s
				where s.order_date<(select m.join_date 
								   from members m
								   where s.customer_id=m.customer_id)) tt 
		group by tt.customer_id,tt.product_id)ttt) tttt
	group by tttt.customer_id;					  


 --OR
select ttt.customer_id,sum(ttt.product_count) " Total Product",sum(ttt.result) "Total Price"
from 
(select tt.customer_id,tt.product_count,tt.product_count*(select m.price from menu m 
							   where m.product_id=tt.product_id ) "result"
from
(select s.customer_id,s.product_id,count(*) "product_count" 
from sales s 
inner join members m 
on m.customer_id=s.customer_id 
inner join menu m2
on m2.product_id =s.product_id 
where s.order_date < (select m.join_date 
								   from members m
								   where s.customer_id=m.customer_id)
								   group by s.customer_id,s.product_id )tt) ttt
group by ttt.customer_id;

--OR
 SELECT S.CUSTOMER_ID, COUNT(*) AS TOTAL_ITEMS_PURCHASED, SUM(PRICE) AS TOTAL_AMT_SPENT FROM SALES S 
 JOIN MEMBERS M ON 
 S.CUSTOMER_ID = M.CUSTOMER_ID
 JOIN MENU ME ON
 S.PRODUCT_ID = ME.PRODUCT_ID
 WHERE S.ORDER_DATE < M.JOIN_DATE
 GROUP BY S.CUSTOMER_ID;

 
 
 
 
 
 
 
 
 
 
 
