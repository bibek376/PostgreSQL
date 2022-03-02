
--SQL Join Exercises, Practice, Solution - JOINS exercises on soccer Database


--1. From the following tables, write a SQL query to find the venue where
--EURO cup 2016 final match held. Return venue name, city.


select * from soccer_venue sv ;
select * from soccer_city sc ;
select * from match_mast mm ;

select sv.venue_name,sc.city 
from soccer_city sc 
inner join soccer_venue sv 
on sv.city_id =sc.city_id 
inner join match_mast mm 
on mm.venue_id=sv.venue_id 
where mm.play_stage='F'; 


--2. From the following tables, write a SQL query to find 
--the number of goal scored by each team in every match within 
--normal play schedule. Return match number, country name and goal score.
select md.match_no,sc.country_name ,md.goal_score 
from match_details md 
inner join soccer_country sc 
on sc.country_id = md.team_id ;


--3. From the following tables, write a SQL query to count the
--number of goals scored by each player within normal play schedule.
--Group the result set on player name and country name and sorts the 
--result-set according to the highest to the lowest scorer. Return player
--name, number of goals and country name.
select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;


select pm.player_name,sc.country_name ,count(*)
from goal_details gd 
inner join soccer_country sc 
on sc.country_id =gd.team_id
inner join player_mast pm 
on pm.team_id =sc.country_id and pm.player_id =gd.player_id
where gd.goal_schedule ='NT' 
group by pm.player_name,sc.country_name 
order by 3 desc ;


--4. From the following tables, write a SQL query to find the highest 
--individual scorer in EURO cup 2016. Return player name, country name and 
--highest individual scorer. 

select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;


select pm.player_name,sc.country_name,count(*) 
from player_mast pm 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
inner join goal_details gd 
on gd.player_id =pm.player_id and gd.team_id =sc.country_id 
group by pm.player_name,sc.country_name
having count(*)=(select max(tt.count) from (select pm.player_name,sc.country_name,count(*) 
					from player_mast pm 
					inner join soccer_country sc 
					on sc.country_id =pm.team_id 
					inner join goal_details gd 
					on gd.player_id =pm.player_id and gd.team_id =sc.country_id 
					group by pm.player_name,sc.country_name)tt );

--OR
				
SELECT player_name,country_name,count(player_name)
FROM goal_details gd
JOIN player_mast pm ON gd.player_id =pm.player_id
JOIN soccer_country sc ON pm.team_id = sc.country_id
GROUP BY country_name,player_name HAVING COUNT(player_name) >= ALL
(SELECT COUNT(player_name)
   FROM goal_details gd
   JOIN player_mast pm ON gd.player_id =pm.player_id
   JOIN soccer_country sc ON pm.team_id = sc.country_id
   GROUP BY country_name,player_name);


--5. From the following tables, write a SQL query to find the scorer
--in the final of EURO cup 2016. Return player name, jersey number and country name.

select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;

select pm.player_name,pm.jersey_no,sc.country_name 
from goal_details gd 
inner join soccer_country sc 
on sc.country_id =gd.team_id 
inner join player_mast pm 
on pm.player_id =gd.player_id
where gd.play_stage='F';


--6. From the following tables, write a SQL query to find the country
--where Football EURO cup 2016 held. Return country name. 
select distinct sc.country_name
from soccer_country sc
inner join soccer_city sc1 
on sc.country_id =sc1.country_id 
inner join soccer_venue sv 
on sv.city_id =sc1.city_id ;


--7. From the following tables, write a SQL query to find the player who 
--scored first goal of EURO cup 2016. Return player_name, jersey_no, country_name,
--goal_time, play_stage, goal_schedule, goal_half.




select pm.player_name,pm.jersey_no,sc.country_name,
gd.goal_time,gd.play_stage,gd.goal_schedule,gd.goal_half 
from soccer_country sc 
inner join player_mast pm 
on sc.country_id =pm.team_id 
inner join goal_details gd 
on gd.player_id =pm.player_id 
where gd.match_no =1
and gd.goal_time=(select  min(gd.goal_time) from goal_details gd 
				 where gd.match_no=1);


--8. From the following tables, write a SQL query to find the referee 
--who managed the opening match. Return referee name, country name.
				
