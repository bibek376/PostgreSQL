--1068. Product Sales Analysis I level

select * from sales_1068 s ;
select * from product_1068 p ;


select p.product_name,s."year" ,s.price  from sales_1068 s 
inner join product_1068 p 
on s.product_id=p.product_id ;
