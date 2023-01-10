--1069. Product Sales Analysis II Level

select * from sales_1068 s ;
select * from product_1068 p ;



select p.product_id,sum(s.quantity) total_quantity from sales_1068 s 
inner join product_1068 p 
on s.product_id=p.product_id 
group by 1;

