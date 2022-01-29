create table if not exists emp (
	emp_id serial primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	phoen_number VARCHAR(50),
	hire_date DATE,
	job_id varchar(20),
	salary double precision,
	commission_pct numeric(2,2),
	manager_id INT,
	dept_id INT
);


insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Mathilde', 'Clemon', 'mclemon0@multiply.com', '531 166 8997', '2021/6/17','C1', 1831.53, 0.26, 1, 1);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Frances', 'Delany', 'fdelany1@lycos.com', '341 626 1691', '2021-6-12', 'C2', 4537.23, 0.44, 1, 2);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Orelie', 'Gribbins', 'ogribbins2@huffingtonpost.com', '132 990 0560', '2021-10-12', 'C3', 7606.99, 0.01, 1, 2);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Vince', 'Rosenfeld', 'vrosenfeld3@tripadvisor.com', '215 976 7996', '2021-5-2', 'C4', 7652.05, 0.02, 1, 2);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Corbin', 'Orta', 'corta4@bbc.co.uk', '803 161 5483', '2001-5-02', 'C4', 1723.26, 0.49, 2, 2);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Lebbie', 'Cordall', 'lcordall5@google.de', '135 741 9161', '2011-11-12', 'C4', 2065.20, 0.30, 1, 1);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Shanie', 'Cusiter', 'scusiter6@mail.ru', '713 413 3081', '2021-2-1', 'C2', 5196.33, 0.12, 3, 3);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Morlee', 'Partridge', 'mpartridge7@goo.ne.jp', '313 927 6799', '2021-3-1', 'C2', 7890.61, 0.35, 4, 3);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Ali', 'Greenside', 'agreenside8@yandex.ru', '676 353 0458', '2001-11-11', 'C1', 2615.64, 0.40, 5, 3);
insert into emp (first_name, last_name, email, phoen_number, hire_date, job_id, salary, commission_pct, manager_id, dept_id) values ('Mill', 'Francescuzzi', 'mfrancescuzzi9@histats.com', '528 591 3778', '2020-1-2', 'C1', 2366.67, 0.20, 1, 3);
