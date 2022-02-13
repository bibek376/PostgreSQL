
--SQL exercises on hospital Database: Basic, Subqueries, and Joins



--
--1. From the following table, write a SQL query to find those nurses who are yet to
--be registered. Return all the fields of nurse table.


select * 
from nurse n 
where n.registered =false;


--2. From the following table, write a SQL 
--query to find the nurse who is the head of their department. 
--Return Nurse Name as "name", Position as "Position". 

select n."name" "Name",n."position" "Position" 
from nurse n 
where n."position"='Head Nurse';



--3. From the following tables, write a SQL query to find those physicians 
--who are the head of the department. Return Department name as 
--"Department" and Physician name as "Physician".

select d."name",p."name" 
from physician p
inner join department d
on p.employeeid=d.head;



--4. From the following table, write a SQL query to count the number
--of patients who booked an appointment with at least one Physician.
--Return count as "Number of patients taken at least one appointment".
select count( distinct a.patient) "Number of patients taken at least one appointment"
from appointment a;


--5. From the following table, write a SQL query to find the floor and block
--where the room number 212 belongs. Return block floor
--as "Floor" and block code as "Block".

select r.blockfloor "Floor",r.blockcode "Block" 
from room r
where r.roomnumber=212;


--
--6. From the following table, write a SQL query to count the number
--available rooms. Return count as "Number of available rooms".

select count(*) "Number of available rooms"
from room r
where r.unavailable=false ;

--7. From the following table, write a SQL query to count the number of
--unavailable rooms. Return count as "Number of unavailable rooms".
select count(*) "Number of unavailable rooms" 
from room r 
where r.unavailable=true ;


--8. From the following tables, write a SQL query to find the physician and
--the departments they are affiliated with. 
--Return Physician name as "Physician", and department name as "Department".
select * from physician p ;
select * from department d ;
select * from affiliated_with aw ;


select p."name",d."name" 
from physician p 
inner join affiliated_with aw 
on p.employeeid =aw.physician
inner join department d 
on d.departmentid =aw.department ;


--9. From the following tables, write a SQL query to find those physicians
--who have trained for special treatment. Return Physician 
--name as "Physician", treatment procedure name as "Treatment". 
select * from physician p ;
select * from "procedure" p ;
select * from trained_in ti ;

select p."name" "Physician",p2."name" 
from trained_in ti 
inner join physician p 
on p.employeeid =ti.physician 
inner join "procedure" p2 
on p2.code=ti.treatment ;


--10. From the following tables, write a SQL query to find those physicians 
--who are yet to be affiliated. Return Physician name as "Physician",
--Position, and department as "Department". 
select * from physician p ;
select * from affiliated_with aw ;
select * from department d ;

select p."name",p."position" ,d."name" 
from affiliated_with aw 
inner join physician p 
on p.employeeid =aw.physician
inner join department d 
on d.departmentid =aw.department 
where aw.primaryaffiliation =false ;


--11. From the following tables, write a SQL query to find those physicians
--who are not a specialized physician. Return Physician 
--name as "Physician", position as "Designation".
select * from physician p ;
select * from trained_in ti ;





select p."name",p."position" 
from physician p 
where p.employeeid not in (select distinct ti.physician  from trained_in ti);

--OR
select p."name",p."position" 
from physician p 
left join trained_in ti 
on p.employeeid =ti.physician 
where ti.physician is null ;

--12. From the following tables, write a SQL query to find the patients
--with their physicians by whom they got their preliminary treatment.
--Return Patient name as "Patient", address as "Address" and Physician name as "Physician".

select * from patient p ;
select * from physician p ;

select p."name",p.address,p2."name" 
from patient p 
inner join physician p2 
on p.pcp =p2.employeeid ;



--13. From the following tables, write a SQL query to find the 
--patients and the number of physicians they have taken appointment.
--Return Patient name as "Patient", number of Physicians as 
--"Appointment for No. of Physicians". 

select * from appointment a ;
select * from patient p ;

select p."name",count(*) "Appointment for No. of Physicians"
from patient p 
inner join appointment a 
on p.pcp=a.physician 
group by 1;

--OR
select p."name",count(*) "Appointment for No. of Physicians"
from patient p 
inner join appointment a 
on a.patient=p.ssn 
group by 1;

--
--14. From the following table, write a SQL query to count number 
--of unique patients who got an appointment for examination room ‘C’.
--Return unique patients as “No. of patients got appointment for room C” 
select count( distinct a.patient) "No. of patients got appointment for room C"
from appointment a 
where a.examinationroom='C';