select rm.referee_name,sc.country_name 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id =rm.country_id 
where mm.match_no =1;

--9. From the following tables, write a SQL query to find the referee who managed 
--the final match. Return referee name, country name.

select rm.referee_name,sc.country_name 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id =rm.country_id 
where mm.match_no =(select max(mm.match_no) from match_mast mm );


--10. From the following tables, write a SQL query to find the referee 
--who assisted the referee in the opening match. Return associated referee 
--name, country name.

select arm.ass_ref_name,sc.country_name 
from asst_referee_mast arm 
inner join match_details md 
on md.ass_ref=arm.ass_ref_id
inner join soccer_country sc 
on sc.country_id =arm.country_id 
where md.match_no =1;


--11. From the following tables, write a SQL query to find the referee who 
--assisted the referee in the final match. Return associated referee name, country name.

select * from asst_referee_mast arm ;
select * from soccer_country sc ;
select * from match_details md ;

select arm.ass_ref_name,sc.country_name 
from asst_referee_mast arm 
inner join match_details md 
on md.ass_ref=arm.ass_ref_id
inner join soccer_country sc 
on sc.country_id =arm.country_id 
where md.match_no =(select max(mm.match_no) from match_mast mm );

--12. From the following tables, write a SQL query to find the city
--where the opening match of EURO cup 2016 played. Return venue name, city.

select sv.venue_name,sc.city 
from soccer_venue sv 
inner join soccer_city sc 
on sv.city_id=sc.city_id 
inner join match_mast mm 
on mm.venue_id=sv.venue_id 
where mm.match_no =1;

--13. From the following tables, write a SQL query to 
--find the stadium hosted the final match of EURO cup 2016.
--Return venue_name, city, aud_capacity, audience. 

select sv.venue_name,sc.city ,sv.aud_capacity,mm.audence 
from soccer_venue sv 
inner join soccer_city sc 
on sv.city_id=sc.city_id 
inner join match_mast mm 
on mm.venue_id=sv.venue_id 
where mm.match_no =(select max(mm.match_no) from match_mast mm );

--14. From the following tables, write a SQL query to count the number of 
--matches played in each venue. Sort the result-set on venue name. 
--Return Venue name, city, and number of matches.
select * from soccer_venue sv ;
select * from soccer_city sc ;
select * from match_mast mm ;

select sv.venue_name,sc.city,count(*)
from soccer_venue sv 
inner join soccer_city sc 
on sv.city_id=sc.city_id 
inner join match_mast mm 
on mm.venue_id=sv.venue_id 
group by sv.venue_name,sc.city
order by 1;


--15. From the following tables, write a SQL query to find the player
--who was the first player to be sent off at the tournament EURO cup 2016. 
--Return match Number, country name and player name.
select pb.match_no,sc.country_name,pm.player_name 
from player_booked pb
inner join player_mast pm 
on pm.player_id =pb.player_id 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
where pb.sent_off='Y'
and pb.match_no=(select min(tt.match_no) from  (select pb.match_no,sc.country_name,pm.player_name 
				 from player_booked pb
				 inner join player_mast pm 
				 on pm.player_id =pb.player_id 
				 inner join soccer_country sc 
				 on sc.country_id =pm.team_id 
				 where pb.sent_off='Y') tt);

--16. From the following tables, write a SQL query to find those teams that 
--scored only one goal to the tournament. Return country_name as "Team",
--team in the group, goal_for
				
select sc.country_name,st.team_group,st.goal_for 
from soccer_team st
inner join soccer_country sc 
on st.team_id =sc.country_id 
where st.goal_for=1;

--17. From the following tables, write a SQL query 
--to count the yellow cards received by each country.
--Return country name and number of yellow cards

select sc.country_name,count(*) 
from soccer_country sc 
inner join player_booked pb 
on sc.country_id =pb.team_id 
group by sc.country_name 
order by 2 desc ;


--18. From the following tables, write a SQL query to count number of goals
--that has seen. Return venue name and number of goals.
select * from soccer_country sc ;
select * from goal_details gd ;
select * from match_mast mm ;
select * from soccer_venue sv ;


