
start transaction;

drop table test1;
create table test1(id int ,name char(1));
create table test2(id int,name char(1));

insert into test1 values(4,'D');

insert  into test1 values(1,'A'),(2,'B'),(3,'C');

select * from test1;


--SQL Injection
select * from test1 
where id=1 or 1=1-- ;


select * from test1 
where name='asdf' or 1=1-- ;

select * from test1 t 
where name='A' --' and id=123; 

select * 
from test1
where id=1;
drop table test2;

select * from test2;

savepoint test1_insert;

commit;


delete from test1 where id=1;
delete from test1 where id=2;

select * from test1;

rollback;

rollback to test1_insert;

end transaction;


select * from test1;

delete  from test1 where id=2;

rollback;

select * from test1;

rollback to test1_insert;






