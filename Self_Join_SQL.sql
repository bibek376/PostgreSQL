

--SQL Self Join

create table employee(
				emp_id int,
				name varchar(30),
				manager_id int
);

insert into employee values(1,'Rahul',3);
insert into employee values(2,'Jay',3);
insert into employee values(3,'Sonam',4);
insert into employee values(4,'Kunal',5);
insert into employee values(5,'Ram',6);
insert into employee values(6,'Rani',null);
insert into employee values(7,'Veeru',6);

select * from employee e ;

select *
from employee e1,employee e2
where e1.manager_id=e2.emp_id;