--15. From the following tables, write a SQL query to find the name of
--the patients and the number of the room where they have to go for their
--treatment. Return patient name as “Patient”, examination room as "Room No.”,
-- and starting date time as Date "Date and Time of appointment".


select p."name" "Patient",a.examinationroom "Room No.",a.start_dt_time "Date and Time"
from patient p 
inner join appointment a 
on p.ssn=a.patient ;



--16. From the following tables, write a SQL query to find the name of the 
--nurses and the room scheduled, where they will assist the physicians.
--Return Nurse Name as “Name of the Nurse” and examination room as “Room No.”.

select * from nurse n ;
select * from appointment a ;

select n."name" "Name of the Nurse",a.examinationroom "Room No."
from nurse n 
inner join appointment a 
on n.employeeid =a.prepnurse ;

--
--17. From the following tables, write a SQL query to find those patients
--who taken the appointment on the 25th of April at 10 am. Return Name of 
--the patient, Name of the Nurse assisting the physician, Physician
--Name as "Name of the physician", examination room as "Room No.", 
--schedule date and approximate time to meet the physician.
select * from nurse n ;
select * from appointment a ;
select * from patient p ;
select * from physician p ;

select p."name",n."name",p."name" "Name of the physician",a.examinationroom "Room No."
                                 ,a.start_dt_time 
from patient p 
inner join appointment a 
on a.patient=p.ssn
inner join physician p2 
on p2.employeeid=a.physician 
inner join nurse n 
on n.employeeid=a.prepnurse 
where a.start_dt_time='2008-04-25 10:00:00';



--18. From the following tables, write a SQL query to find those patients
--and their physicians who do not require any assistance of a nurse.
--Return Name of the patient as "Name of the patient", Name of the Physician as
--"Name of the physician" and examination room as "Room No.". 
select * from patient p ;
select * from appointment a ;
select * from physician p ;


select p."name" "Name of the patient",p2."name" "Name of the physician",
					a.examinationroom "Room No." 
from patient p 
inner join physician p2 
on p.pcp=p2.employeeid
right join appointment a 
on a.patient=p.ssn
where a.prepnurse is null;

--VVV IMP

--19. From the following tables, write a SQL query to find the patients 
--and their treating physicians and medication. Return Patient 
--name as "Patient", Physician name as "Physician",
--Medication name as "Medication". 
select * from patient p ;
select * from prescribes p ;
select * from physician p ;
select * from medication m ;


select p.name "Patient",p2."name" "Physician",m."name" "Medication"
from patient p 
inner join physician p2 
on p.pcp=p2.employeeid
inner join prescribes p3 
on p3.physician=p2.employeeid or p3.patient=p.ssn  
inner join medication m 
on m.code=p3.medication;


--20. From the following tables, write a SQL query to find 
--those patients who have taken an advanced appointment. 
--Return Patient name as "Patient", Physician name
--as "Physician" and Medication name as "Medication". 
select * from patient p ;
select * from prescribes p ;
select * from physician p ;
select * from medication m ;


select p.name "Patient",p2."name" "Physician",m."name" "Medication"
from patient p 
inner join physician p2 
on p.pcp =p2.employeeid 
inner join prescribes p3 
on p3.physician=p2.employeeid or p3.patient=p.ssn
inner join medication m 
on m.code=p3.medication
where p3.appointment is not null; 


--21. From the following tables, write a SQL query to find those patients 
--who did not take any appointment. Return Patient name as "Patient",
--Physician name as "Physician" and Medication name as "Medication".
select * from patient p ;
select * from prescribes p ;
select * from physician p ;
select * from medication m ;


select p.name "Patient",p2."name" "Physician",m."name" "Medication"
from patient p 
inner join physician p2 
on p.pcp =p2.employeeid 
inner join prescribes p3 
on p3.physician=p2.employeeid or p3.patient=p.ssn
inner join medication m 
on m.code=p3.medication
where p3.appointment is null; 


--22. From the following table, write a SQL query to count the number of
--available rooms in each block. Sort the result-set on ID of the block. 
--Return ID of the block as "Block", count number of available 
--rooms as "Number of available rooms".
select r.blockcode,count(*) 
from room r
where r.unavailable=false
group by 1;


--23. From the following table, write a SQL query to count the number 
--of available rooms in each floor. Sort the result-set on block floor.
--Return floor ID as "Floor" and count the number of available 
--rooms as "Number of available rooms". 
select r.blockfloor,count(*) 
from room r
where r.unavailable=false
group by 1;


