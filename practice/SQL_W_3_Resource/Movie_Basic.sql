--SQL Exercises, Practice, Solution - exercises on movie Database

--SQL Exercises, Practice, Solution - BASIC exercises on movie Database

--
--1. From the following table, write a SQL query to find the name and year 
--of the movies. Return movie title, movie release year.


select mov_title ,mov_year from movie;
--
--2. From the following table, write a SQL query to find when the movie ‘American Beauty’
--released. Return movie release year. 

select m.mov_year from movie m 
where mov_title ='American Beauty';
--
--3. From the following table, write a SQL query to find the movie,
--which was made in the year 1999. Return movie title. 
select m.mov_title from movie m 
where m.mov_year ='1999';

--
--4. From the following table, write a SQL query to find those movies, 
--which was made before 1998. Return movie title. 

select m.mov_title from movie m
where m.mov_year < 1998;

--
--5. From the following tables, write a SQL query to find the name 
--of all reviewers and movies together in a single list. 
select m.mov_title from movie m 
union
(select r.rev_name from reviewer r);

--
--6. From the following tables, write a SQL query to find all reviewers who 
--have rated 7 or more stars to their rating. Return reviewer name. 
select * from reviewer r1 ;
select * from rating r2 ;

-- Method 1
select distinct r1.rev_name from reviewer r1
inner join rating r2
on r1.rev_id =r2.rev_id 
where r2.rev_stars >=7
and r1.rev_name is not null
order by 1;

-- Method 2

select r.rev_name from reviewer r
where r.rev_id = any (select  rev_id from rating r1
				where r1.rev_stars >=7 )
and r.rev_name is not null
order by 1;


-- Method 3

SELECT DISTINCT rev_name 
FROM reviewer
LEFT JOIN rating
ON reviewer.rev_id = rating.rev_id
WHERE rating.rev_stars >= 7 AND reviewer.rev_name IS NOT null order by 1;

--
--7. From the following tables, write a SQL query to find the movies without
--any rating. Return movie title.

select * from movie m ;
select * from rating r ;

select mov_title from movie m 
where mov_id in (select mov_id 
				from rating r 
				where num_o_ratings is null);

select m.mov_title  from rating r 
left join movie m 
on r.mov_id =m.mov_id 
where r.num_o_ratings is null;


--8. From the following table, write a SQL query to find the movies with 
--ID 905 or 907 or 917. Return movie title.
select m.mov_title 
from movie m 
where m.mov_id in (905,907,917);


--9. From the following table, write a SQL query to find those movie titles,
--which include the words 'Boogie Nights'. Sort the result-set in
--ascending order by movie year. Return movie ID, movie title and movie release year.

select m.mov_id,m.mov_title,m.mov_year 
from movie m 
where m.mov_title ='Boogie Nights';


--10. From the following table, write a SQL query to find those actors
--whose first name is 'Woody' and the last name is 'Allen'. Return actor ID
select a.act_id 
from actor a 
where a.act_fname ='Woody' and a.act_lname ='Allen';


