select sv.venue_name,count(gd.goal_id) 
from soccer_venue sv 
inner join match_mast mm 
on sv.venue_id=mm.venue_id 
inner join goal_details gd 
on gd.match_no=mm.match_no 
inner join soccer_country sc 
on sc.country_id =gd.team_id 
group by 1
order by 2 desc;

--
--19. From the following tables, write a SQL query to find the
--match where no stoppage time added in first half of play.
--Return match number, country name.

select * from match_details md ;
select * from match_mast mm ;
select * from soccer_country sc ;

select  mm.match_no,sc.country_name 
from soccer_country sc 
inner join match_details md 
on sc.country_id =md.team_id 
inner join match_mast mm 
on mm.match_no=md.match_no 
where mm.stop1_sec=0; 


--20. From the following tables, write a SQL query to find the team(s) 
--who conceded the most goals in EURO cup 2016. Return country name, 
--team group and match played. 

select  sc.country_name,st.team_group,st.match_played
from soccer_country sc 
inner join soccer_team st 
on sc.country_id =st.team_id 
where st.goal_agnst=(select max(st.goal_agnst) from soccer_team st);

--21. From the following tables, write a SQL query to find those 
--matches where highest stoppage time added in 2nd half of play.
--Return match number, country name, stoppage time(sec.)

select * from match_details md ;
select * from match_mast mm ;
select * from soccer_country sc ;

select mm.match_no,sc.country_name,mm.stop2_sec 
from match_mast mm 
inner join match_details md 
on mm.match_no=md.match_no 
inner join soccer_country sc 
on sc.country_id=md.team_id 
where mm.stop2_sec=(select max(mm2.stop2_sec) from match_mast mm2);


--22. From the following tables, write a SQL query to find those matches
--ending with a goalless draw in-group stage of play.
--Return match number, country name

select md.match_no,sc.country_name
from match_details md 
inner join soccer_country sc 
on md.team_id=sc.country_id 
where md.play_stage='G'
and md.goal_score=0
and md.win_lose='D'; 

--23. From the following tables, write a SQL query to find those match(s)
--where the 2nd highest stoppage time had been added in the second half of play. 
--Return match number, country name and stoppage time.

select mm.match_no,sc.country_name,mm.stop2_sec 
from match_mast mm 
inner join match_details md 
on mm.match_no=md.match_no 
inner join soccer_country sc 
on sc.country_id=md.team_id 
where mm.stop2_sec=(select max(mm2.stop2_sec) 
					from match_mast mm2
					where mm2.stop2_sec not in (select max(mm2.stop2_sec) 
					from match_mast mm2));

--24. From the following tables, write a SQL query to find the number of
--matches played a player as a goalkeeper for his team.
--Return country name, player name, number of matches played as a goalkeeper.
				
select * from player_mast pm ;
select * from match_details md ;
select * from soccer_country sc ;

select sc.country_name,pm.player_name, count(*) 
from match_details md 
inner join player_mast pm 
on md.player_gk=pm.player_id 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
group by 1,2
order by 1,2 desc ;



--25. From the following tables, write a SQL query to find the venue that
--has seen the most number of goals. Return venue name, number of goals

select * from goal_details gd ;
select * from soccer_country sc ;
select * from match_mast mm ;
select * from soccer_venue sv ;

select sv.venue_name,count(*) 
from goal_details gd 
inner join match_mast mm 
on mm.match_no=gd.match_no 
inner join soccer_country sc 
on sc.country_id=gd.team_id 
inner join soccer_venue sv 
on sv.venue_id=mm.venue_id 
group by 1
having count(*)=(select max(tt.count) from (select sv.venue_name,count(*) 
				from goal_details gd 
				inner join match_mast mm 
				on mm.match_no=gd.match_no 
				inner join soccer_country sc 
				on sc.country_id=gd.team_id 
				inner join soccer_venue sv 
				on sv.venue_id=mm.venue_id 
				group by 1) tt);	

--26. From the following tables, write a SQL query to find the oldest player
--appeared in a EURO cup 2016 match. Return country name, player name,
--jersey number and age
			
select sc.country_name,pm.player_name,pm.jersey_no,pm.age 
from player_mast pm 
inner join soccer_country sc 
on sc.country_id=pm.team_id
where pm.age=(select max(age) from player_mast)  ;
			
--27. From the following tables, write a SQL query to find those two teams, 
--scored three goals in a single game in this tournament.
--Return match number and country name.