--24. From the following table, write a SQL query to count the number
--of available rooms for each floor in each block. Sort the result-set 
--on floor ID, ID of the block. Return the floor ID as "Floor", ID of 
--the block as "Block", and number of available rooms as "Number of available rooms".

select * from room r ;

select r.blockfloor "Floor",r.blockcode "Block", count(*) "Number of available rooms"
from room r
where r.unavailable=false
group by 1,2
order by 1,2;


--25. From the following tables, write a SQL query to 
--count the number of unavailable rooms for each block in 
--each floor. Sort the result-set on block floor, block code. 
--Return the floor ID as "Floor", block ID as "Block", 
--and number of unavailable as "Number of unavailable rooms".
 select r.blockfloor "Floor",r.blockcode "Block", count(*) "Number of unavailable rooms"
from room r
where r.unavailable=true
group by 1,2
order by 1,2;


--26. From the following table, write a SQL query to find the floor where
--the maximum numbers of rooms are available. Return floor ID as "Floor", 
--count "Number of available rooms".

select r.blockfloor,count(*) "Number of available rooms"
from room r 
where r.unavailable=false
group by 1
having count(*)=(select max(tt.count) from (select r.blockfloor,count(*) 
				from room r 
				where r.unavailable=false
				group by 1)tt);

--27. From the following table, write a SQL query to find the
--floor where the minimum numbers of rooms are 
--available. Return floor ID as “Floor”, Number of available rooms.

select * from room;			
			
select r.blockfloor "Floor",count(*) "Number of available rooms"
from room r 
where r.unavailable=false
group by 1
having count(*)=(select min(tt.count) from (select r.blockfloor,count(*) 
				from room r 
				where r.unavailable=false
				group by 1)tt);			
			
			
--28. From the following tables, write a SQL query to find the name of the patients,
--their block, floor, and room number where they admitted.
select * from stay s ;
select * from patient p ;
select * from room;
			
select p."name",r.blockcode,r.blockfloor,r.roomnumber 
from patient p 
inner join stay s 
on s.patient=p.ssn 
inner join room r 
on r.roomnumber=s.room ;
			
			
--29. From the following tables, write a SQL query to find the nurses 
--and the block where they are booked for attending the patients on call. 
--Return Nurse Name as “Nurse”, Block code as "Block".
select * from nurse n ;
select * from on_call oc ;

select n."name" "Nurse",oc.blockcode "Block"
from nurse n
inner join on_call oc 
on n.employeeid=oc.nurse ;

--
--30. From the following tables, write a SQL query to get
--a) name of the patient,
--b) name of the physician who is treating him or her,
--c) name of the nurse who is attending him or her,
--d) which treatement is going on to the patient,
--e) the date of release,
--f) in which room the patient has admitted and which floor and 
--   block the room belongs to respectively.

select * from undergoes u ;
select * from patient p ;
select * from physician p ;
select * from nurse n ;
select * from stay s ;
select * from room r ;
select * from "procedure" p ;


select p."name" "Patient",p2."name" "Physician",n."name" "Nurse",
s.end_time "Date Of Realease",p3."name" "Treatement Going On" ,r.roomnumber "Room",r.blockfloor "Floor",
r.blockcode "Block"  
from patient p 
inner join physician p2 
on p.pcp=p2.employeeid 
inner join undergoes u 
on u.physician=p2.employeeid or (p.ssn=u.patient) 
inner join nurse n 
on n.employeeid=u.assistingnurse
inner join stay s 
on s.stayid=u.stay 
inner join "procedure" p3 
on u."procedure"=p3.code 
inner join room r 
on r.roomnumber=s.room ;


--31. From the following tables, write a SQL query to find all 
--those physicians who performed a medical procedure, but they are 
--not certified to perform. Return Physician name as “Physician”.

select * from physician p ;
select * from undergoes u ;
select * from trained_in ti ;

--
--32. From the following tables, write a SQL query to find all 
--the physicians, their procedure, date when the procedure was 
--carried out and name of the patient on which procedure have 
--been carried out but those physicians are not certified for
--that procedure. Return Physician Name as "Physician", 
--Procedure Name as "Procedure", date, and Patient. Name as "Patient".

select * from physician p ;
select * from undergoes u ;
select * from patient p ;
select * from "procedure" p ;
select * from trained_in ti ;


