--SQL Exercises, Practice, Solution - SUBQUERIES exercises on soccer Database


--1. From the following tables, write a SQL query to 
--find the teams played the first match of EURO cup 2016.
--Return match number, country name. 

select md.match_no,(select sc.country_name from soccer_country sc
					where sc.country_id=md.team_id) 
from match_details md 
where md.match_no =1;

select * from match_details md ;

--OR
SELECT match_no,country_name
FROM match_details a, soccer_country b
WHERE a.team_id=b.country_id
AND a.match_no=1;

--2. From the following tables, write a SQL query to find the winner 
--of EURO cup 2016. Return country name.


select sc.country_name 
from soccer_country sc 
where sc.country_id= (select md.team_id 
						from match_details md 
						where md.play_stage='F'
						and md.win_lose='W');

--3. From the following table, write a SQL query to find the most watched 
--match in the world. Return match_no, play_stage, goal_score, audience
					
select mm.match_no,mm.play_stage,mm.goal_score,mm.audence 
from match_mast mm
where mm.audence=(select max(audence) from match_mast ); 

--4. From the following tables, write a SQL query to find the match number
--in which Germany played against Poland. Group the result set on match number. 
--Return match number.
select md.match_no 
from match_details md 
where md.team_id in (select sc.country_id 
					 from soccer_country sc 
					 where sc.country_name in ('Germany','Poland'))
group by md.match_no
having count(*)>=2;


--5. From the following tables, write a SQL query to find the result of the 
--match where Portugal played against Hungary. Return match_no, play_stage,
--play_date, results, goal_score.
select * from match_mast mm ;
select * from match_details md ;

select mm.match_no,mm.play_stage,mm.play_date,mm.results,mm.goal_score 
from match_mast mm 
where mm.match_no =(select md.match_no 
					from match_details md 
					where md.team_id in (select sc.country_id 
										 from soccer_country sc 
										 where sc.country_name in ('Portugal','Hungary'))
					group by md.match_no
					having count(*)>=2);	

--6. From the following tables, write a SQL query to find those players who 
--scored number of goals in every match. Group the result set on match number,
--country name and player name. Sort the result-set in ascending order 
--by match number. Return match number, country name, player name and number of matches.
				
SELECT match_no, country_name, player_name, COUNT(*)
FROM goal_details
JOIN soccer_country ON goal_details.team_id = soccer_country.country_id
JOIN player_mast ON goal_details.player_id = player_mast.player_id
GROUP BY match_no, country_name, player_name
ORDER BY match_no;


/*7. From the following tables, write a SQL query to find the highest audience match.
Return country name of the teams.*/

select sc.country_name from soccer_country sc 
where sc.country_id in (select distinct gd.team_id 
						from goal_details gd 
						where gd.match_no =(select mm.match_no 
									from match_mast mm 
									where mm.audence =(select max(audence) from match_mast)));




--8. From the following tables, write a SQL query to find the player who 
--scored the last goal for Portugal against Hungary. Return player name.
select * from player_mast pm ;
select * from soccer_country sc ;
select * from goal_details gd ;
select * from match_details md ;


select pm.player_name 
from player_mast pm 
where pm.player_id=(select gd.player_id 
from goal_details gd 
where gd.goal_id= (select max(gd.goal_id) 
from goal_details gd 
where gd.match_no =(select md.match_no 
						from match_details md 
						where md.team_id in (select sc.country_id 
											from soccer_country sc
											where sc.country_name='Portugal' or 
											sc.country_name='Hungary')
						group by md.match_no 
						having count(*)>=2)
and gd.team_id=(select sc2.country_id 
				 from soccer_country sc2
				 where sc2.country_name='Portugal'))); 


--9. From the following table, write a SQL query to find the second-highest 
--stoppage time, which had been added, in the second half of play.

select max(mm2.stop2_sec) from match_mast mm2 
where mm2.stop2_sec not in (select max(mm.stop2_sec) from match_mast mm);

