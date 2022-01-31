--PostgreSQL String() Function - Exercises

-- 1. Write a query to get the job_id and the ID(s) for those employees
--    who is working in that post.


select * from emp;

select job_id,array_agg(emp_id) from emp group by job_id; 

-- 2. Write a query to update the phone_number column with '999' where the 
-- substring '124' found in that column.


alter table emp rename column phoen_number to phone_number;

-- set all the phone number have 10 length
update emp set phone_number = replace(phone_number,' ','');


update emp set phone_number = replace(phone_number,'045','999')
where phone_number like '%045%';


select * from emp;

-- 3. Write a query to find the details of those employees who contain
--    eight or more characters in their first name.

select * from emp e where character_length(e.first_name)>=8; 



-- 5. Write a query to join the text '@example.com' with the email column.

select first_name||'@example.com' "Email_Example" from emp;

-- OR
--update emp set email=first_name||'@example.com';

-- 6. Write a query to get the employee id, first name and hire month of an 
-- employee.

select emp_id,first_name,extract( month from hire_date) "Month" from emp;


-- 7. Write a query to get the employee id, email id to discard the last three 
-- characters.

select emp_id,reverse(substring(reverse(email),4)) from emp;


select substring('Bibek',3); 
select email from emp;

-- 8. Write a query to find all the employees which first name contains 
-- all the uppercase letter.

select * from emp;

select 'BIBEK'=='BIBEK'; -- return true 

select first_name from emp where first_name =upper(first_name); 


-- 9. Write a query to extract the last four character of phone numbers.

select phone_number,substring(phone_number,7) "last 4 digit" from emp;


-- 10. Write a query to get the information about those locations which 
-- contain the characters in its street address is on and below the minimum 
-- character length of street_address.

select * from location ;

select * from location where character_length(street_address)<=
(select min(character_length(street_address)) from location);


-- 11. Write a query to display the first character in the job title if the job 
-- title contains more than two character.

select * from jobs;

insert into jobs values(3,'Accountent',16000);

select job_title,substring(job_title,1,1) "First Character of Job" from jobs where length(job_title)>2;


-- 12. Write a query to display the first name, last name for the employees,
-- which contain a letter 'C' to their last name at 3rd or greater position.

select * from emp;


select first_name,last_name from emp where last_name like '___e%' OR 
last_name like '__e%';
 
-- OR 
select position('b' in 'BiBek');


select first_name,last_name from emp where position('e' in last_name) > 2;


-- 13. Write a query that displays the first name and the length of the first 
-- name for all employees whose name starts with the letters 'A', 'J' or 'M'. 
-- Give each column an appropriate label. Sort the results by the employees' 
-- first names.


select first_name,length(first_name) " Len of First Name" from emp
where substring(first_name,1,1) in ('A','J','M') order by first_name; 

-- OR

SELECT first_name "Name",
LENGTH(first_name) "Length"
FROM emp
WHERE first_name LIKE 'J%'
OR first_name LIKE 'M%'
OR first_name LIKE 'A%'
ORDER BY first_name ;

-- 14. Write a query to display the first name and salary for all employees. 
-- Form the salary to be 10 characters long, left-padded with the $ symbol. Label 
-- the column as SALARY.

SELECT first_name,
LPAD(TRIM(TO_CHAR(salary,'9999999')), 7, '$') SALARY 
FROM emp;











