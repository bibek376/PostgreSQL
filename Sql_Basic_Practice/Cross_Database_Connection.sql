
-- Source  ----------- Destination

-- testdb_2 ---------> hr(working place) 
-- nurse table

--      -------------->extension creation in hr table       
-- 

-- postgres to postgres ---->dblink
-- mysql to postgres   -----> mysql_fdr
-- mssql to postgres -------> tds_fdw
-- oracle to postgres ------> oracle_fdw

-- fdw---> foreign data wrapper
select * from public.nurse;

---step-I
create extension dblink;

select * from pg_catalog.pg_extension ; -->for Verification

--Verify the system tables of DBLink
SELECT pg_namespace.nspname, pg_proc.proname
FROM pg_proc, pg_namespace
WHERE pg_proc.pronamespace=pg_namespace.oid
AND pg_proc.proname LIKE '%dblink%';


--Step -II (Test the connection for testdb_2)
--For testdb_2

SELECT dblink_connect('host=localhost user=postgres password=CarloS@123.
dbname=testdb_2');


--Step -III (Create foreign data wrapper and server for global)
--( i.e. In hr database)

CREATE FOREIGN DATA WRAPPER postgres
VALIDATOR postgresql_fdw_validator;

--testdb_2 ---> hr
CREATE SERVER testdb_2_server FOREIGN DATA WRAPPER postgres OPTIONS (hostaddr
'127.0.0.1', dbname 'testdb_2');


--Step-IV (Mapping of user and server)

CREATE USER MAPPING FOR postgres SERVER testdb_2_server
OPTIONS (user 'postgres',password 'CarloS@123.');

--i.e 1 st postgres---->username of hr not a hr name  


--Step-V (Test this server)

SELECT dblink_connect('testdb_2_server');


--Step-VI (Now you can select data of testdb_2 from hr)

SELECT * FROM public.dblink
('testdb_2_server','select * from public.nurse n')
AS DATA(emp_id INTEGER,n_name varchar(60),position varchar(60),registered bool,
ssn integer);


create table nurse_test
as
SELECT * FROM public.dblink
('testdb_2_server','select * from public.nurse n')
AS DATA(emp_id INTEGER,n_name varchar(60),position varchar(60),registered bool,
ssn integer);


select * from nurse_test;


