

--Table creatation for partition table using range

create table partion_test(id int,name varchar) partition by range(id);
drop table partion_test;



create table partition_1 partition of partion_test for values
from (minvalue) to (250000);


create table partition_2 partition of partion_test for values
from (250000) to (500000);

create table partition_3 partition of partion_test for values
from (500000) to (maxvalue);

drop table partition_1;

select * from partition_1;


--Insert Data into partion_test
insert into partion_test
select x,'bibek'
from pg_catalog.generate_series(1,1000000) x ;

explain select * from partion_test
where id in (23421,765834,945632)
and name='bibek';

create index pt_idx on partion_test(id);

--List Partition 

create table partition_list_test(id int,status text,arr numeric)
partition by list(status);


create table active partition of partition_list_test for
values in ('active');


create table expired partition of partition_list_test for
values in ('expired');

create table other partition of partition_list_test default;

insert into partition_list_test
values
(1,'active',100),
(2,'recurring',10),
(3,'expired',300),
(4,'reactivated',140);


select tableoid::regclass,* from partition_list_test;









