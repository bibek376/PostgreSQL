
--SQL exercises on soccer Database: Basic - Exercises, Practice, Solution
--
--1. From the following table, write a SQL query to count the number of
--venues for EURO cup 2016. Return number of venues.


select count(*) from soccer_venue sv ;

--2. From the following table, write a SQL query to count the number 
--of countries participated in the EURO cup 2016.

select count(distinct pm.team_id )from player_mast pm ;

--3. From the following table, write a SQL query to find the number of
--goals scored in EURO cup 2016 within normal play schedule

select count(*) from goal_details gd;

--4. From the following table, write a SQL query to find the 
--number of matches ended with a result.
select count(*) from match_mast mm 
where mm.results ='WIN'

--5. From the following table, write a SQL query to find the number
--of matches ended with draws. 

select count(*) from match_mast mm 
where mm.results !='WIN'


--6. From the following table, write a SQL query to find
--the date when Football EURO cup 2016 begins.

select min(mm.play_date) from match_mast mm ;


--7. From the following table, write a SQL query to find the number
--of self-goals scored in EURO cup 2016

select count(*) from goal_details gd 
where gd.goal_type='O'; 

--8. From the following table, write a SQL query to count the
--number of matches ended with a results in-group stage
select count(*) from match_mast mm 
where mm.play_stage ='G'
and mm.results='WIN'; 

--9. From the following table, write a SQL query to find 
--the number of matches got a result by penalty shootout. 

select count(distinct ps.match_no) from penalty_shootout ps ;


--10. From the following table, write a SQL query to find the number 
--of matches decided by penalties in the Round 16.

select count(*) from match_mast mm 
where mm.play_stage ='R' and mm.decided_by ='P';

--11. From the following table, write a SQL query to find the 
--number of goal scored in every match within normal play schedule.
--Sort the result-set on match number. Return match number, number of goal scored. 

select gd.match_no,count(*) 
from goal_details gd 
group by gd.match_no 
order by 1;

--12. From the following table, write a SQL query to find those matches 
--where no stoppage time added in the first half of play. Return match no,
--date of play, and goal scored. 
select mm.match_no,mm.play_date,mm.goal_score 
from match_mast mm 
where mm.stop1_sec =0;

--
--13. From the following table, write a SQL query to count the number 
--of matches ending with a goalless draw in-group stage of play. Return number of matches. 

select count( distinct md.match_no) from match_details md 
where md.play_stage='G'
and md.goal_score=0 and md.win_lose='D'; 


--14. From the following table, write a SQL query to count the 
--number of matches ending with only one goal win, except those matches, 
--which was decided by penalty shoot-out. Return number of matches.

select count(distinct md.match_no)  from match_details md 
where md.goal_score =1
and md.win_lose='W'
and decided_by not in ('P');


--15. From the following table, write a SQL query to count the number of 
--players replaced in the tournament. Return number of players as "Player Replaced".
select count(*) "Player Replaced" from player_in_out pio
where pio.in_out ='I';


--16. From the following table, write a SQL query to count the total 
--number of players replaced within normal time of play. Return number 
--of players as "Player Replaced"
select count(*) "Player Replaced" from player_in_out pio
where pio.in_out='I'
and pio.play_schedule='NT'; 


--17. From the following table, write a SQL query to count the number
--of players replaced in the stoppage time. Return number of players as "Player Replaced".

select count(*) "Player Replaced" from player_in_out pio
where pio.in_out='I'
and pio.play_schedule='ST'; 


--18. From the following table, write a SQL query to count the total number
--of players replaced in the first half of play. Return number of players
--as "Player Replaced". 
select count(*) "Player Replaced" from player_in_out pio
where pio.in_out ='I'
and pio.play_half =1;


--19. From the following table, write a SQL query to count the total 
--number of goalless draws have there in the entire tournament. 
--Return number of goalless draws.

select count(distinct md.match_no) from match_details md 
where md.win_lose ='D'
and md.goal_score=0; 

--20. From the following table, write a SQL query to count the total 
--number of players replaced in the extra time of play
select count(*) from player_in_out pio
where pio.in_out='I'
and pio.play_schedule='ST'; 


--21. From the following table, write a SQL query to count the number 
--of substitute happened in various stage of play for the entire Tournament.
--Sort the result-set in ascending order by play-half, play-schedule and 
--number of substitute happened. Return play-half, play-schedule, number 
--of substitute happened. 
select pio.play_half,pio.play_schedule,count(*) 
from player_in_out pio 
where pio.in_out='I'
group by pio.play_schedule,pio.play_half 
order by 1,2,3;


--22. From the following table, write a SQL query to count the number
--of shots taken in penalty shootout matches. Number of shots as "Number of Penalty Kicks". 
select count(*) from penalty_shootout ps ;

--23. From the following table, write a SQL query to count the number of 
--shots scored goal in penalty shootout matches. Return number of shots 
--scored goal as "Goal Scored by Penalty Kicks".
select count(*) from penalty_shootout ps 
where ps.score_goal='Y'; 

--24. From the following table, write a SQL query to count the 
--number of shots missed or saved in penalty shootout matches. 
--Return number of shots missed as "Goal missed or saved by Penalty Kicks".
select count(*) from penalty_shootout ps 
where ps.score_goal='N'; 
--
--25. From the following tables, write a SQL query 
--to find the players with shot number they taken in penalty shootout matches.
--Return match_no, Team, player_name, jersey_no, score_goal, kick_no.
select ps.match_no,sc.country_name "Team",pm.player_name,pm.jersey_no,ps.score_goal,ps.kick_no 
from player_mast pm 
inner join penalty_shootout ps 
on pm.team_id=ps.team_id
inner join soccer_country sc 
on sc.country_id=pm.team_id ;


--26. From the following tables, write a SQL query to count the number of 
--penalty shots taken by the teams. Return country name, 
--number of shots as "Number of Shots".


select sc.country_name,count(*) from soccer_country sc 
inner join penalty_shootout ps
on sc.country_id=ps.team_id 
group by sc.country_name ;


--27. From the following table, write a SQL query to count the number 
--of booking happened in each half of play within normal play schedule.
--Return play_half, play_schedule, number of booking happened.

select pb.play_half,pb.play_schedule,count(*) 
from player_booked pb
where pb.play_schedule='NT' 
group by pb.play_half,pb.play_schedule ;

--28. From the following table, write a SQL query to count the 
--number of booking happened in stoppage time.
select count(*) from player_booked pb
where pb.play_schedule='ST';

--
--29. From the following table, write a SQL query to count the number
--of booking happened in extra time. 
select count(*) from player_booked pb 
where pb.play_schedule ='ET';