select md.match_no,sc.country_name 
from match_details md 
inner join soccer_country sc 
on sc.country_id=md.team_id 
where md.goal_score=3
and md.win_lose='D' ; 

			
--28. From the following tables, write a SQL query to find those teams that 
--finished bottom of their respective groups after conceding four times in
--three games. Return country name, team group and match played. 			
--			

select country_name, team_group
from soccer_country a
join soccer_team b on a.country_id=b.team_id
WHERE goal_agnst ='4' AND group_position ='4';
			
--29. From the following tables, write a SQL query to find those players,
--who contracted to ‘Lyon’ club and participated in the EURO cup 2016 Finals. 
--Return player name, jerseyno, position to play, age, country name. 

select * from player_mast pm ;
select * from soccer_country sc ;
select * from match_details md ;

select pm.player_name,pm.jersey_no,pm.posi_to_play,pm.age,sc.country_name 
from player_mast pm 
inner join match_details md 
on pm.team_id=md.team_id 
inner join soccer_country sc 
on sc.country_id=pm.team_id
where md.match_no=(select max(md2.match_no) from match_details md2)
and pm.playing_club='Lyon'; 
			
			
--30. From the following tables, write a SQL query to find the final 
--four teams in the tournament. Return country name.

select * from soccer_country sc ;
select * from match_details md ;

select sc.country_name 
from match_details md
inner join soccer_country sc 
on sc.country_id =md.team_id 
where md.play_stage='S'; 


--31. From the following tables, write a SQL query to find the captains
--of the top four teams that participated in the semi-finals (match 48 and 49)
--in the tournament. Return country name, player name, jersey number and position to play.

select * from soccer_country sc ;
select * from match_captain mc ;
select * from player_mast pm ;


select sc.country_name,pm.player_name,pm.jersey_no,pm.posi_to_play 
from soccer_country sc 
inner join player_mast pm 
on sc.country_id =pm.team_id 
inner join match_captain mc 
on mc.player_captain=pm.player_id 
where mc.match_no in (48,49); 


--32. From the following tables, write a SQL query to find the captains
--of all the matches in the tournament. Return match number,
--country name, player name, jersey number and position to play. 


select * from soccer_country sc ;
select * from match_captain mc ;
select * from player_mast pm ;


select mc.match_no,sc.country_name,pm.player_name,pm.jersey_no,pm.posi_to_play 
from soccer_country sc 
inner join match_captain mc 
on sc.country_id =mc.team_id 
inner join player_mast pm 
on pm.player_id=mc.player_captain ;

--33. From the following tables, write a SQL query to find the captain
--and goalkeeper of all the matches. Return match number, Captain, Goal
--Keeper and country name.
create view captain
as
select * from (select mc.match_no,sc.country_name,pm.player_name"captain"
from soccer_country sc 
inner join match_captain mc 
on sc.country_id =mc.team_id 
inner join player_mast pm 
on pm.player_id=mc.player_captain) tt


create view goal_keeper
as
select * from
(select md.match_no,sc.country_name,pm.player_name "goal_keeper"
from match_details md
inner join player_mast pm 
on pm.team_id =md.team_id 
and pm.player_id =md.player_gk 
inner join soccer_country sc
on sc.country_id =md.team_id ) ttt

select c.match_no,c.country_name,c.captain,gk.goal_keeper 
from captain c
inner join goal_keeper gk 
on c.match_no=gk.match_no and c.country_name=gk.country_name;


--OR

select match_no,country_name, player_name,jersey_no, age, 'Captain' as NAME 
from soccer_country sc 
join match_captain mc on sc.country_id=mc.team_id 
join player_mast pm on mc.player_captain=pm.player_id
union
(select match_no,country_name, player_name,jersey_no, age, 'Goal keeper' as NAME
from soccer_country sc 
join match_details md on sc.country_id=md.team_id 
join player_mast pm on md.player_gk=pm.player_id) order by 1



--34. From the following tables, write a SQL query to find the player who
--was selected for the 'Man of the Match' award in the finals of EURO
--cup 2016.Return player name, country name.

select * from soccer_country sc ;
select * from match_mast mm ;
select * from player_mast pm ;