--10. From the following tables, write a SQL query to find the teams played
--the match where second highest stoppage time had been added in second half 
--of play. Return country name of the teams.
select sc.country_name 
from soccer_country sc 
where sc.country_id in (
select md.team_id 
from match_details md
where md.match_no=(select mm.match_no from match_mast mm 
						where mm.stop2_sec=(select max(mm2.stop2_sec) 
											from match_mast mm2 
											where mm2.stop2_sec not in 
											(select max(mm.stop2_sec) from match_mast mm)))); 


--11. From the following table, write a SQL query to find the teams 
--played the match where second highest stoppage time had been added
--in second half of play. Return match_no, play_date, stop2_sec.

										
select mm.match_no,mm.play_date,mm.stop2_sec 
from match_mast mm 
where mm.stop2_sec=(select max(mm2.stop2_sec) 
					from match_mast mm2 
					where mm2.stop2_sec not in (select max(mm.stop2_sec)
												from match_mast mm )); 
															
										
--12. From the following tables, write a SQL query to find the team,
--which was defeated by Portugal in EURO cup 2016 final. 
--Return the country name of the team.
select sc.country_name 
from soccer_country sc 
where sc.country_id=(select md.team_id 											
					from match_details md 
					where md.match_no =(select max(md.match_no)
										from match_details md )
					and md.win_lose='L'); 
											
--13. From the following table, write a SQL query to find the 
--club, which supplied the most number of players 
--to the 2016-EURO cup. Return club name, number of players.
select pm.playing_club,count(pm.playing_club) "num_of_player" 
from player_mast pm
group by pm.playing_club
having count(pm.playing_club)=(select max(tt.mycount) 
								from (select count(pm.playing_club) "mycount" 
										from player_mast pm
										group by pm.playing_club) tt);  	
		
				

--14. From the following tables, write a SQL query to find the player who
--scored the first penalty of the tournament. Return player name and Jersey number.
select pm.player_name,pm.jersey_no 
from player_mast pm 
where pm.player_id =(select gd.player_id 
					from goal_details gd 
					where gd.goal_type='P'
					and gd.match_no=(select min(gd.match_no) 
									from goal_details gd 
									where gd.goal_type='P'));

				
--				
--15. From the following tables, write a SQL query to 
--find the player who scored the first penalty in the tournament.
--Return player name, Jersey number and country name. 
select * from player_mast pm;
select * from soccer_country sc ;
select * from goal_details gd ;
								
								
select pm.player_name,pm.jersey_no,(select sc.country_name 
									from soccer_country sc
									where sc.country_id=pm.team_id) 
from player_mast pm 
where pm.player_id =(select gd.player_id 
					from goal_details gd 
					where gd.goal_type='P'
					and gd.match_no=(select min(gd.match_no) 
									from goal_details gd 
									where gd.goal_type='P'));								
								
								
--16. From the following tables, write a SQL query to 
--find the goalkeeper for Italy in penalty 
--shootout against Germany in Football EURO cup 2016. Return goalkeeper name.
select * from player_mast pm;
select * from soccer_country sc ;								
select * from penalty_gk pg ;


select pm.player_name 
from player_mast pm 
where pm.player_id =(select md.player_gk 
					from match_details md
					where md.team_id in (select sc.country_id 
										from soccer_country sc 
										where sc.country_name='Italy' 
										or sc.country_name='Germany')
					and md.decided_by='P'
					and md.team_id =(select sc.country_id 
										from soccer_country sc 
										where sc.country_name='Italy'));
													 

--17. From the following tables, write a SQL query to find the number
--of goals Germany scored at the tournament.
select count(*)  
from goal_details gd 
where gd.team_id= (select sc.country_id 
					from soccer_country sc 
					where sc.country_name ='Germany');
									

--18. From the following tables, write a SQL query to find the players 
--who were the goalkeepers of 
--England squad in 2016-EURO cup. Return player name, jersey number, club name.

select * from player_mast pm ;
				
select pm.player_name,pm.jersey_no,pm.playing_club 
from player_mast pm 				
where pm.team_id =(select sc.country_id from soccer_country sc 
				  where sc.country_name='England')
