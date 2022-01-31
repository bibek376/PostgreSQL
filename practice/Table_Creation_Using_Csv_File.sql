-- Create table pet using csv file

create table if not exists public.pet(pet_id varchar(50) not null,
	name varchar(30) not null,
	kind varchar(30) not null,
	gender varchar(15),
	age int,
	owner_id int not null,
	constraint pk_pet primary key (pet_id)
);

select * from pet;

copy public.pet from '/home/bibek/Desktop/Postgres/practice/pet.csv' delimiter ',' csv header; 

select count(distinct(owner_id)) from pet;

select owner_id from pet where owner_id=null;




-- Create table owner using csv file owner.csv

create table if not exists public.owner(owner_id varchar (40) not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	street_address varchar(70),
	city varchar(30),
	state varchar(20),
	state_full varchar(50),
	zip_code int not null,
	constraint pk_owner_id primary key(owner_id)
);

select * from owner;


copy public.owner from '/home/bibek/Desktop/Postgres/practice/owner.csv' delimiter ',' csv header; 






