select pm.player_name,sc.country_name 
from match_mast mm 
inner join player_mast pm 
on mm.plr_of_match=pm.player_id 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
where mm.play_stage ='F'; 


--35. From the following tables, write a SQL query to find the substitute 
--players who came into the field in the first half of play within normal
--play schedule. Return match_no, country_name, player_name, jersey_no and time_in_out.

select * from player_in_out pio ;
select * from player_mast pm ;
select * from soccer_country sc ;


select pio.match_no,sc.country_name,pm.player_name,pm.jersey_no,pio.time_in_out 
from player_in_out pio
inner join player_mast pm 
on pio.player_id=pm.player_id 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
where pio.play_half=1 and pio.play_schedule ='NT'
and pio.in_out='I';


--36. From the following table, write a SQL query to prepare a list for 
--the player of the match against each match. Return match number, play date,
--country name, player of the Match, jersey number. 
select * from match_mast mm ;
select * from player_mast pm ;
select * from soccer_country sc ;


select mm.match_no,mm.play_date,sc.country_name,mm.plr_of_match,pm.jersey_no 
from match_mast mm 
inner join player_mast pm 
on mm.plr_of_match =pm.player_id
inner join soccer_country sc 
on sc.country_id =pm.team_id ;

--37. From the following tables, write a SQL query to
--find the player who taken the penalty shot number 26. 
--Return match number, country name, player name.

select * from penalty_shootout ps ;
select * from player_mast pm ;
select * from soccer_country sc ;

select ps.match_no,sc.country_name,pm.player_name 
from penalty_shootout ps 
inner join player_mast pm 
on pm.player_id=ps.player_id and pm.team_id=ps.team_id
inner join soccer_country sc 
on sc.country_id =pm.team_id 
where ps.kick_id=26 ;


--38. From the following tables, write a SQL query to find the team
--against which the penalty shot number 26 had been taken. 
--Return match number, country name. 

select * from penalty_shootout ps ;
select * from soccer_country sc ;


select ps.match_no,sc.country_name 
from penalty_shootout ps 
inner join soccer_country sc 
on sc.country_id =ps.team_id 
where ps.match_no=(select ps.match_no 
			from penalty_shootout ps
			where ps.kick_id=26)
and ps.team_id=(select ps.team_id 
				from penalty_shootout ps 
				where ps.match_no=(select ps.match_no 
							from penalty_shootout ps
							where ps.kick_id=26)
				and ps.team_id !=(select ps.team_id 
							from penalty_shootout ps
							where ps.kick_id=26)
				group by 1)
group by 1,2;


--39. From the following tables, write a SQL query to find the captain who 
--was also the goalkeeper. Return match number,
--country name, player name and jersey number.
select * from match_captain mc ;
select * from soccer_country sc ;
select * from player_mast pm ;

select mc.match_no,sc.country_name,pm.player_name,pm.jersey_no 
from player_mast pm
inner join match_captain mc 
on mc.player_captain=pm.player_id  
inner join soccer_country sc 
on sc.country_id=pm.team_id 
where pm.posi_to_play='GK' ;

--40. From the following tables, write a SQL query to find the number of 
--captains who was also the goalkeeper. Return number of captains.
select * from match_captain ;
select * from player_mast pm ;
select * from soccer_country sc ;



select  count(distinct pm.player_id) 
from player_mast pm
inner join match_captain mc 
on mc.player_captain=pm.player_id  
where pm.posi_to_play='GK' ;


--41. From the following tables, write a SQL query to find the players along
--with their team booked number of times in the tournament.
--Show the result according to the team and number
--of times booked in descending order. 
--Return country name, player name, and team booked number of times.
select * from soccer_country sc ;
select * from player_booked pb ;
select * from player_mast pm ;


select sc.country_name,pm.player_name,count(*) 
from player_mast pm 
inner join player_booked pb 
on pm.player_id=pb.player_id 
inner join soccer_country sc 
on sc.country_id=pm.team_id
group by 1,2
order by 1,3 desc ;


--42. From the following tables, write a SQL query to count the players
--who booked the most number of times. Return player name, number of 
--players who booked most number of times. 
select * from soccer_country sc ;
select * from player_booked pb ;
select * from player_mast pm ;

