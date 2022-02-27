

drop table q1_table ;
create table q1_table(name char(1),address varchar(20),email varchar(30),
					  floor int,resource varchar(30));

insert into q1_table values('A','Banglore','A@gmail.com',1,'CPU');
insert into q1_table values('A','Banglore','A1@gmail.com',1,'CPU');					 
insert into q1_table values('A','Banglore','A2@gmail.com',2,'DESKTOP');					 
insert into q1_table values('B','Banglore','B@gmail.com',2,'DESKTOP');					 
insert into q1_table values('B','Banglore','B1@gmail.com',2,'DESKTOP');					 
insert into q1_table values('B','Banglore','B2@gmail.com',1,'MONITOR');

select * from q1_table qt ;


select ttt.name,tt.total_visit,ttt.floor "most_visited_floor",tt.resource_used
from 
(select qt.name,qt.floor,count(*) 
from q1_table qt
where qt."name" ='A'
group by 1,2
having count(*)=(select max(tt.count) from (select qt.name,qt.floor,count(*) 
				from q1_table qt
				where qt."name" ='A'
				group by 1,2)tt)
union all 
select qt.name,qt.floor,count(*) 
from q1_table qt
where qt."name" ='B'
group by 1,2
having count(*)=(select max(tt.count) from (select qt.name,qt.floor,count(*) 
				from q1_table qt
				where qt."name" ='B'
				group by 1,2)tt))ttt
inner join  
(select qt."name",count(*) "total_visit",
		string_agg(distinct qt.resource,',') "resource_used"
from q1_table qt 
group by 1) tt
on tt.name=ttt.name;

-----------------------------------------------------------------------
create table salary(id int,fname varchar(20),lname varchar(20),salary int);

insert into salary values(1,'Vishal','Kaushal',8000);
insert into salary values(2,'Akshya','Kumar',9000);
insert into salary values(3,'Zishan','Khan',3000);
insert into salary values(4,'Khan','Zishan',5000);
insert into salary values(5,'Katrina','Kaif',10000);
insert into salary values(6,'Kaushal','Vishal',4000);

select * from salary s ;
select tt.fname,tt.lname,tt.salary from 
(select s.id,case 
				when  s.fname='Vishal' then s.lname='Kaushal'
				when s.fname='Zishan' then s.lname='Khan'
				end "result"
,s.fname,s.lname,s.salary+s2.salary "salary"
from salary s,salary s2 
where s.fname=s2.lname)tt
where tt.result=true
union all 
select s.fname,s.lname,s.salary 
from salary s 
where s.fname not in (select s2.lname 
					  from salary s2);


---------------------------------------------------------------------------

create table maxrows (name varchar(20),amount1 int,amount2 int, amount3 int);
insert into maxrows values('Vishal',5000,6800,4300); 
insert into maxrows values('Rahul',3500,1000,2200); 
insert into maxrows values('Simran',9800,9999,9990); 
insert into maxrows values('Sukran',5600,7757,8897); 
insert into maxrows values('Vijaya',6647,9898,10000); 

select * from maxrows;


select m.name,case 
				when (m.amount1>=m.amount2 and m.amount1>=m.amount3) then m.amount1
				when (m.amount2>=m.amount1 and m.amount2>=m.amount3) then m.amount2
				else m.amount3
				end "MaxAmt"
from maxrows m;






