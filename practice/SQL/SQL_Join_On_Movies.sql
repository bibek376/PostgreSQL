--SQL Exercises, Practice, Solution - JOINS exercises on movie Database



--1. From the following tables, write a SQL query to find the name of all 
--reviewers who have rated their ratings with a NULL value. Return reviewer name. 

select r.rev_name from reviewer r 
inner join rating r2 
on r.rev_id =r2.rev_id 
where r2.rev_stars is null;

--2. From the following tables, write a SQL query to 
--find the actors who were cast in the movie 'Annie Hall'. 
--Return actor first name, last name and role.

select a.act_fname ,a.act_lname ,mc.role
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id
inner join actor a
on a.act_id =mc.act_id 
where m.mov_title ='Annie Hall';


--3. From the following tables, write a SQL query to find the director
--who directed a movie that casted a role for 'Eyes Wide Shut'.
--Return director first name, last name and movie title. 


select m.mov_title,d.dir_fname,d.dir_lname 
from movie m
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
where  m.mov_title ='Eyes Wide Shut';


--4. From the following tables, write a SQL query to find who directed a movie 
--that casted a role as ‘Sean Maguire’. Return director 
--first name, last name and movie title.


select * from movie_cast mc 
where mc.role='Sean Maguire';



select m.mov_title,d.dir_fname,d.dir_lname 
from movie m
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
where mc.role='Sean Maguire';


--5. From the following tables, write a SQL query to find the actors 
--who have not acted in any movie between1990 and 2000 
--(Begin and end values are included.). Return actor first name, 
--last name, movie title and release year

select m.mov_title ,m.mov_year ,a.act_fname ,a.act_lname 
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
where m.mov_year not between 1990 and 2000;


--6. From the following tables, write a SQL query to find the directors 
--with number of genres movies. Group the result set on director first name,
--last name and generic title. Sort the result-set in ascending order by director
--first name and last name. Return director first name, last name and number of 
--genres movies. 



select d.dir_fname,d.dir_lname,g.gen_title ,count(g.gen_title) from movie m 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
inner join movie_genres mg 
on mg.mov_id =m.mov_id 
inner join genres g 
on g.gen_id =mg.gen_id 
group by d.dir_fname ,d.dir_lname,g.gen_title 
order by 1,2;

--OR 
SELECT dir_fname,dir_lname, gen_title,count(gen_title)
FROM director
NATURAL JOIN movie_direction
NATURAL JOIN movie_genres
NATURAL JOIN genres
GROUP BY dir_fname, dir_lname,gen_title
ORDER BY dir_fname,dir_lname;

--7. From the following table, write a SQL query to find the movies with year
--and genres. Return movie title, movie year and generic title.


select m.mov_title,m.mov_year,g.gen_title 
from movie m 
inner join movie_genres mg 
on mg.mov_id =m.mov_id 
inner join genres g 
on g.gen_id =mg.gen_id ;



--8. From the following tables, write a SQL query to find all the movies with year,
--genres, and name of the director.


select m.mov_title,m.mov_year,g.gen_title ,d.dir_fname,d.dir_lname 
from movie m 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
inner join movie_genres mg 
on mg.mov_id =m.mov_id 
inner join genres g 
on g.gen_id=mg.gen_id 
order by 1;

--9. From the following tables, write a SQL query to find the movies released
--before 1st January 1989. Sort the result-set in descending order by date of 
--release. Return movie title, release year, date of release, duration, and
--first and last name of the director.


select m.mov_title,m.mov_year,m.mov_dt_rel,m.mov_time,d.dir_fname,d.dir_lname 
from movie m 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
where m.mov_dt_rel < '1989-01-01'
order by 3 desc ;


--10. From the following tables, write a SQL query to compute the average
--time and count number of movies for each genre. Return genre title, 
--average time and number of movies for each genre. 


select g.gen_title,round(avg(m.mov_time),2),count(*) from movie m 
inner join movie_genres mg 
on m.mov_id =mg.mov_id 
inner join genres g 
on g.gen_id =mg.gen_id 
group by g.gen_title ;


--11. From the following tables, write a SQL query to find movies with 
--the lowest duration. Return movie title, movie year, director first name, 
--last name, actor first name, last name and role. 


select m.mov_title,m.mov_year,d.dir_fname,d.dir_lname,a.act_fname,a.act_lname,mc.role
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id
where m.mov_time=(select min(m2.mov_time) from movie m2); 

--12. From the following tables, write a SQL query to find those years 
--when a movie received a rating of 3 or 4. Sort the result in increasing 
--order on movie year. Return move year. 

select distinct m.mov_year from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
where r.rev_stars in (3,4)
order by 1;


--13. From the following tables, write a SQL query to get the reviewer
--name, movie title, and stars in an order that reviewer name will come 
--first, then by movie title, and lastly by number of stars.


select r2.rev_name,m.mov_title,r.rev_stars 
from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
inner join reviewer r2 
on r2.rev_id =r.rev_id 
where r2.rev_name is not null;