select pm.player_name,count(*) "Booked"
from player_mast pm 
inner join player_booked pb 
on pm.player_id=pb.player_id 
inner join soccer_country sc 
on sc.country_id=pm.team_id
group by 1
having count(*)=(select max(tt.count) from (select pm.player_name,count(*) 
				from player_mast pm 
				inner join player_booked pb 
				on pm.player_id=pb.player_id 
				inner join soccer_country sc 
				on sc.country_id=pm.team_id
				group by 1)tt);

--43. From the following tables, write a SQL query to find the number 
--of players booked for each team. Return country name, number of players booked.
			
select sc.country_name,count(*) 
from soccer_country sc 
inner join player_booked pb 
on sc.country_id=pb.team_id 
group by 1
order by 2 desc ;
--			
--44. From the following tables, write a SQL query to find those matches
--where most number of cards shown. Return match number, number of cards shown .
select * from soccer_country sc ;
select * from player_booked pb ;
select * from player_mast pm ;

select pb.match_no,count(*) 
from player_booked pb
inner join player_mast pm 
on pm.player_id=pb.player_id
group by 1 
order by 2 desc
limit 1;


--45. From the following table, write a SQL query to find the assistant referees.
--Return match number, country name, assistant referee name.
select * from match_details md ;
select * from asst_referee_mast arm ;
select * from soccer_country sc ;


select md.match_no,sc.country_name,arm.ass_ref_name 
from asst_referee_mast arm 
inner join match_details md 
on arm.ass_ref_id=md.ass_ref
inner join soccer_country sc 
on sc.country_id =arm.country_id;


--46. From the following tables, write a SQL query 
--to find the assistant referees of each country assists the
--number of matches. Sort the result-set in descending order on number of matches.
--Return country name, number of matches. 
select * from match_details md ;
select * from asst_referee_mast arm ;
select * from soccer_country sc ;


SELECT country_name,count(distinct match_no)
FROM match_details a
JOIN asst_referee_mast c ON a.ass_ref=c.ass_ref_id
JOIN soccer_country b ON c.country_id=b.country_id
GROUP BY country_name
ORDER BY count(*) DESC;


--47. From the following table, write a SQL query to find the countries 
--from where the assistant referees assist most of the matches. 
--Return country name and number of matches.

select * from match_details md ;
select * from asst_referee_mast arm ;
select * from soccer_country sc ;


select sc.country_name ,count(distinct md.match_no) 
from match_details md 
inner join asst_referee_mast arm 
on md.ass_ref=arm.ass_ref_id 
inner join soccer_country sc 
on sc.country_id =arm.country_id
group by 1
order by 2 desc 
limit 1;


--48. From the following table, write a SQL query to find the name of referees 
--for each match. Sort the result-set on match number.
--Return match number, country name, referee name.
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;

select mm.match_no,sc.country_name,rm.referee_name 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
order by 1;


--49. From the following tables, write a SQL query to count the number of 
--matches managed by referees of each country. Return country name, number of matches.
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;


select sc.country_name,count(*) 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
group by 1
order by 2 desc;


--50. From the following tables, write a SQL query to find the countries
--from where the referees managed most of the matches. Return country name, 
--number of matches.
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;

select sc.country_name,count(*) 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
group by 1
having count(*)=(select max(tt.count) from (select sc.country_name,count(*) 
				from match_mast mm 
				inner join referee_mast rm 
				on rm.referee_id=mm.referee_id 
				inner join soccer_country sc 
				on sc.country_id=rm.country_id
				group by 1)tt); 


--51. From the following tables, write a SQL query to find the number
--of matches managed by each referee. Return referee name, 
--country name, number of matches.
			
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;

select rm.referee_name ,sc.country_name,count(*) 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
group by 1,2;

--52. From the following tables, write a SQL query to find those referees
--who managed most of the matches. Return referee name, country name and number of matches.
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;


select rm.referee_name ,sc.country_name,count(*) 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
group by 1,2
having count(*)=(select max(count) from (select rm.referee_name ,sc.country_name,count(*) 
				from match_mast mm 
				inner join referee_mast rm 
				on rm.referee_id=mm.referee_id 
				inner join soccer_country sc 
				on sc.country_id=rm.country_id
				group by 1,2)tt);

