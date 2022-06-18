
-------------------------------------------------------------------------
--How To Find slow,long-running  & Blocked Queries in Postgresql
--------------------------------------------------------------------------

select * from pg_catalog.pg_stat_activity; 

--Total Connection

select count(*) "Total_Connection" from pg_catalog.pg_stat_activity;


select count(*)  from pg_catalog.pg_stat_activity
where client_addr='127.0.0.1';

----------------------------------------------------------

--Transaction That Are Running More than 5 min

select pid,user,pg_stat_activity.query_start,
		now()-pg_stat_activity.query_start "query_time",
		query,state,wait_event_type,wait_event
from pg_stat_activity
where (now()-pg_stat_activity.query_start) > interval '5 minutes'
order by 4;

------------------------------------------------------------------


--kill Above Process
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid= 327415;


---------------------------------------------------------------------

--Total Activity in Database
select client_addr,usename,datname,state,count(*)
from pg_catalog.pg_stat_activity
group by 1,2,3,4
order by 5 desc;




--Transaction That Are Running More than 5 min
SELECT pid, now() - query_start as "runtime", usename, datname, state, query
  FROM  pg_stat_activity
  WHERE now() - query_start > '1 minutes'::interval
 ORDER BY runtime DESC;

-------------------------------------------------------------------------
--Locks

select relname "relation_name",query,pg_locks.*
from pg_locks 
join pg_class on pg_locks.relation=pg_class.oid
join pg_stat_activity on pg_locks.pid=pg_stat_activity.pid;

----------------------------------------------------------------------------

--How To Find blocked query and blocking query
select 
	activity.pid,
	activity.usename,
	activity.query,
	blocking.pid "blocking id",
	blocking.query "blocking query"
from pg_stat_activity as activity
join pg_stat_activity as blocking 
on blocking.pid=any(pg_blocking_pids(activity.pid));


------------------------------------------------------------------------

--How to view locks on tables using pg_locks

select * from pg_locks;


---------------------------------------------------------------------------

--How to use it find locks with tables names and queries

select relname "relation_name",query,pg_locks.* from pg_locks
join pg_class on pg_locks.relation=pg_class.oid
join pg_stat_activity on pg_locks.pid=pg_stat_activity.pid;

