--14. From the following tables, write a SQL query to find those movies
--that have at least one rating and received highest number of stars. 
--Sort the result-set on movie title. Return movie title and maximum review stars. 

select m.mov_title,max(r.rev_stars)
from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
where r.rev_stars is not null
group by m.mov_title 
order by 1;


--15. From the following tables, write a SQL query to find those movies,
--which have received ratings. Return movie title, director first name, 
--director last name and review stars.


select m.mov_title,d.dir_fname,d.dir_lname,r.rev_stars 
from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id
where r.rev_stars is not null;

--
--16. Write a query in SQL to find the movie title, actor first and last name,
--and the role for those movies where one or more actors acted in two or more movies

select m.mov_title,a.act_fname,a.act_lname,mc.role
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
where a.act_id in (select mc2.act_id 
				   from movie_cast mc2
				   group by mc2.act_id
				   having count(*)>=2);


--17. From the following tables, write a SQL query to find the actor whose 
--first name is 'Claire' and last name is 'Danes'. Return director first name, 
--last name, movie title, actor first name and last name, role.
				  
				  

select d.dir_fname,d.dir_lname,m.mov_title,a.act_fname,a.act_lname,mc.role
from movie m 
inner join movie_cast mc 
on m.mov_id =mc.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on md.dir_id =d.dir_id
where a.act_fname ='Claire' and a.act_lname='Danes'; 


--18. From the following tables, write a SQL query to find those actors who 
--have directed their movies. Return actor first name, last name, movie title and role.


select a.act_fname,a.act_lname,m.mov_title,mc.role
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
where a.act_fname =d.dir_fname and a.act_lname =d.dir_lname ;


--19. From the following tables, write a SQL query to find the cast list of the
--movie ‘Chinatown’. Return first name, last name.
select a.act_fname,a.act_lname 
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
where m.mov_title ='Chinatown';


--20. From the following tables, write a SQL query to find those movies 
--where actor’s first name is 'Harrison' and last name is 'Ford'. Return movie title.
select m.mov_title 
from movie m 
inner join movie_cast mc 
on mc.mov_id =m.mov_id 
inner join actor a 
on a.act_id =mc.act_id
where a.act_fname='Harrison' and a.act_lname='Ford'; 

--21. From the following tables, write a SQL query to find the highest-rated 
--movies. Return movie title, movie year, review stars and releasing country.

select m.mov_title,m.mov_year,r.rev_stars,m.mov_rel_country 
from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
where r.rev_stars = (select max(r2.rev_stars) from rating r2);



--22. From the following tables, write a SQL query to find the highest-rated 
--‘Mystery Movies’. Return the title, year, and rating. 

select m.mov_title,m.mov_year,r.rev_stars 
from movie m 
inner join movie_genres mg 
on mg.mov_id =m.mov_id 
inner join rating r 
on m.mov_id =r.mov_id 
inner join genres g 
on g.gen_id=mg.gen_id 
where (g.gen_title,r.rev_stars )=(select g.gen_title,max(r.rev_stars) 
								from rating r 
								inner join movie_genres mg 
								on r.mov_id =mg.mov_id 
								inner join genres g 
								on g.gen_id =mg.gen_id 
								where g.gen_title ='Mystery'
								group by g.gen_title );
--OR 

SELECT mov_title, mov_year, rev_stars
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres 
NATURAL JOIN rating
WHERE gen_title = 'Mystery' AND rev_stars >= ALL (
SELECT rev_stars
FROM rating 
NATURAL JOIN movie_genres 
NATURAL JOIN genres
WHERE gen_title = 'Mystery');


--23. From the following tables, write a SQL query to find the 
--years when most of the ‘Mystery Movies’ produced. Count the number of 
--generic title and compute their average rating. Group the result set on 
--movie release year, generic title. Return movie year, generic title, number 
--of generic title and average rating. 


select m.mov_year,g.gen_title,count(g.gen_title) "Numer Of Movies",avg(r.rev_stars) 
from movie m 
inner join movie_genres mg 
on mg.mov_id =m.mov_id 
inner join rating r 
on m.mov_id =r.mov_id 
inner join genres g 
on g.gen_id=mg.gen_id 
where g.gen_title ='Mystery'
group by m.mov_year,g.gen_title ;


--24. From the following tables, write a query in SQL to generate a report,
--which contain the fields movie title, name of the female actor, year of the movie, 
--role, movie genres, the director, date of release, and rating of that movie. 

select m.mov_title,a.act_fname,a.act_lname ,m.mov_year,mc.role,g.gen_title,d.dir_fname, 
d.dir_lname ,m.mov_dt_rel,r.rev_stars 
from movie m 
inner join movie_cast mc 
on m.mov_id =mc.mov_id 
inner join actor a 
on a.act_id =mc.act_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
inner join rating r 
on r.mov_id =m.mov_id 
inner join movie_genres mg 
on mg.mov_id =r.mov_id 
inner join genres g 
on g.gen_id =mg.gen_id 
where a.act_gender ='F';


















































