--53. From the following tables, write a SQL query to find those referees who
--managed the number of matches in each venue. Return referee name,
--country name, venue name, number of matches.
select * from match_mast mm ;
select * from referee_mast rm ;
select * from soccer_country sc ;
select * from soccer_venue sv ;


select rm.referee_name ,sc.country_name,sv.venue_name, count(*) 
from match_mast mm 
inner join referee_mast rm 
on rm.referee_id=mm.referee_id 
inner join soccer_country sc 
on sc.country_id=rm.country_id
inner join soccer_venue sv 
on sv.venue_id=mm.venue_id 
group by 1,2,3;

--54. From the following tables, write a SQL query to find the referees and
--number of booked they made. Return referee name, number of matches.

select * from player_booked pb ;
select * from match_mast mm ;
select * from referee_mast rm ;

select rm.referee_name,count(*) 
from referee_mast rm 
inner join match_mast mm 
on mm.referee_id =rm.referee_id 
inner join player_booked pb 
on pb.match_no=mm.match_no
group by 1
order by 2 desc;


--55. From the following tables, write a SQL query to find those
--referees who booked most number of players. Return referee name, number of matches.
select * from player_booked pb ;
select * from match_mast mm ;
select * from referee_mast rm ;

select rm.referee_name,count(*) 
from referee_mast rm 
inner join match_mast mm  
on mm.referee_id=rm.referee_id 
inner join player_booked pb 
on pb.match_no =mm.match_no
group by 1
order by 2 desc 
limit 1;

--56. From the following tables, write a SQL query to find those
--players of each team who wore jersey number 10. Return country name,
--player name, position to play, age and playing club.
select * from player_mast pm ;
select * from soccer_country sc ;


select sc.country_name,pm.player_name,pm.posi_to_play,pm.age,pm.playing_club 
from player_mast pm 
inner join soccer_country sc 
on sc.country_id =pm.team_id 
where pm.jersey_no=10;

--
--57. From the following tables, write a SQL query to find those defenders
--who scored goal for their team. Return player name, jersey number, 
--country name, age and playing club. 
select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;


select pm.player_name,pm.jersey_no,sc.country_name,pm.age,pm.playing_club 
from player_mast pm
inner join goal_details gd 
on pm.player_id=gd.player_id
inner join soccer_country sc 
on sc.country_id=gd.team_id 
where pm.posi_to_play='DF'; 


--58. From the following table, write a SQL query to find those players 
--who accidentally scores against his own team. Return player name, jersey number, 
--country name, age, position to play, and playing club.

select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;


select pm.player_name,pm.jersey_no,sc.country_name,pm.age,pm.playing_club 
from player_mast pm
inner join goal_details gd 
on pm.player_id=gd.player_id
inner join soccer_country sc 
on sc.country_id=gd.team_id 
where gd.goal_type='O'; 


--59. From the following table, write a SQL query to find the results
--of penalty shootout matches. Return match number, play stage, 
--country name and penalty score.

select * from match_details md ;
select * from soccer_country sc ;

select md.match_no,md.play_stage,sc.country_name,md.penalty_score 
from match_details md 
inner join soccer_country sc 
on sc.country_id=md.team_id 
where md.decided_by='P'; 

--60. From the following table, write a SQL query to find the goal 
--scored by the players according to their playing position. 
--Return country name, position to play, number of goals.

select * from goal_details gd ;
select * from player_mast pm ;
select * from soccer_country sc ;

select sc.country_name,pm.posi_to_play,count(*) 
from goal_details gd 
inner join player_mast pm 
on gd.player_id=pm.player_id
inner join soccer_country sc 
on sc.country_id=gd.team_id 
group by 1,2;

--61. From the following tables, write a SQL query to find those players 
--who came into the field at the last time of play. Return match number,
--country name, player name, jersey number and time in out.
select * from player_in_out pio ;
select * from player_mast pm ;
select * from soccer_country sc ;

select pio.match_no,sc.country_name,pm.player_name,pm.jersey_no,pio.time_in_out 
from player_in_out pio
inner join player_mast pm 
on pm.player_id=pio.player_id 
inner join soccer_country sc 
on sc.country_id=pm.team_id 
where pio.time_in_out=(select max(time_in_out) from player_in_out pio2)
and pio.in_out='I' ;