select p."name" "Physican" ,p2."name" "Procedure",u."date",p3."name" "Patient" 
from physician p 
inner join undergoes u 
on p.employeeid =u.physician
inner join "procedure" p2 
on p2.code=u."procedure"
inner join patient p3 
on p3.ssn=u.patient
left join trained_in ti 
on ti.physician=p.employeeid and ti.treatment=p2.code
where ti.physician is null and ti.treatment is null;


--33. From the following table, write a SQL query to find all
--those physicians who completed a medical procedure with
--certification after the date of expiration of their certificate.
--Return Physician Name as "Physician", Position as "Position".
select * from physician p ;
select * from undergoes u ;
select * from trained_in ti ;

SELECT name, position
FROM physician
JOIN trained_In ON physician.employeeid = trained_in.physician
JOIN undergoes ON physician.employeeid = undergoes.physician
WHERE undergoes.date > trained_in.certificationexpires;

--
--34. From the following table, write a SQL query to find all 
--those physicians who completed a medical procedure with 
--certification after the date of expiration of their certificate.
--Return Physician Name as “Physician”, Position as "Position", 
--Procedure Name as “Procedure”, Date of Procedure as “Date of Procedure”, 
--Patient Name as “Patient”, and expiry date of certification 
--as “Expiry Date of Certificate”.  
select * from physician p ;
select * from undergoes u ;
select * from patient p ;
select * from "procedure" p ;
select * from trained_in ti ;

select p."name",p."position",p2."name",u."date",p."name",ti.certificationexpires 
from physician p 
inner join undergoes u 
on p.employeeid=u.physician 
inner join trained_in ti 
on p.employeeid =ti.physician
inner join "procedure" p2 
on p2.code=u."procedure" 
inner join patient p3 
on p3.ssn=u.patient 
where u."date" > ti.certificationexpires;


--35. From the following table, write a SQL query to
--find those nurses who have ever been on call for room 122.
--Return name of the nurses. 

select * from nurse n ;
select * from room r ;
select * from on_call oc ;

select n."name" 
from room r
inner join on_call oc 
on r.blockfloor=oc.blockfloor  and r.blockcode =oc.blockcode 
inner join nurse n 
on n.employeeid =oc.nurse 
where r.roomnumber=122;


--36. From the following table, write a SQL query to find those patients 
--who have been prescribed by some medication by his/her
--physician who has carried out primary care. Return Patient name 
--as “Patient”, and Physician Name as “Physician”.
select * from patient p ;
select * from prescribes p ;
select * from physician p ;

select p."name",p3."name" 
from patient p 
inner join prescribes p2 
on p.pcp=p2.physician 
inner join physician p3 
on p3.employeeid=p.pcp ;


--37. From the following table, write a SQL query to find those
--patients who have been undergone a procedure costing 
--more than $5,000 and the name of that physician who has 
--carried out primary care. Return name of the patient as 
--“Patient”, name of the physician as “Primary Physician”,
--and cost for the procedure as “Procedure Cost”.
select * from physician p ;
select * from undergoes u ;
select * from patient p ;
select * from "procedure" p ;

select p3."name",p2."name",p."cost" 
from "procedure" p
inner join undergoes u 
on p.code=u."procedure"
inner join physician p2 
on p2.employeeid=u.physician
inner join patient p3 
on p3.ssn=u.patient 
where p."cost" > 5000;


--38. From the following table, write a SQL query to find those
--patients who had at least two appointments where the nurse who
--prepped the appointment was a registered nurse and the physician
--who has carried out primary care. Return Patient name as “Patient”, 
--Physician name as “Primary Physician”, and Nurse Name as “Nurse”. 
select * from appointment a ;
select * from patient p ;
select * from nurse n ;
select * from physician p ;

select p."name",p2."name",n."name" 
from appointment a 
inner join patient p 
on a.patient =p.ssn 
inner join nurse n  	
on n.employeeid=a.prepnurse 
inner join physician p2 
on p2.employeeid=a.physician 
where p.ssn  in (select a2.patient from appointment a2
				inner join patient p3
			    on p3.ssn=a2.patient
			   group by 1
			  having count(*)>=2)
and n.registered =true;


--39. From the following table, write a SQL query to find those patients 
--whose primary care a physician who is not the head of any department takes.
--Return Patient name as “Patient”, Physician Name as “Primary care Physician”.
select * from patient p ;
select * from department d ;
select * from physician p ;


select p."name" "Patient",p2."name" "Physician" 
from patient p
inner join physician p2 
on p2.employeeid=p.pcp
left join department d 
on d.head=p2.employeeid 
where d.head is null;



