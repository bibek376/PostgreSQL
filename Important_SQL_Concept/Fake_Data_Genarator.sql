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
















