
-- Department table
create table dept(
	department_id int not null,
	department_name varchar(100)
);


-- Employee table

create table emp (
	emp_id int not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	salary int check(salary>0),
	department_id int not null
);

-- Insert values in dept table
insert into dept values(1,'IT');
insert into dept values(2,'Dabatabase');


-- Insert values in emp table 
insert into emp values(101,'Bibek','Mahatara','2000',1);
insert into emp values(102,'Avishek','Shakye','1500',2);
insert into emp values(103,'Bhawona','Shahi','2000',2);
insert into emp values(104,'Biswas','Khadka','1000',1);
insert into emp values(105,'Jivan','Basnet','1200',2);


-- emp1 table as a copy of emp table

create table emp1 
as 
select * from emp;

select * from emp1 e;


-- Adding Primary and Foreign key
alter table emp add constraint pk_emp primary key(emp_id);

alter table dept add constraint pk_dept primary key(department_id);

alter table emp add foreign key(department_id) references 
dept(department_id); 



-- Dep1 table as a copy of dep column
create table dep1 
as 
select * from dept;


select * from dep1;





























