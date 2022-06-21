create table users(uid int,user_name varchar,acc_id int);

insert into users values(4,9812345671,null);

select * from users u ;

create table account(acc_id int,acc_name varchar,mobile varchar);

CREATE SEQUENCE mysequence
INCREMENT 10
START 100;

insert into account values(nextval('mysequence'),'Umesh',9847832);


select * from account a;
select * from users u ;

insert into account(acc_id,acc_name,mobile)
select nextval('mysequence'),'Database',u.user_name  from users u
where u.user_name not in (select a.mobile from account a)

select * from users u ;

update  users 
set acc_id=tt.acc_id
from users uu join  (select a.acc_id as acc_id,a.mobile as mobile from users u 
		inner join account a 
		on u.user_name=a.mobile) tt 
		on uu.user_name=tt.mobile
		where users.user_name=tt.mobile;

	
	
select * from account
where mobile='9812345679';
select * from users u ;



select *
from users uu join (select a.acc_id as acc_id,a.mobile as mobile from users u 
		inner join account a 
		on u.user_name=a.mobile) tt 
		on uu.user_name=tt.mobile

select * from account ;
select * from users u ;




delete from account 
 using (select a.acc_id , u.user_name  from account a 
					left join users u 
					on a.mobile=u.user_name
					where u.user_name is null)tt
				where account.mobile=tt.user_name;
				


