and pm.posi_to_play ='GK';

--19. From the following tables, write a SQL query to find the players 
--under contract to Liverpool were in the Squad of England in 2016-EURO cup. 
--Return player name, jersey number, position to play, age. 

select pm.player_name,pm.jersey_no,pm.playing_club,pm.age 
from player_mast pm 				
where pm.team_id =(select sc.country_id from soccer_country sc 
				  where sc.country_name='England')
and pm.playing_club ='Liverpool';


--20. From the following tables, write a SQL query to find the
--players who scored the last goal in the 2nd semi-final, i.e., 
--50th match in EURO cup 2016. Return player name, goal time, goal half, country name.

select * from player_mast pm ;
select * from goal_details gd ;
select * from soccer_country sc ;

select (select pm.player_name 
		from player_mast pm
		where pm.player_id=gd.player_id), gd.goal_time,gd.goal_half,(select sc.country_name 
																	 from soccer_country sc
																	 where sc.country_id=gd.team_id) 
from goal_details gd 
where gd.match_no=50
and gd.goal_id=(select max(gd.goal_id) from goal_details gd 
				where gd.match_no=50);


--21. From the following tables, write a SQL query to find the captain of 
--the EURO cup 2016 winning team from Portugal. Return the captain name. 
select * from player_mast pm ;
select * from match_captain mc ;
select * from match_details md ;


select pm.player_name 
from player_mast pm 
where pm.player_id=(select mc.player_captain 
				from match_captain mc 
				where (mc.match_no,mc.team_id) =(select md.match_no,md.team_id 
												from match_details md 
												where md.match_no=(select max(md2.match_no) 
																   from match_details md2)
												and md.win_lose='W')); 



--22. From the following tables, write a SQL query to count the number of players played
--for 'France’ in the final. Return 'Number of players shared fields'.			
select * from player_in_out pio ;
select * from match_mast mm ;


select count(*)+11 "Number of players shared fields "
from player_in_out pio 
where pio.team_id=(select sc.country_id from soccer_country sc 
				   where sc.country_name ='France')
and pio.match_no=(select max(pio2.match_no) from player_in_out pio2)
and pio.in_out='I'; 


--23. From the following tables, write a SQL query to find the Germany
--goalkeeper who didn't concede any goal in their group stage matches.
-- Return goalkeeper name, jersey number

select * from player_mast pm ;
select * from match_details md ;
select * from soccer_country sc ;


select pm.player_name,pm.jersey_no 
from player_mast pm 
where pm.player_id =(select md.player_gk 
					from match_details md 
					where md.team_id=(select sc.country_id 
									  from soccer_country sc
									  where sc.country_name='Germany')
					and md.play_stage='G'
					and md.goal_score=0);


--24. From the following tables, write a SQL query to find the runners-up
--in Football EURO cup 2016. Return country name.

select * from match_details md ;
select * from soccer_country sc ;

select sc.country_name 
from soccer_country sc 
where sc.country_id =(select md.team_id 
						from match_details md 
						where md.match_no=(select max(md2.match_no) from match_details md2)
						and md.win_lose='L');


--25. From the following tables, write a SQL query to find the maximum penalty 
--shots taken by the teams. Return country name, maximum penalty shots.
select * from soccer_country sc ;
select * from penalty_shootout ps ;
					

select (select sc.country_name 
				  from soccer_country sc
				  where sc.country_id=ps.team_id) ,count(*)
from penalty_shootout ps 
group by ps.team_id 
having count(*)=(select max(tt.count) from (select ps2.team_id,count(*) "count" 
				  							from penalty_shootout ps2
			 								group by ps2.team_id) tt);				
											
											
											
--26. From the following tables, write a SQL query to find the maximum 
--number of penalty shots taken by the players. Return country name, 
--player name, jersey number and number of penalty shots.

select * from player_mast pm ;
select * from penalty_shootout ps ;
select * from soccer_country sc ;
			 							
select * from player_mast pm ;



