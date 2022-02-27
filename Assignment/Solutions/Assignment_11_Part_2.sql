

-- Q1
create table q1_table (emp_id int ,emp_name varchar(20),gender character(1));

insert into q1_table values(501,'aaa','M');
insert into q1_table values(502,'bbb','F');
insert into q1_table values(503,'ccc','F');
insert into q1_table values(504,'ddd','M');
insert into q1_table values(505,'eee','F');

select tt.emp_id,case 
					when tt.dn=1 then 'Ms.'||tt.emp_name
					when tt.dn=2 then 'Mr.'||tt.emp_name
					else tt.emp_name
					end "emp_name"
					
,tt.gender
from 
(select q.*,
dense_rank() over (order by gender ) "dn"
from q1_table q)tt ;

--OR

select q.emp_id,case 
					when q.gender='M' then 'Mr.'||q.emp_name
					when q.gender='F' then 'Ms.'||q.emp_name
					end "emp_name",
	   q.gender
from q1_table q;

--OR 

select q.emp_id,'Mr.'||q.emp_name "emp_name",q.gender
from q1_table q
where q.gender='M'
union 
select q.emp_id,'Ms.'||q.emp_name "emp_name",q.gender
from q1_table q
where q.gender='F';


--Q2 

create table q2_table(emp_id int,name varchar(30));

insert into q2_table values(101,'Bibek Mahatara');
insert into q2_table values(102,'Deepak Singh');

select q2.emp_id,split_part(q2.name,' ',1) "first_name",
				split_part(q2.name,' ',2) "last_name"
from q2_table q2; 




--OR
select tt.emp_id,substring(tt.name,1,tt.pos) "first_name"
,substring(tt.name,tt.pos) "last_name" 
from 
(select q.*,position(' ' in  q2.name) "pos"
from q2_table q2
inner join q2_table q
on q.emp_id=q2.emp_id)tt;

select substring('Bibek Mahatara',1,6); 








