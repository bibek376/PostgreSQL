
--Grouping Set

select * from employees e ;

explain select e.department_id,null "Job_Id",count(*)
from employees e 
group by e.department_id
union  all
select null,e.job_id ,count(*)
from employees e 
group by e.job_id 
order by 2 desc;

--cost Sort  (cost=8.70..8.77 rows=30 width=29)

--Let's do the same using GROPUING SETS

explain select e.department_id,e.job_id 
from employees e 
group by grouping sets (1,2);

--Cost (cost=3.34..3.91 rows=30 width=12)


--------------------------------------------------------------------------

--Rollup

select d.department_name,sum(e.salary) 
from employees e 
inner join departments d 
on e.department_id =d.department_id 
group by 1
order by 2 desc;

select d.department_name,sum(e.salary) 
from employees e 
inner join departments d 
on e.department_id =d.department_id 
group by rollup(1)
order by 1 ;

drop table product_sale ;

create table product_sale(id int,product_category varchar(30),product_name varchar(30),
							total_sale int);
insert into product_sale values(1,'game','mobo game',200);
insert into product_sale values(2,'game','pko game',400);
insert into product_sale values(3,'fashion','shirt',500);
insert into product_sale values(4,'fashion','shorts',100);

select p. product_category,p.product_name,sum(p.total_sale)
from product_sale p
group by rollup(1,2)
order by 1,2;


select * from product_sale ;

create table tbl_student(id int,name varchar(20),grade char(1));

insert into tbl_student values(1,'anvesh','A');
insert into tbl_student values(2,'kimly','B');
insert into tbl_student values(3,'jenny','C');
insert into tbl_student values(4,'ali','B');
insert into tbl_student values(5,'mukesh','D');
insert into tbl_student values(6,'sofia','A');
insert into tbl_student values(7,'roy','C');
insert into tbl_student values(8,'martin','C');


select t.grade,string_agg(t.name,',') "Student per grade"
from tbl_student t
group by 1
order by 1;


--------------------------------------------------------------------------
create table testtt(id int unique);

insert into testtt values(1);
insert into testtt values(null);
insert into testtt values(null);

select * from testtt;

create unique index idx_tt on testtt ((ID is null))
where ID is null;




