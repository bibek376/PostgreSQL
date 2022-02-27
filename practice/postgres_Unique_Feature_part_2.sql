
-- Script to convert data into JSON format without column name for key:
CREATE TABLE tbl_EmployeeDetails
(
	EmpID INTEGER
	,DepartmenetName VARCHAR(50)
	,EmpFirstName VARCHAR(50)
	,EmpLastName VARCHAR(50)
);
 
INSERT INTO tbl_EmployeeDetails VALUES
(1,'Sales','Anvesh','Patel')
,(2,'Sales','Neevan','Patel')
,(3,'Order','Roy','Loother')
,(4,'Marketing','Martin','Farook')
,(5,'Marketing','Jenny','Pandya')
,(6,'Marketing','Mahi','Patel');

select * from tbl_EmployeeDetails;	

select te.departmenetname
,json_agg(row_to_json((te.empfirstname,te.emplastname))) "Json Row" 
from tbl_EmployeeDetails te
group by 1;

SELECT 
	DepartmenetName
	,json_agg(row_to_json
	(
	  (SELECT ColumnName FROM (SELECT EmpFirstName, EmpLastName) AS ColumnName (EmpFirstName, EmpLastName))
	)) AS JsonData
FROM tbl_EmployeeDetails
GROUP BY DepartmenetName;


---------------------------------------------------------------------------------

--Using a filter clause , multiple count(*) in one select query for different groups.
drop table tbl_student ;
create table tbl_student(
				id int,
				name varchar,
				marks int
);

insert into tbl_student
values (1,'Avinash',88),(2,'Jenny',55),
(3,'Tushar',85),(4,'Kavita',75),(5,'Manas',42),
(6,'Martin',69),(7,'Roy',95),(8,'Benny',92),
(9,'Neevan',82),(10,'Lee',43),(11,'Lothere',65),
(12,'Eric',58);

select 
count(1) as total_student,
count(1) filter (where ts.marks between 40 and 60 ) "Grade C",
count(1) filter (where ts.marks between 60 and 80 ) "Grade B",
count(1) filter (where ts.marks between 80 and 100 ) "Grade A"
from tbl_student ts ;

--OR

select count(1) "Total_Student",
count(case when ts.marks between 40 and 60 then 1 end) "Grade C",
count(case when ts.marks between 60 and 80 then 1 end ) "Grade B",
count(case when ts.marks between 80 and 100 then 1 end) "Grade A"
from tbl_student ts ;

---------------------------------------------------------------------------------
create domain domain_email as text
check(
	value ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'
);


create table email_checker(email domain_email);

insert into email_checker values('cu.18bcs6728@gmail.com');
insert into email_checker values('bibek@gmail.com');

select * from email_checker;

---------------------------------------------------------------------------------
--Pivot-table Concept

select count(tt.shipping) "Total_Shipping",
	   count(tt.sales) "Total_Sales",
	   count(tt.finance) "Total_Finance"
from 
(select e.first_name,
case when e.department_id=50 then e.first_name end as "shipping",
case when e.department_id=80 then e.first_name end as "sales",
case when e.department_id=100 then e.first_name end as "finance"
from employees e)tt ;










