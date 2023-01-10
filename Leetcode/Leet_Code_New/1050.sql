--1050. Actors and Directors Who Cooperated At Least Three Times

SELECT actor_id,director_id
FROM actor_director_1050
GROUP BY actor_id,director_id
HAVING COUNT(1)>=3;
