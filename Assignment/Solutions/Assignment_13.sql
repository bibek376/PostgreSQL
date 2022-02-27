

--Assignment - 13

----------------------------------------------------------------------------------

-- Q-1
create table inputs(dept_name varchar (25),intern int,trainee int,jr_database int,
					mid_database int,sr_database int);
insert into inputs values('Database',5000,15000,22000,45000,70000);

select * from inputs ;


create extension tablefunc;

select * from crosstab('select * from inputs') as tt
(dept_name varchar,db_role varchar,salary int); 

------------------------------------------------------------------------------------

-- Q-2

drop table coursesales;
create table coursesales(course varchar(20), year int,earnings int);

insert into coursesales values('.NET',2012,10000);
insert into coursesales values('Java',2012,20000);
insert into coursesales values('.NET',2012,5000);
insert into coursesales values('.NET',2013,48000);
insert into coursesales values('Java',2013,30000);

select * from coursesales;

select c.year,
sum(case when c.course='.NET' then c.earnings end) ".NET" ,
sum(case when c.course='Java' then c.earnings end)"Java"
from coursesales c
group by 1
order by 1;



------------------------------------------------------------------------------------

-- Q-3
create table name(id int,name varchar(50));

insert into name values(1,'RAJA RAMMOHAN RAI');
insert into name values(2,'SACHIN RAMESH TENDULKAR');
insert into name values(3,'ABDUL KALAM SHAIB');
insert into name values(4,'MICROSOFT SQL SERVER');
insert into name values(5,'YEDURAPPA V REDDY');

select * from name;


select tttt.fname "FIRSTNAME",substring(tttt.remaining_name,1,tttt.position) "MIDDLENAME",
					substring(tttt.remaining_name,tttt.position)" LASTNAME" 
from 
(select ttt.*,position(' ' in ttt.remaining_name) 
from 
(select substring(name,1,tt.position) "fname",
trim(leading ' ' from substring(name,tt.position))"remaining_name" from 
(select n.*,position(' ' in name) 
from name n)tt)ttt)tttt;


------------------------------------------------------------------------------------

-- Q-4
create table gender(gender character(1));

insert into gender 
values('M'),('M'),('M'),('F'),('M'),('F');


select * from gender;

select ceiling((tt.male_count * 100)/(tt.male_count+tt.female_count)::numeric) "Male %",
floor((tt.female_count*100)/(tt.male_count+tt.female_count)::numeric) "Female %"
from 
(select count(case when g.gender='M' then 1 end) "male_count" ,
	   count(case when g.gender='F' then 1 end) "female_count"
from gender g)tt;






