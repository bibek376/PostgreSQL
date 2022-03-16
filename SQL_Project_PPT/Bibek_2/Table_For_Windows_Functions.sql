
select * from deadlock_problem ;


update deadlock_problem set id=id+7 where id=1;

delete from deadlock_problem 
where id=1;

commit;


-- For Solutions 1
CREATE TABLE match_crowd (match_no int, match_date date not null unique, audience int);
INSERT INTO match_crowd VALUES ( 1,'2016-06-11',  75113 );
INSERT INTO match_crowd VALUES ( 2,'2016-06-12',  62343 );
INSERT INTO match_crowd VALUES ( 3,'2016-06-13',  43035 );
INSERT INTO match_crowd VALUES ( 4,'2016-06-14',  55408 );
INSERT INTO match_crowd VALUES ( 5,'2016-06-15',  38742 );
INSERT INTO match_crowd VALUES ( 6,'2016-06-16',  63670 );
INSERT INTO match_crowd VALUES ( 7,'2016-06-17',  73648 );
INSERT INTO match_crowd VALUES ( 8,'2016-06-18',  52409 );
INSERT INTO match_crowd VALUES ( 9,'2016-06-19',  67291 );
INSERT INTO match_crowd VALUES (10,'2016-06-20',  49752 );
INSERT INTO match_crowd VALUES (11,'2016-06-21',  28840 );
INSERT INTO match_crowd VALUES (12,'2016-06-22',  32836 );
INSERT INTO match_crowd VALUES (13,'2016-06-23',  44268 );

--For Solutions 2
drop table window_delete ;

create table window_delete(id int,name varchar);

insert into window_delete values(1,'Bibek');
insert into window_delete values(2,'Bibek');
insert into window_delete values(3,'Bibek');
insert into window_delete values(4,'Ram');

