select sc.country_name,pm.player_name,pm.jersey_no,ttt.count 
from 
(select ps.player_id,count(*) "count" 
from penalty_shootout ps
group by ps.player_id
having count(*)=(select max(tt.count) from (select ps2.player_id,count(*) "count" 
				  							from penalty_shootout ps2
			 								group by ps2.player_id) tt)) ttt
inner join player_mast pm 
on pm.player_id =ttt.player_id
inner join soccer_country sc 
on sc.country_id=pm.team_id ;
			 								

			 							
			 							
--27. From the following table, write a SQL query to find those match where 
--the highest number of penalty shots taken.
			 							
select ps.match_no,count(*) "shots" 
from penalty_shootout ps
group by ps.match_no 
having count(*)=(select max(tt.count) from  (select ps.match_no,count(*) 
				  from penalty_shootout ps
				  group by ps.match_no ) tt	);
				  
--28. From the following table, write a SQL query to find the match number where
--highest number of penalty shots 
--had been taken. Return match number, country name.

select * from penalty_shootout ps ;
select * from soccer_country sc ;

select ttt.match_no,sc.country_name from
(select ps.match_no,count(*) "shots" 
from penalty_shootout ps
group by ps.match_no 
having count(*)=(select max(tt.count) from  (select ps.match_no,count(*) 
				  from penalty_shootout ps
				  group by ps.match_no ) tt	))ttt
inner join penalty_shootout ps2 
on ps2.match_no=ttt.match_no
inner join soccer_country sc 
on sc.country_id =ps2.team_id 
group by ttt.match_no,sc.country_name;

--29. From the following tables, write a SQL query to find the player of 'Portugal'
--who taken the seventh kick against 'Poland'. Return match number, 
--player name and kick number.
select * from penalty_shootout ps ;
select * from soccer_country sc ;
select * from player_mast pm ;


select  ps.match_no,ps.kick_no,(select pm.player_name 
								from player_mast pm
								where pm.player_id=ps.player_id) 
from penalty_shootout ps 
where ps.team_id in (select sc.country_id 
					from soccer_country sc 
					where sc.country_name ='Portugal' or
					sc.country_name ='Poland')
and ps.kick_no=7; 

--30. From the following tables, write a SQL query to find the stage
--of match where penalty kick number 23 had been taken.
--Return match number, play_stage. 
select * from match_mast mm ;
select * from penalty_shootout ps ;


select mm.match_no ,mm.play_stage 
from match_mast mm 
where mm.match_no =(select ps.match_no 
					from penalty_shootout ps 
					where ps.kick_id=23);


--31. From the following tables, write a SQL query to find the venues 
--where penalty shoot-out matches played. Return venue name.
select * from soccer_venue sv ;

select * from penalty_shootout ps ;

select sv.venue_name 
from soccer_venue sv 
where sv.venue_id in (select mm.venue_id 
						from match_mast mm 
						where mm.match_no in (select distinct ps.match_no 
											  from penalty_shootout ps ));
											 
--32. From the following tables, write a SQL query to
--find the date when penalty shootout matches played. Return playing date.
select * from penalty_shootout ps ;
select * from match_mast mm ;
							


select mm.play_date 
from match_mast mm 
where mm.match_no in (select distinct ps.match_no 
					  from penalty_shootout ps);




--33. From the following table, write a SQL 
--query to find the quickest goal at the EURO cup 2016, after 5 minutes.
--Return 'Quickest goal after 5 minutes'. 

					 
select min(tt.goal_time) "Quickest goal after 5 minutes"
from (select gd.goal_time
	from goal_details gd
	where gd.goal_time > 5 
	group by gd.goal_time) tt  ;
					 
											 
											 
											 
											 
											 
											 
											 
											 
											 
											 

















			 							
			 							
			 							
			 							
			 							
			 							
			 							
			 							
			 							
			 							















											
											
											
											
											
											
											
											
											
											
											
											
											
											















				
				
				
				
				
				
				
				
									
									
								
								
								
								
								
								
								
								
								
								

										
											
										

										
										
										
										
										
										
										
										
										
										
										
										




















 


























