--SQL Exercises, Practice, Solution - SUBQUERIES exercises on movie Database

--
--1. From the following table, write a SQL query to find 
--the actors who played a role in the movie 'Annie Hall'. 
--Return all the fields of actor table.

select * from movie m ;
select * from movie_cast mc ;
select * from actor a ;


select * 
from actor a 
where a.act_id =(select mc.act_id 
				from movie_cast mc 
				where mc.mov_id = (select m.mov_id 
			  					   from movie m
			  					   where m.mov_title='Annie Hall'));

--2. From the following tables, write a SQL query to find the director
--who directed a movie that casted a role for 'Eyes Wide Shut'. Return 
--director first name, last name.
select * from director d ;
select * from movie_direction md ;
select * from movie_cast mc ;
select * from movie m ;
			  					  
select d.dir_fname ,d.dir_lname 
from director d 
where d.dir_id =(select md.dir_id 
				from movie_direction md 
				where md.mov_id =(select m.mov_id 
								  from movie m
				 				  where m.mov_title='Eyes Wide Shut'));

--
--3. From the following table, write a SQL query to find those 
--movies, which released in the country besides UK.
--Return movie title, movie year, movie time, date of release, releasing country. 
select * from movie m;				 				 
				 				 
select m.mov_title ,m.mov_year ,m.mov_time ,m.mov_dt_rel ,m.mov_rel_country 
from movie m
where m.mov_rel_country !='UK';
			  					  
--4. From the following tables, write a SQL query to 
--find those movies where reviewer is unknown. 
--Return movie title, year, release date, director first name, 
--last name, actor first name, last name.			  			

select * from actor a ;
select * from director d ;
select * from movie m ;
select * from reviewer r1 ;
select * from rating r2;

select m.mov_title,m.mov_year ,m.mov_dt_rel,d.dir_fname ,d.dir_lname,a.act_fname ,a.act_lname 
from reviewer r1 
inner join rating r2
on r1.rev_id =r2.rev_id 
inner join movie m 
on m.mov_id =r2.mov_id
inner join movie_cast mc 
on mc.mov_id =m.mov_id
inner join actor a 
on mc.act_id =a.act_id 
inner join movie_direction md 
on md.mov_id =m.mov_id 
inner join director d 
on d.dir_id =md.dir_id 
where r1.rev_name is null;

--
--5. From the following tables, write a SQL query to find those movies directed
--by the director whose first name is ‘Woddy’ and last name is ‘Allen’. Return movie title.

select * from movie m ;
select * from director d ;
select * from movie_direction md ;


select d.dir_id from director d 
where trim(lower(d.dir_fname)) ='woody' and trim(lower(d.dir_lname)) ='allen';

select m.mov_title
from movie m
where m.mov_id =(select md.mov_id 
				from movie_direction md 
				where dir_id =(select d.dir_id 
			   				  from director d 
			   				  where trim(lower(d.dir_fname)) ='woody' 
			   				  and trim(lower(d.dir_lname)) ='allen'));


--6. From the following tables, write a SQL query to find those
--years, which produced at least one movie and that,
--received a rating of more than three stars. Sort the 
--result-set in ascending order by movie year. Return movie year. 

select * from movie m ;
select * from rating r ;
			  					  
select distinct m.mov_year from movie m 
where m.mov_id =any(select r.mov_id 
					from rating r 
					where r.rev_stars > 3)
order by 1;

--
--7. From the following table, write a SQL query to find those movies, 
--which have no ratings. Return movie title
--			  					  

select m.mov_title from movie m 
where m.mov_id =any(select r.mov_id 
					from rating r 
					where r.rev_stars is null);
			  					  
--8. From the following tables, write a SQL query to find those reviewers who have
--rated nothing for some movies. Return reviewer name.
--			  					  

				
select r2.rev_name from reviewer r2 
where r2.rev_id in (select r.rev_id 
					from rating r
					where r.rev_stars is null);

			  					  
			  					  
--9. From the following tables, write a SQL query to find those movies, which reviewed by a 
--reviewer and got a rating. Sort the result-set in ascending order by 
--reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.

				
select r.rev_name,m.mov_title,r2.rev_stars 
from reviewer r 
inner join rating r2 
on r.rev_id =r2.rev_id 
inner join movie m 
on m.mov_id =r2.mov_id 
where r2.rev_stars is not null and r.rev_name is not null
order by 1,2,3;
				
--OR

SELECT rev_name, mov_title, rev_stars 
 FROM reviewer, rating, movie 
  WHERE reviewer.rev_id=rating.rev_id 
   AND movie.mov_id=rating.mov_id 
     AND reviewer.rev_name IS NOT NULL 
       AND rating.rev_stars IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;
				
				
--10. From the following tables, write a SQL query to find those reviewers who 
--rated more than one movie. Group the result set on reviewer’s name, 
--movie title. Return reviewer’s name, movie title				
				
SELECT rev_name, mov_title 
FROM reviewer, movie, rating, rating r2
WHERE rating.mov_id=movie.mov_id 
  AND reviewer.rev_id=rating.rev_ID 
    AND rating.rev_id = r2.rev_id 
GROUP BY rev_name, mov_title HAVING count(*) > 1;
				
--11. From the following tables, write a SQL query to find those movies,
--which have received highest number of stars. Group the result set on movie
--title and sorts the result-set in ascending order by movie title.
--Return movie title and maximum number of review stars.

select * from rating r3 ;
select * from movie m2 ;

select m.mov_title,max(r.rev_stars) 
from movie m 
inner join rating r 
on r.mov_id =m.mov_id 
where r.rev_stars is not null
group by m.mov_title 
order by 1;


--12. From the following tables, write a SQL query to find all reviewers 
--who rated the movie 'American Beauty'. Return reviewer name. 


select r2.rev_name 
from movie m
inner join rating r 
on m.mov_id =r.mov_id
inner join reviewer r2 
on r2.rev_id =r.rev_id 
where m.mov_title ='American Beauty';

--
--13. From the following tables, write a SQL query to find the movies,
--which have reviewed by any reviewer body except by 'Paul Monks'. Return movie title.

select m.mov_title from movie m 
where m.mov_id =any (select r.mov_id 
				 from rating r 
				 where r.rev_id not in  (select r.rev_id 
				 				  from reviewer r
								  where rev_name ='Paul Monks'));
																

--14. From the following tables, write a SQL query to find the lowest rated 
--movies. Return reviewer name, movie title, and number of stars for those movies.
								 
select r2.rev_name,m.mov_title,r.rev_stars
from rating r 
inner join reviewer r2 
on r.rev_id =r2.rev_id
inner join movie m 
on m.mov_id =r.mov_id 
where r.rev_stars =(select min(r3.rev_stars) 
					from rating r3 );
				
				
--15. From the following tables, write a SQL query to find the 
--movies directed by 'James Cameron'. Return movie title. 				


select * from director d 
where d.dir_fname ='James';


select m.mov_title 
from movie m
where m.mov_id =any (select md.mov_id 
					 from movie_direction md
					 where md.dir_id =(select d.dir_id
				  					   from director d
				  					   where d.dir_fname='James' and d.dir_lname='Cameron'));













				
				