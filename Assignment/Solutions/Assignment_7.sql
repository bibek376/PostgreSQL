
--Assignment -7

-- Q-1
create table window_test(id int,name varchar);

insert into window_test values(1,'Bibek');
insert into window_test values(2,'Bibek');
insert into window_test values(3,'Bibek');
insert into window_test values(4,'Ram');

select * from window_test ;

select * from(select wt.*,
row_number() over (partition by name ) "rn"
from window_test wt)tt
where tt.rn >1;

delete from window_test 
where window_test.id in (select tt.id from(select wt.*,
				row_number() over (partition by name ) "rn"
				from window_test wt)tt
				where tt.rn >1);

select * from window_test ;

drop table window_test ;


-- Q-2

create table window_test_row(id int,f_name varchar,dept_id int,
				constraint unique_pk unique (id,dept_id));


create table staff(id int,name varchar,dept_id int);

insert into staff values (101,'bibek',11);
insert into staff values (101,'ram',11); 
insert into staff values (101,'bibek',11); 
insert into staff values (103,'bibek',11); 
insert into staff values (104,'bibek',12);

select * from staff ;

insert into window_test_row
select ttt.id,ttt.name,ttt.dept_id
from (select * from 			
		(select s.*,
		row_number() over (partition by s.id,s.dept_id)"rn"
		from staff s)tt
		where tt.rn=1)ttt;
	
select * from staff ;	
select * from window_test_row ;	
			
			
			

			
			
			
			

