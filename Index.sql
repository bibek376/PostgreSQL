

--For primary key it will automatically create default 'Btree' index
create table index_example(id int primary key);


--explain -->cost optimizer

explain select e.department_id,count(e.employee_id)  
from employees e 
group by 1;


create index dept_index on employees (department_id);

drop index dept_index;

explain select *
from employees e
where e.first_name ='John';

create index first_emp_idx on employees (first_name);

drop index first_emp_idx;



--Create a table with sample records:
drop table tbl_testIndex;

CREATE TABLE tbl_testIndex(a INTEGER, b INTEGER);

INSERT INTO tbl_testIndex
SELECT x, x FROM generate_series(1, 5000) AS f(x);


select 'Hello World' from generate_series(1,100);


select * from tbl_testindex ;


explain SELECT * FROM tbl_testIndex
ORDER BY a,b;
--->cost is 380

--> Let's Create an index 
create index tbl_testindex_idx on tbl_testindex(a,b);

--Let's Check the cost

explain SELECT * FROM tbl_testIndex
ORDER BY a,b;

-->Cost is 0.28


drop index tbl_testindex_idx;



--Brin Index

CREATE TABLE tbl_ItemTransactions
(
TranID SERIAL
,TransactionDate TIMESTAMPTZ
,TransactionName TEXT
);

INSERT INTO tbl_ItemTransactions
(TransactionDate, TransactionName)
SELECT x, 'dbrnd'
FROM generate_series('2009-01-01 00:00:00'::timestamptz,
'2011-08-01 00:00:00'::timestamptz,'2 seconds'::interval) a(x);

select * from tbl_ItemTransactions;

drop table tbl_ItemTransactions;

--Let's Check the size of tbl_ItemTransactions table

SELECT pg_size_pretty(pg_total_relation_size('tbl_ItemTransactions')) 
AS TableSize;




--Now Check the performance without any Index:
EXPLAIN ANALYSE
SELECT COUNT(1) FROM tbl_ItemTransactions WHERE TransactionDate
BETWEEN '2009-01-01 00:00:00' and '2011-08-08 08:08:08';

--Cost 
--Finalize Aggregate  (cost=614095.11..614095.12 rows=1 width=8) 
--(actual time=1375.478..1380.165 rows=1 loops=1)


--Create BRIN index on TransactionDate Column:

CREATE INDEX idx_tbl_ItemTransactions_TransactionDate
ON tbl_ItemTransactions
USING BRIN (TransactionDate);


EXPLAIN ANALYSE
SELECT COUNT(1) FROM tbl_ItemTransactions WHERE TransactionDate
BETWEEN '2009-01-01 00:00:00' and '2011-08-08 08:08:08';


drop index idx_tbl_ItemTransactions_TransactionDate;

CREATE INDEX idx_tbl_ItemTransactions_TransactionDate
ON tbl_ItemTransactions(TransactionDate);


--size of index(idx_tbl_ItemTransactions_TransactionDate) using btree ->882M
--size of index(idx_tbl_ItemTransactions_TransactionDate) using BRIN ->80K

--
--Script to find Index Size and
--Index Usage Statistics


SELECT
pt.tablename AS TableName
,t.indexname AS IndexName
,pc.reltuples AS TotalRows
,pg_size_pretty(pg_relation_size(quote_ident(pt.tablename)::text)) AS TableSize
,pg_size_pretty(pg_relation_size(quote_ident(t.indexrelname)::text)) AS IndexSize
,t.idx_scan AS TotalNumberOfScan
,t.idx_tup_read AS TotalTupleRead
,t.idx_tup_fetch AS TotalTupleFetched
FROM pg_tables AS pt
LEFT OUTER JOIN pg_class AS pc
ON pt.tablename=pc.relname
LEFT OUTER JOIN
(
SELECT
pc.relname AS TableName
,pc2.relname AS IndexName
,psai.idx_scan
,psai.idx_tup_read
,psai.idx_tup_fetch
,psai.indexrelname
FROM pg_index AS pi
JOIN pg_class AS pc
ON pc.oid = pi.indrelid
JOIN pg_class AS pc2
ON pc2.oid = pi.indexrelid
JOIN pg_stat_all_indexes AS psai
ON pi.indexrelid = psai.indexrelid
)AS T
ON pt.tablename = T.TableName
WHERE pt.schemaname='public'
ORDER BY 1;


--Script to find a Missing Indexes of the schema

SELECT
relname AS TableName
,seq_scan-idx_scan AS TotalSeqScan
,CASE WHEN seq_scan-idx_scan > 0
THEN 'Missing Index Found'
ELSE 'Missing Index Not Found'
END AS MissingIndex
,pg_size_pretty(pg_relation_size(relname::regclass)) AS TableSize
,idx_scan AS TotalIndexScan
FROM pg_stat_all_tables
WHERE schemaname='public'
AND pg_relation_size(relname::regclass)>100000
ORDER BY 2 DESC;


--Script to find the unused indexes in PostgreSQL:

SELECT
PSUI.indexrelid::regclass AS IndexName
,PSUI.relid::regclass AS TableName
FROM pg_stat_user_indexes AS PSUI
JOIN pg_index AS PI
ON PSUI.IndexRelid = PI.IndexRelid
WHERE PSUI.idx_scan = 0
AND PI.indisunique IS FALSE;



--Script to find the duplicate indexes in PostgreSQL:

SELECT
indrelid::regclass AS TableName
,array_agg(indexrelid::regclass) AS Indexes
FROM pg_index
GROUP BY
indrelid
,indkey
HAVING COUNT(*) > 1;





