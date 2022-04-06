
--Vacuum Tutorial

drop table hello;

create table hello(id int) with (autovacuum_enabled=off);

insert into hello select * from generate_series(1,1000000);

select * from hello ;


--To know the status of Vacuum by default it is on.
select * from pg_catalog.pg_settings 
where name='autovacuum';



select pg_size_pretty(pg_relation_size('hello'));

--To see realtuple
select * from pg_class
where relname='hello';

delete from hello where id >700000; 

select count(*) from hello;

select * from hello 
where id=4;


--To See a Dead tuple
select relname,n_dead_tup from pg_stat_user_tables
where relname='hello';


--To see last vacuum time
select relname,last_vacuum,last_autovacuum from pg_catalog.pg_stat_user_tables 
where relname='hello';

--To Update Letest Activity
analyze hello;


-------------------------------------------------------------------------

create table ev(id int) with (autovacuum_enabled=off);

insert into ev select * from generate_series(1,10000);


select * from ev;


select pg_size_pretty(pg_relation_size('ev'));
--360 K.B Size

--To see realtuple
select * from pg_class
where relname='ev';
--0 reltuple

analyze ev;
--reltable 10000

update ev set id=id+1;

select pg_size_pretty(pg_relation_size('ev'));

--Now size become 712 K.B


update ev set id=id+1;
select pg_size_pretty(pg_relation_size('ev'));
--Now size become 1064 K.B

update ev set id=id+1;
select pg_size_pretty(pg_relation_size('ev'));
--Now size become 1416 K.B

analyze ev;

select pg_size_pretty(pg_relation_size('ev'));

update ev set id=id+1;

drop table ev;




