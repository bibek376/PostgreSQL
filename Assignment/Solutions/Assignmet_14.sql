
--Assignment - 14

--1.Create user test and grant permission to crud on employees table of hr database.

-- create role test login;
--hr=# grant select,insert, update, delete on employees to test;

--hr=# revoke all privileges on test from employees;

-----------------------------------------------------------------------------------


--2. prepare well document about the backup and restore in PostgreSQL database 
--		1. Physical backup 
--		2. Logical backup 


--A backup is a copy of data from your database that can be used
--to reconstruct that data. Backups are backups of the physical
--files used in storing and recovering your databases, such as datafiles,
--control files, and others. Every physical backup is a copy of files storing 
--database information to some other location, whether on disk or some 
--offline storage such as tape.

--Benefits of backup:
--
--With valid backups of a database, you can recover your 
--data from many failures, such as :
--
--Media failure : A media failure is the failure of a read or 
--				write of a disk file required to run the database, due to a 
--				physical problem with the disk such as a head crash.
--Hardware failures: for example, a damaged disk drive.
--User errors		: for example, dropping a table by mistake.
--Natural disasters

--The PostgreSQL server backup and restore component provide an 
--essential safeguard for protecting critical data stored in server 
--databases. To minimize the risk of data loss, you need to back up your 
--databases to preserve modifications to your data on a regular basis. 
--A well-planned backup and restore strategy helps protect databases against 
--data loss. Test your strategy by restoring a set of backups and then 
--recovering your database.


--Backup a PostgreSQL Database
--
--pg_dump is a utility for backing up a PostgreSQL database.
--It makes consistent backups even if the database is being used concurrently.
--pg_dump does not block other users accessing the database (readers or writers).
--
--You can use the pg_dump command line program, or you can use phpPgAdmin 
--to backup a PostgreSQL database to a file.
--
--Access the command line on the computer where the database is stored. 
--If you have physical access to the computer, you can open a DOS or terminal 
--window to access the command line.
--
--Type the following command, and then press ENTER. Replace USERNAME 
--with your username, and DBNAME with the name of the database that you
--want to export:

--Syntax For Backup:

--pg_dump -U <user_name> <database_name>  >  backup_file_name.sql


--Syntax For Restore :
--
--pg_dump -U username database_name < filepath\backup.sql
--psql  -U postgres -d <hr_restore>   <   backup_file_name.sql


--i. Physical Backup
--
--Physical backup is a copy of an application’s binary files 
--that is performed on hard drive level using common file system queries, 
--rather than using the application’s interfaces designed to export its data. 
--For example, Windows registry can be exported in two ways: using regedit, 
--which is a built-in client designed for administering system registry, or 
--by direct copying of the respective files from the Windows folder. 
--The first case is logical backup, because the data is retrieved via API 
--provided by Microsoft, and the latter is physical backup.

--ii. Logical Backup
--A logical backup copies data, but not physical files, from one location to another.
--A logical backup is used to move or archive a database, tables, 
--or schemas and to verify database structures.
--
--A full logical backup enables you to copy these items across 
--environments that use different components, such as operating systems:
--
--Entire applications
--
--Data repositories such as the Oracle Hyperion Shared Services 
--Registry and Oracle Essbase cubes
--
--Individual artifacts such as scripts, data forms, and rule files
--
--A logical export backup generates necessary Structured Query Language (SQL)
--statements to obtain all table data that is written to a binary file. 
--A logical export backup does not contain database instance-related information, 
--such as the physical disk location, so you can restore the same data on another 
--database machine. Periodic logical export backups (at least weekly) are 
--recommended in case physical backups fail or the database machine becomes 
--unavailable.

------------------------------------------------------------------------------------

--4. write the advantage and disadvantage of full backup and incremental backup

Advantage and Disadvantage of Full Backups


Advantage:
	i.provides the best protection in terms of data recovery
	ii.fast recovery of data in a single backup set

	
Disadvantage:

	i.backup is time-consuming
	ii.requires more storage space
	iii.uses up a lot of bandwidth




Pros and Cons of Incremental Backups

PROS:
	i.smaller backups that take up less storage space
	ii.faster to backup
	iii.uses less bandwidth
	
CONS:
	i.time-consuming to recover
	ii.risk of failed recovery if there is damage to a segment in the backup chain


-------------------------------------------------------------------------------------
--3. how to setup Incremental backup in PostgreSQL. 
--Guidelines for hint:
--1. Firstly must be completed full backup 
--2. incrementally backup 
	
--Dump levels
--  0  - 9
--  0----->full backup
--  1-9---->Incremental Backup	
	
pg_dump -U postgres -h localhost hr > /home/bibek/Desktop/hr_backup.sql
















