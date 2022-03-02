


create table test(id int ,name varchar(20));

insert into test(name) values ('Bibek');
insert into test values (nextval('seq'), 'Bibek');
insert into test values (nextval('seq'), 'Bibek');
insert into test values (nextval('seq'), 'Bibek');
insert into test values (nextval('seq'), 'Bibek');

select * from test;

select nextval('seq'); 


create sequence seq 
				start 100
				increment 1;
select 	currval('seq');

insert into test values (nextval('seq_for_test_2'), 'Bibek');

---------------------------------------------------------------------------

--creating a sequence only for table test_2

create table test_2 (id int not null,name varchar(30));

create sequence seq_for_test_2
				increment -1
				maxvalue 20
				minvalue 10
				start 12
				cycle 
				owned by test_2.id;
				

drop table test_2;


select nextval('seq_for_test_2') ;














