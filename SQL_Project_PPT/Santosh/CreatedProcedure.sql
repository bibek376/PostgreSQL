drop procedure getSalaryFactInfo;
drop procedure getemployeeInfo;
drop procedure getHireDateInfo;
drop procedure getLocationInfo;
create procedure getHireDateInfo
as 
begin 
	select 
		hire_date,
		cast(DATENAME(YYYY,hire_date) as nvarchar) as YearNumber,
		cast(DATENAME(Q,hire_date)as nvarchar) as QuaterNumber,
		cast(DATENAME(MM,hire_date) as nvarchar) as MonthNumber,
		cast(DATENAME(DD, hire_date) as nvarchar) as DayNumber
	from employees e
	group by hire_date
end

execute getHireDateInfo;

---------------------------------------------------------------------

create procedure getEmployeeInfo
as
begin
	select
		 e.employee_id, 
		 e.first_name, 
		 e.last_name,
		 e.email,
		 e.phone_number,
		 d.department_name,
		 j.job_title  
	from employees e 
	join departments d on e.department_id  = d.department_id
	join jobs j on j.job_id = e.job_id
end

execute getEmployeeInfo;
--------------------------------------------------------
create procedure getLocationInfo
as 
begin
	select 
		l.location_id, 
		l.street_address,
		l.city, c.country_name,
		r.region_name 
	from regions r
	join countries c on r.region_id = c.region_id 
	join locations l on l.country_id = c.country_id 
end

execute getLocationInfo;
-------------------------------------------------------
create procedure getSalaryFactInfo
as
begin 
	select 
			e.hire_date,
			e.employee_id, 
			l.location_id,
			e.salary 
	from employees e 
	join departments d on e.department_id = d.department_id 
	join locations l on d.location_id = l.location_id 
end

execute getSalaryFactInfo;
execute getHireDateInfo;
execute getEmployeeInfo;
execute getLocationInfo;

