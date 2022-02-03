create table if not exists public.test_table(
	id int,
	name varchar(20)
);

insert into test_table values(1,'Bibek');
insert into test_table values(2,'   biBek  ');
insert into test_table values(1,'    BiBek');
insert into test_table values(3,null);


select * from test_table where trim(lower(name) )='bibek';


create table date_test(
	dob timestamp
);

insert into date_test values (current_timestamp);

select * from date_test;


select * from date_test 
where substring(dob::varchar,1,10)='2022-02-02';


--Converting date into character
select to_char(current_date,'yyyy-mm-dd');



create table test_col(
	id int,
	salary int
);

insert into test_col values(1,2000);
insert into test_col values(2,3000);
insert into test_col values(3,null);

select * from test_col;

select avg(salary) from test_col; 
--Conclusion without coalesce it is 2500 wich is wrong.

select avg(coalesce(salary,0)) from test_col;











