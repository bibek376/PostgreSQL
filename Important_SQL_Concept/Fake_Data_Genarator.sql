--Random Number

Select random();

Select random () * 10+5;

Select floor(random () * 10+5) :: int ;

select floor(3.7);

select round(random()*10);

--------------------------------------------------------------

CREATE OR REPLACE FUNCTION Random_Test (Min INT ,MAX INT) RETURNS INT AS
$$
BEGIN
RETURN floor(random()* (MAX-Min + 1) + Min);
END;
$$ language 'plpgsql' STRICT;


SELECT Random_Test(100,1000);

SELECT Random_Test(100,1000);

------------------------------------------------------------------------
--Generate Series
SELECT * FROM generate_series(1,10);

SELECT * FROM generate_series(0.5, 5);

SELECT * FROM generate_series(1,10,2);

------------------------------------------------------------------------------------

--Table Creation

create table department(dept_id int primary key,
						dept_name varchar(50) not null);


insert into department values(101,'Admin'),(102,'Hr'),(103,'Java'),(104,'Sales'),
							 (105,'React'),(106,'Database'),(107,'AI'),
							(108,'IT'),(109,'Angular'),(110,'Support');

select * from department;						

create table employee(emp_id int primary key,f_name varchar(20),
					 l_name varchar(20),salary int,email varchar(40),
					 department_id int,
					 foreign key(department_id) references department(dept_id));

----------------------------------------------------------------------------
-- Admin ------------5% 
-- Hr---------------5%
-- Sales ----------- 35%
-- Java------------ 10%
-- AI-------------  5%
-- Database------- 7%
-- React----------10%
-- IT-------------5%
-- Angular--------3%
-- Support--------15%				

-------------------------------------------------------------------------------
select * from department d ;
select * from employee e ;


insert into employee(emp_id,f_name,l_name,salary,email,department_id)
select tt.emp_id,tt.f_name,tt.l_name,tt.salary,
tt.f_name||tt.aaa||tt.mail "Email", tt.department_id from 
(select 
	a "emp_id" ,
	case round(random()*3)
	when 0 then 'Info'||a
	when 1 then 'Bibek'||a
	when 2 then 'Carlos'||a
	when 3 then 'Test'||a
	end "f_name",
	case round(random()*3)
	when 0 then 'dev'||a
	when 1 then 'Rawat'||a
	when 2 then 'Den'||a
	when 3 then 'Data'||a
	end "l_name",
	round(random() * (50000-10000+1) +10000) "salary",
	a::varchar||'@' "aaa",
	case round(random()*3)
	when 0 then 'gmail.com'
	when 1 then 'hotmail.com'
	when 2 then 'yahoomail.com'
	when 3 then 'servicemail.com'
	end "mail",
	round(random()* (110-101)+101) "department_id"
	from pg_catalog.generate_series(1,10) a)tt; 
	


select 1::varchar||'aa'::varchar;	
	
------------------------------------------------------------------------

--Testing Section
select 
case round(random()*3)
	when 0 then 'Info'||a
	when 1 then 'Bibek'||a
	when 2 then 'Carlos'||a
	when 3 then 'TestData'||a
	end "Name"||(case round(random()*3)
	when 0 then 'Info'||a
	when 1 then 'Bibek'||a
	when 2 then 'Carlos'||a
	when 3 then 'TestData'||a
	end "Name")
from generate_series(1,50) a;
		
	
select * from pg_catalog.generate_series(1,1000) a; 
	
	
select round(random()*3);

select round(random() * (50000-10000+1) +10000);


select round(random()* (110-101)+101); 










