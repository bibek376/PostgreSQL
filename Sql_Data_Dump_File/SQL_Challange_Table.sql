
--Table For SQL Challange

CREATE TABLE IF NOT EXISTS salespersons(salesperson_id int, first_name varchar(255),
last_name varchar(255));

CREATE TABLE IF NOT EXISTS address (address_id int, salesperson_id  int, 
city varchar(255), state varchar(255), country varchar(255));

TRUNCATE TABLE address;

INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('1', 'Green', 'Wright');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('2', 'Jones', 'Collins');
INSERT INTO salespersons (salesperson_id, first_name, last_name) VALUES ('3', 'Bryant', 'Davis');

TRUNCATE TABLE address;

INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('1', '2', 'Los Angeles','California', 'USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('2', '3', 'Denver', 'Colorado','USA');
INSERT INTO address (address_id, salesperson_id, city, state, country) VALUES ('3', '4', 'Atlanta', 'Georgia','USA');

select * from address;
select * from salespersons;

CREATE TABLE If Not Exists salemast(sale_id int, employee_id int, 
sale_date date, sale_amt int);
TRUNCATE TABLE salemast;
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('1', '1000', '2012-03-08', 4500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('2', '1001', '2012-03-09', 5500);
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 3500); 
INSERT INTO salemast (sale_id, employee_id, sale_date, sale_amt) VALUES ('3', '1003', '2012-04-10', 2500); 


CREATE TABLE IF NOT EXISTS logs (student_id int, marks int);
TRUNCATE TABLE logs;
INSERT INTO logs (student_id, marks) VALUES ('101', '83');
INSERT INTO logs (student_id, marks) VALUES ('102', '79');
INSERT INTO logs (student_id, marks) VALUES ('103', '83');
INSERT INTO logs (student_id, marks) VALUES ('104', '83');
INSERT INTO logs (student_id, marks) VALUES ('105', '83');
INSERT INTO logs (student_id, marks) VALUES ('106', '79');
INSERT INTO logs (student_id, marks) VALUES ('107', '79');
INSERT INTO logs (student_id, marks) VALUES ('108', '83');


CREATE TABLE IF NOT EXISTS employeees(employee_id int, employee_name varchar(255), email_id varchar(255));
TRUNCATE TABLE employeees;
INSERT INTO employeees (employee_id,employee_name, email_id) VALUES ('101','Liam Alton', 'li.al@abc.com');
INSERT INTO employeees (employee_id,employee_name, email_id) VALUES ('102','Josh Day', 'jo.da@abc.com');
INSERT INTO employeees (employee_id,employee_name, email_id) VALUES ('103','Sean Mann', 'se.ma@abc.com');	
INSERT INTO employeees (employee_id,employee_name, email_id) VALUES ('104','Evan Blake', 'ev.bl@abc.com');
INSERT INTO employeees (employee_id,employee_name, email_id) VALUES ('105','Toby Scott', 'jo.da@abc.com');
SELECT * FROM employeees;


CREATE TABLE IF NOT EXISTS customers (customer_id int, customer_name varchar(255));
TRUNCATE TABLE customers;
INSERT INTO customers (customer_id, customer_name) VALUES ('101', 'Liam');
INSERT INTO customers (customer_id, customer_name) VALUES ('102', 'Josh');
INSERT INTO customers (customer_id, customer_name) VALUES ('103', 'Sean');
INSERT INTO customers (customer_id, customer_name) VALUES ('104', 'Evan');
INSERT INTO customers (customer_id, customer_name) VALUES ('105', 'Toby');	
CREATE TABLE IF NOT EXISTS orders (order_id int, customer_id int, order_date Date, order_amount int);
TRUNCATE TABLE orders;
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('401', '103','2012-03-08','4500');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('402', '101','2012-09-15','3650');
INSERT INTO orders (order_id, customer_id,order_date,order_amount) VALUES ('403', '102','2012-06-27','4800');
SELECT * FROM customers;
SELECT * FROM orders;


CREATE TABLE IF NOT EXISTS so2_pollution (city_id int, date date, so2_amt int);
TRUNCATE TABLE so2_pollution;
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('701', '2015-10-15', '5');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('702', '2015-10-16', '7');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('703', '2015-10-17', '9');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('704', '2018-10-18', '15');
INSERT INTO so2_pollution (city_id, date, so2_amt) VALUES ('705', '2015-10-19', '14');
SELECT * FROM so2_pollution;


DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
TRANSACTION_ID INTEGER NOT NULL,
SALESMAN_ID   INTEGER NOT NULL,
SALE_AMOUNT  decimal(8,2),
PRIMARY KEY (TRANSACTION_ID)
) ;
INSERT INTO sales VALUES(501,18,5200.00),(502,50,5566.00),(503,38,8400.00),(504,43,8400.00),(505,11,9000.00);
INSERT INTO sales VALUES (506,42,5900.00),(507,13,7000.00),(508,33,6000.00),(509,41,8200.00),(510,11,4500.00);
INSERT INTO sales VALUES (511,51,10000.00),(512,29,9500.00),(513,59,6500.00),(514,38,7800.00),(515,58,9800.00);
INSERT INTO sales VALUES (516,60,12000.00),(517,58,13900.00),(518,23,12200.00),(519,34,5480.00),(520,35,8129.00);
INSERT INTO sales VALUES (521,49,9323.00),(522,46,8200.00),(523,47,9990.00),(524,42,14000.00),(525,44,7890.00);
INSERT INTO sales VALUES (526,47,5990.00),(527,21,7770.00),(528,57,6645.00),(529,56,5125.00),(530,25,10990.00);
INSERT INTO sales VALUES (531,21,12600.00),(532,41,5514.00),(533,17,15600.00),(534,44,15000.00),(535,12,17550.00);
INSERT INTO sales VALUES (536,55,13000.00),(537,58,16800.00),(538,25,19900.00),(539,57,9990.00),(540,28,8900.00);
INSERT INTO sales VALUES (541,44,10200.00),(542,57,18000.00),(543,34,16200.00),(544,36,19998.00),(545,30,13500.00);
INSERT INTO sales VALUES (546,37,15520.00),(547,36,20000.00),(548,20,19800.00),(549,22,18530.00),(550,19,12523.00);
INSERT INTO sales VALUES (551,46,9885.00),(552,22,7100.00),(553,54,17500.00),(554,19,19600.00),(555,24,17500.00);
INSERT INTO sales VALUES (556,38,7926.00),(557,49,7548.00),(558,15,9778.00),(559,56,19330.00),(560,24,14400.00);
INSERT INTO sales VALUES (561,18,16700.00),(562,54,6420.00),(563,31,18720.00),(564,21,17220.00),(565,48,18880.00); 
INSERT INTO sales VALUES (566,33,8882.00),(567,44,19550.00),(568,22,14440.00),(569,53,19500.00),(570,30,5300.00);
INSERT INTO sales VALUES (571,30,10823.00),(572,35,13300.00),(573,35,19100.00),(574,18,17525.00),(575,60,8995.00);
INSERT INTO sales VALUES (576,53,9990.00),(577,21,7660.00),(578,27,18990.00),(579,11,18200.00),(580,30,12338.00);
INSERT INTO sales VALUES (581,37,11000.00),(582,27,11980.00),(583,18,12628.00),(584,52,11265.00),(585,53,19990.00);
INSERT INTO sales VALUES (586,27,8125.00),(587,25,7128.00),(588,57,6760.00),(589,19,5985.00),(590,52,17641.00);
INSERT INTO sales VALUES (591,53,11225.00),(592,22,12200.00),(593,59,16520.00),(594,35,19990.00),(595,42,19741.00);
INSERT INTO sales VALUES (596,19,15000.00),(597,57,19625.00),(598,53,9825.00),(599,24,16745.00),(600,12,14900.00);
DROP TABLE IF EXISTS salesman;
CREATE TABLE salesman (
SALESMAN_ID 	            INTEGER NOT NULL,
SALESMAN_NAME               varchar(30),
PRIMARY KEY (SALESMAN_ID)
);

INSERT INTO salesman VALUES(11	,'Jonathan Goodwin     ');
INSERT INTO salesman VALUES(12	,'Adam Hughes          ');
INSERT INTO salesman VALUES(13	,'Mark Davenport       ');
INSERT INTO salesman VALUES(14	,'Jamie Shelley        ');
INSERT INTO salesman VALUES(15	,'Ethan Birkenhead     ');
INSERT INTO salesman VALUES(16	,'Liam Alton           ');
INSERT INTO salesman VALUES(17	,'Josh Day             ');
INSERT INTO salesman VALUES(18	,'Sean Mann            ');
INSERT INTO salesman VALUES(19	,'Evan Blake           ');
INSERT INTO salesman VALUES(20	,'Rhys Emsworth        ');
INSERT INTO salesman VALUES(21	,'Kian Wordsworth      ');
INSERT INTO salesman VALUES(22	,'Frederick Kelsey     ');
INSERT INTO salesman VALUES(23	,'Noah Turner          ');
INSERT INTO salesman VALUES(24	,'Callum Bing          ');
INSERT INTO salesman VALUES(25	,'Harri Wilberforce    ');
INSERT INTO salesman VALUES(26	,'Gabriel Gibson       ');
INSERT INTO salesman VALUES(27	,'Richard York         ');
INSERT INTO salesman VALUES(28	,'Tobias Stratford     ');
INSERT INTO salesman VALUES(29	,'Will Kirby           ');
INSERT INTO salesman VALUES(30	,'Bradley Wright       ');
INSERT INTO salesman VALUES(31	,'Eli Willoughby       ');
INSERT INTO salesman VALUES(32	,'Patrick Riley        ');
INSERT INTO salesman VALUES(33	,'Kieran Freeman       ');
INSERT INTO salesman VALUES(34	,'Toby Scott           ');
INSERT INTO salesman VALUES(35	,'Elliot Clapham       ');
INSERT INTO salesman VALUES(36	,'Lewis Moss           ');
INSERT INTO salesman VALUES(37	,'Joshua Atterton      ');
INSERT INTO salesman VALUES(38	,'Jonathan Reynolds    ');
INSERT INTO salesman VALUES(39	,'David Hill           ');
INSERT INTO salesman VALUES(40	,'Aidan Yeardley       ');
INSERT INTO salesman VALUES(41	,'Dan Astley           ');
INSERT INTO salesman VALUES(42	,'Finlay Dalton        ');
INSERT INTO salesman VALUES(43	,'Toby Rodney          ');
INSERT INTO salesman VALUES(44	,'Ollie Wheatley       ');
INSERT INTO salesman VALUES(45	,'Sean Spalding        ');
INSERT INTO salesman VALUES(46	,'Jason Wilson         ');
INSERT INTO salesman VALUES(47	,'Christopher Wentworth');
INSERT INTO salesman VALUES(48	,'Cameron Ansley       ');
INSERT INTO salesman VALUES(49	,'Henry Porter         ');
INSERT INTO salesman VALUES(50	,'Ezra Winterbourne    ');
INSERT INTO salesman VALUES(51	,'Rufus Fleming        ');
INSERT INTO salesman VALUES(52	,'Wallace Dempsey      ');
INSERT INTO salesman VALUES(53	,'Dan McKee            ');
INSERT INTO salesman VALUES(54	,'Marion Caldwell      ');
INSERT INTO salesman VALUES(55	,'Morris Phillips      ');
INSERT INTO salesman VALUES(56	,'Chester Chandler     ');
INSERT INTO salesman VALUES(57	,'Cleveland Klein      ');
INSERT INTO salesman VALUES(58	,'Hubert Bean          ');
INSERT INTO salesman VALUES(59	,'Cleveland Hart       ');
INSERT INTO salesman VALUES(60	,'Marion Gregory       ');


DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE orders (
ORDER_ID            INTEGER NOT NULL,
CUSTOMER_ID 	            INTEGER NOT NULL,
ITEM_DESC 	            varchar(30) NOT NULL,
ORDER_DATE               date NOT NULL,
PRIMARY KEY (ORDER_ID)
);

INSERT INTO orders VALUES(101,2109,'juice','2020-03-03');
INSERT INTO orders VALUES(102,2139,'chocolate','2019-03-18');
INSERT INTO orders VALUES(103,2120,'juice','2019-03-18');
INSERT INTO orders VALUES(104,2108,'cookies','2019-03-18');
INSERT INTO orders VALUES(105,2130,'juice','2020-03-28');
INSERT INTO orders VALUES(106,2103,'cake','2019-03-29');
INSERT INTO orders VALUES(107,2122,'cookies','2021-03-07');
INSERT INTO orders VALUES(108,2125,'cake','2021-03-13');
INSERT INTO orders VALUES(109,2139,'cake','2019-03-30');
INSERT INTO orders VALUES(110,2141,'cookies','2019-03-17');
INSERT INTO orders VALUES(111,2116,'cake','2020-03-31');
INSERT INTO orders VALUES(112,2128,'cake','2021-03-04');
INSERT INTO orders VALUES(113,2146,'chocolate','2021-03-04');
INSERT INTO orders VALUES(114,2119,'cookies','2020-03-28');
INSERT INTO orders VALUES(115,2142,'cake','2019-03-09');
INSERT INTO orders VALUES(116,2122,'cake','2019-03-06');
INSERT INTO orders VALUES(117,2128,'chocolate','2019-03-24');
INSERT INTO orders VALUES(118,2112,'cookies','2019-03-24');
INSERT INTO orders VALUES(119,2149,'cookies','2020-03-29');
INSERT INTO orders VALUES(120,2100,'cookies','2021-03-18');
INSERT INTO orders VALUES(121,2130,'juice','2021-03-16');
INSERT INTO orders VALUES(122,2103,'juice','2019-03-31');
INSERT INTO orders VALUES(123,2112,'cookies','2019-03-23');
INSERT INTO orders VALUES(124,2102,'cake','2020-03-25');
INSERT INTO orders VALUES(125,2120,'chocolate','2020-03-21');
INSERT INTO orders VALUES(126,2109,'cake','2019-03-22');
INSERT INTO orders VALUES(127,2101,'juice','2021-03-01');
INSERT INTO orders VALUES(128,2138,'juice','2019-03-19');
INSERT INTO orders VALUES(129,2100,'juice','2019-03-29');
INSERT INTO orders VALUES(130,2129,'juice','2021-03-02');
INSERT INTO orders VALUES(131,2123,'juice','2020-03-31');
INSERT INTO orders VALUES(132,2104,'chocolate','2020-03-31');
INSERT INTO orders VALUES(133,2110,'cake','2021-03-13');
INSERT INTO orders VALUES(134,2143,'cake','2019-03-27');
INSERT INTO orders VALUES(135,2130,'juice','2019-03-12');
INSERT INTO orders VALUES(136,2128,'juice','2020-03-28');
INSERT INTO orders VALUES(137,2133,'cookies','2019-03-21');
INSERT INTO orders VALUES(138,2150,'cookies','2019-03-20');
INSERT INTO orders VALUES(139,2120,'juice','2020-03-27');
INSERT INTO orders VALUES(140,2109,'cake','2021-03-02');
INSERT INTO orders VALUES(141,2110,'cake','2021-03-13');
INSERT INTO orders VALUES(142,2140,'juice','2019-03-09');
INSERT INTO orders VALUES(143,2112,'cookies','2021-03-04');
INSERT INTO orders VALUES(144,2117,'chocolate','2019-03-19');
INSERT INTO orders VALUES(145,2137,'cookies','2020-03-23');
INSERT INTO orders VALUES(146,2130,'cake','2021-03-09');
INSERT INTO orders VALUES(147,2133,'cake','2020-03-08');
INSERT INTO orders VALUES(148,2143,'juice','2019-03-11');
INSERT INTO orders VALUES(149,2111,'chocolate','2020-03-23');
INSERT INTO orders VALUES(150,2150,'cookies','2021-03-04');
INSERT INTO orders VALUES(151,2131,'cake','2020-03-10');
INSERT INTO orders VALUES(152,2140,'chocolate','2019-03-17');
INSERT INTO orders VALUES(153,2147,'cookies','2020-03-22');
INSERT INTO orders VALUES(154,2119,'chocolate','2019-03-15');
INSERT INTO orders VALUES(155,2116,'juice','2021-03-12');
INSERT INTO orders VALUES(156,2141,'juice','2021-03-14');
INSERT INTO orders VALUES(157,2143,'cake','2019-03-16');
INSERT INTO orders VALUES(158,2105,'cake','2020-03-21');
INSERT INTO orders VALUES(159,2149,'chocolate','2019-03-11');
INSERT INTO orders VALUES(160,2117,'cookies','2020-03-22');
INSERT INTO orders VALUES(161,2150,'cookies','2020-03-21');
INSERT INTO orders VALUES(162,2134,'cake','2019-03-08');
INSERT INTO orders VALUES(163,2133,'cookies','2019-03-26');
INSERT INTO orders VALUES(164,2127,'juice','2019-03-27');
INSERT INTO orders VALUES(165,2101,'juice','2019-03-26');
INSERT INTO orders VALUES(166,2137,'chocolate','2021-03-12');
INSERT INTO orders VALUES(167,2113,'chocolate','2019-03-21');
INSERT INTO orders VALUES(168,2141,'cake','2019-03-21');
INSERT INTO orders VALUES(169,2112,'chocolate','2021-03-14');
INSERT INTO orders VALUES(170,2118,'juice','2020-03-30');
INSERT INTO orders VALUES(171,2111,'juice','2019-03-19');
INSERT INTO orders VALUES(172,2146,'chocolate','2021-03-13');
INSERT INTO orders VALUES(173,2148,'cookies','2021-03-14');
INSERT INTO orders VALUES(174,2100,'cookies','2021-03-13');
INSERT INTO orders VALUES(175,2105,'cookies','2019-03-05');
INSERT INTO orders VALUES(176,2129,'juice','2021-03-02');
INSERT INTO orders VALUES(177,2121,'juice','2019-03-16');
INSERT INTO orders VALUES(178,2117,'cake','2020-03-11');
INSERT INTO orders VALUES(179,2133,'juice','2020-03-12');
INSERT INTO orders VALUES(180,2124,'cake','2019-03-31');
INSERT INTO orders VALUES(181,2145,'cake','2021-03-07');
INSERT INTO orders VALUES(182,2105,'cookies','2019-03-09');
INSERT INTO orders VALUES(183,2131,'juice','2019-03-09');
INSERT INTO orders VALUES(184,2114,'chocolate','2020-03-31');
INSERT INTO orders VALUES(185,2120,'juice','2021-03-06');
INSERT INTO orders VALUES(186,2130,'juice','2021-03-06');
INSERT INTO orders VALUES(187,2141,'chocolate','2019-03-11');
INSERT INTO orders VALUES(188,2147,'cake','2021-03-14');
INSERT INTO orders VALUES(189,2118,'juice','2019-03-15');
INSERT INTO orders VALUES(190,2136,'chocolate','2020-03-22');
INSERT INTO orders VALUES(191,2132,'cake','2021-03-06');
INSERT INTO orders VALUES(192,2137,'chocolate','2019-03-31');
INSERT INTO orders VALUES(193,2107,'cake','2021-03-01');
INSERT INTO orders VALUES(194,2111,'chocolate','2019-03-18');
INSERT INTO orders VALUES(195,2100,'cake','2019-03-07');
INSERT INTO orders VALUES(196,2106,'juice','2020-03-21');
INSERT INTO orders VALUES(197,2114,'cookies','2019-03-25');
INSERT INTO orders VALUES(198,2110,'cake','2019-03-27');
INSERT INTO orders VALUES(199,2130,'juice','2019-03-16');
INSERT INTO orders VALUES(200,2117,'cake','2021-03-10');

SELECT * FROM orders;

DROP TABLE IF EXISTS tablefortest; 
CREATE TABLE tablefortest(srno int,  pos_neg_val int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, -74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, -51);
INSERT INTO tablefortest VALUES (5, -9);
INSERT INTO tablefortest VALUES (6, 32);

DROP TABLE IF EXISTS tablefortest;
CREATE TABLE tablefortest(ID int,  date_of_birth date);
INSERT INTO tablefortest VALUES (1, '1907-08-15');
INSERT INTO tablefortest VALUES (2, '1883-06-27');
INSERT INTO tablefortest VALUES (3, '1900-01-01');
INSERT INTO tablefortest VALUES (4, '1901-01-01');
INSERT INTO tablefortest VALUES (5, '2005-09-01');
INSERT INTO tablefortest VALUES (6, '1775-11-23');
INSERT INTO tablefortest VALUES (7, '1800-01-01');
SELECT * FROM tablefortest;



DROP TABLE IF EXISTS tablefortest;
CREATE TABLE tablefortest(srno int,  col_val int);
INSERT INTO tablefortest VALUES (1, 56);
INSERT INTO tablefortest VALUES (2, 74);
INSERT INTO tablefortest VALUES (3, 15);
INSERT INTO tablefortest VALUES (4, 51);
INSERT INTO tablefortest VALUES (5, 9);
INSERT INTO tablefortest VALUES (6, 32);
SELECT * FROM tablefortest;

DROP TABLE IF EXISTS student_test;
CREATE TABLE student_test(student_id int,  marks_achieved int);
INSERT INTO student_test VALUES (1, 56);
INSERT INTO student_test VALUES (2, 74);
INSERT INTO student_test VALUES (3, 15);
INSERT INTO student_test VALUES (4, 74);
INSERT INTO student_test VALUES (5, 89);
INSERT INTO student_test VALUES (6, 56);
INSERT INTO student_test VALUES (7, 93);
SELECT * FROM student_test;

CREATE TABLE IF NOT EXISTS students (student_id INT,student_name VARCHAR(25),teacher_id INT);
TRUNCATE TABLE students;

CREATE TABLE IF NOT EXISTS students (student_id INT,student_name VARCHAR(25),teacher_id INT);
INSERT INTO students (student_id, student_name, teacher_id) values ('1001', 'Alex', '601');
INSERT INTO students (student_id, student_name, teacher_id) values ('1002', 'Jhon', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1003', 'Peter', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1004', 'Minto', '604');
INSERT INTO students (student_id, student_name, teacher_id) values ('1005', 'Crage', NULL);
INSERT INTO students (student_id, student_name, teacher_id) values ('1006', 'Chang', '601');
INSERT INTO students (student_id, student_name, teacher_id) values ('1007', 'Philip', '602');



DROP TABLE  IF EXISTS salemast;
CREATE TABLE salemast(salesperson_id int,  order_id int);
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5001', '1001');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5002', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5003', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5004', '1002');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5005', '1003');
INSERT INTO salemast(salesperson_id, order_id) VALUES ('5006', '1004');



CREATE TABLE cities_test (city_name varchar(255), country varchar(255), city_population int, city_area int );

INSERT INTO cities_test VALUES ('Tokyo	 		','Japan		',	13515271,	2191	);	
INSERT INTO cities_test VALUES ('Delhi	 		','India		',	16753235,	1484	);	
INSERT INTO cities_test VALUES ('Shanghai	 	','China		',	24870895,	6341	);	
INSERT INTO cities_test VALUES ('Sao Paulo	 	','Brazil		',	12252023,	1521	);	
INSERT INTO cities_test VALUES ('Mexico City	','Mexico		',	9209944,	1485	);	
INSERT INTO cities_test VALUES ('Cairo	 		','Egypt		',	9500000,	3085	);	
INSERT INTO cities_test VALUES ('Mumbai	 		','India		',	12478447,	603		);	
INSERT INTO cities_test VALUES ('Beijing	 	','China		',	21893095,	16411	);	
INSERT INTO cities_test VALUES ('Osaka	 		','Japan		',	2725006,	225		);	
INSERT INTO cities_test VALUES ('New York	 	','United States',	8398748,	786		);	
INSERT INTO cities_test VALUES ('Buenos Aires	','Argentina	',	3054300,	203		);	
INSERT INTO cities_test VALUES ('Chongqing	 	','China		',	32054159,	82403	);	
INSERT INTO cities_test VALUES ('Istanbul	 	','Turkey		',	15519267,	5196	);	
INSERT INTO cities_test VALUES ('Kolkata	 	','India		',	4496694,	205		);	
INSERT INTO cities_test VALUES ('Manila	 		','Philippines	',	1780148,	43		);	
SELECT * FROM cities_test;


CREATE TABLE orders_issued (distributor_id int, company_id int, quotation_date date);
INSERT INTO orders_issued VALUES (101, 202, '2019-11-15');
INSERT INTO orders_issued VALUES (101, 203, '2019-11-15');
INSERT INTO orders_issued VALUES (101, 204, '2019-11-15');
INSERT INTO orders_issued VALUES (102, 202, '2019-11-16');
INSERT INTO orders_issued VALUES (102, 201, '2019-11-15');
INSERT INTO orders_issued VALUES (103, 203, '2019-11-17');
INSERT INTO orders_issued VALUES (103, 202, '2019-11-17');
INSERT INTO orders_issued VALUES (104, 203, '2019-11-18');
INSERT INTO orders_issued VALUES (104, 204, '2019-11-18');

CREATE TABLE orders_executed (orders_from int, executed_from int, executed_date date);
INSERT INTO orders_executed VALUES (101, 202, '2019-11-17');
INSERT INTO orders_executed VALUES (101, 203, '2019-11-17');
INSERT INTO orders_executed VALUES (102, 202, '2019-11-17');
INSERT INTO orders_executed VALUES (103, 203, '2019-11-18');
INSERT INTO orders_executed VALUES (103, 202, '2019-11-19');
INSERT INTO orders_executed VALUES (104, 203, '2019-11-20');

CREATE TABLE match_crowd (match_no int, match_date date not null unique, audience int);
INSERT INTO match_crowd VALUES ( 1,'2016-06-11',  75113 );
INSERT INTO match_crowd VALUES ( 2,'2016-06-12',  62343 );
INSERT INTO match_crowd VALUES ( 3,'2016-06-13',  43035 );
INSERT INTO match_crowd VALUES ( 4,'2016-06-14',  55408 );
INSERT INTO match_crowd VALUES ( 5,'2016-06-15',  38742 );
INSERT INTO match_crowd VALUES ( 6,'2016-06-16',  63670 );
INSERT INTO match_crowd VALUES ( 7,'2016-06-17',  73648 );
INSERT INTO match_crowd VALUES ( 8,'2016-06-18',  52409 );
INSERT INTO match_crowd VALUES ( 9,'2016-06-19',  67291 );
INSERT INTO match_crowd VALUES (10,'2016-06-20',  49752 );
INSERT INTO match_crowd VALUES (11,'2016-06-21',  28840 );
INSERT INTO match_crowd VALUES (12,'2016-06-22',  32836 );
INSERT INTO match_crowd VALUES (13,'2016-06-23',  44268 );



CREATE TABLE dr_clinic (visiting_date date primary key, availability bool);

INSERT INTO dr_clinic VALUES ('2016-06-11','1');
INSERT INTO dr_clinic VALUES ('2016-06-12','1');
INSERT INTO dr_clinic VALUES ('2016-06-13','0');
INSERT INTO dr_clinic VALUES ('2016-06-14','1');
INSERT INTO dr_clinic VALUES ('2016-06-15','0');
INSERT INTO dr_clinic VALUES ('2016-06-16','0');
INSERT INTO dr_clinic VALUES ('2016-06-17','1');
INSERT INTO dr_clinic VALUES ('2016-06-18','1');
INSERT INTO dr_clinic VALUES ('2016-06-19','1');
INSERT INTO dr_clinic VALUES ('2016-06-20','1');	   
INSERT INTO dr_clinic VALUES ('2016-06-21','1');


DROP TABLE if exists customers;
CREATE TABLE customers (customer_id int, customer_name varchar(255), customer_city varchar(255), avg_profit int);
INSERT INTO customers  VALUES ('101', 'Liam','New York',25000);
INSERT INTO customers  VALUES ('102', 'Josh','Atlanta',22000);
INSERT INTO customers  VALUES ('103', 'Sean','New York',27000);
INSERT INTO customers  VALUES ('104', 'Evan','Toronto',15000);
INSERT INTO customers  VALUES ('105', 'Toby','Dallas',20000);

CREATE TABLE supplier (supplier_id int, supplier_name varchar(255), supplier_city varchar(255));
INSERT INTO supplier  VALUES ('501', 'ABC INC','Dallas');
INSERT INTO supplier  VALUES ('502', 'DCX LTD','Atlanta');
INSERT INTO supplier  VALUES ('503', 'PUC ENT','New York');
INSERT INTO supplier  VALUES ('504', 'JCR INC','Toronto');


CREATE TABLE orders (order_id int, customer_id int, supplier_id int, order_date Date, order_amount int);
INSERT INTO orders  VALUES (401, 103,501,'2012-03-08','4500');
INSERT INTO orders  VALUES (402, 101,503,'2012-09-15','3650');
INSERT INTO orders  VALUES (403, 102,503,'2012-06-27','4800');
INSERT INTO orders  VALUES (404, 104,502,'2012-06-17','5600');
INSERT INTO orders  VALUES (405, 104,504,'2012-06-22','6000');
INSERT INTO orders  VALUES (406, 105,502,'2012-06-25','5600');


SELECT * FROM customers;
SELECT * FROM supplier;
SELECT * FROM orders; 


CREATE TABLE students(student_id int, student_name varchar(255), marks_achieved int);

INSERT INTO students VALUES(1, 'Alex',87);
INSERT INTO students VALUES(2, 'Jhon',92);
INSERT INTO students VALUES(3, 'Pain',83);
INSERT INTO students VALUES(4, 'Danny',87);
INSERT INTO students VALUES(5, 'Paul',92);
INSERT INTO students VALUES(6, 'Rex',89);
INSERT INTO students VALUES(7, 'Philip',87);
INSERT INTO students VALUES(8, 'Josh',83);
INSERT INTO students VALUES(9, 'Evan',92);
INSERT INTO students VALUES(10, 'Larry',87);

SELECT * FROM students;

drop table students ;




CREATE TABLE bed_info(bed_id int, student_name varchar(255));
INSERT INTO bed_info VALUES (101, 'Alex');
INSERT INTO bed_info VALUES (102, 'Jhon');
INSERT INTO bed_info VALUES (103, 'Pain');
INSERT INTO bed_info VALUES (104, 'Danny');
INSERT INTO bed_info VALUES (105, 'Paul');
INSERT INTO bed_info VALUES (106, 'Rex');
INSERT INTO bed_info VALUES (107, 'Philip');
INSERT INTO bed_info VALUES (108, 'Josh');
INSERT INTO bed_info VALUES (109, 'Evan');
INSERT INTO bed_info VALUES (110, 'Green');


DROP TABLE IF EXISTS bank_trans;
CREATE TABLE bank_trans(trans_id int, customer_id int, login_date date);
INSERT INTO bank_trans VALUES (101, 3002, '2019-09-01');
INSERT INTO bank_trans VALUES (101, 3002, '2019-08-01');
INSERT INTO bank_trans VALUES (102, 3003, '2018-09-13');
INSERT INTO bank_trans VALUES (102, 3002, '2018-07-24');
INSERT INTO bank_trans VALUES (103, 3001, '2019-09-25');
INSERT INTO bank_trans VALUES (102, 3004, '2017-09-05');


drop table salemast;

CREATE TABLE salemast(salesman_id int, salesman_name varchar(255), yearly_sale int);
INSERT INTO salemast VALUES (101, 'Adam', 250000);
INSERT INTO salemast VALUES (103, 'Mark', 100000);
INSERT INTO salemast VALUES (104, 'Liam', 200000);
INSERT INTO salemast VALUES (102, 'Evan', 150000);
INSERT INTO salemast VALUES (105, 'Blake', 275000);
INSERT INTO salemast VALUES (106, 'Noah', 50000);
SELECT * FROM  salemast;
CREATE TABLE commision (salesman_id int, commision_amt int);
INSERT INTO commision VALUES (101, 10000);
INSERT INTO commision VALUES (103, 4000);
INSERT INTO commision VALUES (104, 8000);
INSERT INTO commision VALUES (102, 6000);
INSERT INTO commision VALUES (105, 11000);
SELECT * FROM  commision;


CREATE TABLE items (item_code int not null unique, item_name varchar(255));
INSERT INTO items VALUES (10091,'juice');
INSERT INTO items VALUES (10092,'chocolate');
INSERT INTO items VALUES (10093,'cookies');
INSERT INTO items VALUES (10094,'cake');

drop table orders ;

CREATE TABLE orders (order_id int, distributor_id int, item_ordered int, item_quantity int,
foreign key(item_ordered) references items(item_code));
INSERT INTO orders VALUES (1,501,10091,250);
INSERT INTO orders VALUES (2,502,10093,100);
INSERT INTO orders VALUES (3,503,10091,200);
INSERT INTO orders VALUES (4,502,10091,150);
INSERT INTO orders VALUES (5,502,10092,300);
INSERT INTO orders VALUES (6,504,10094,200);
INSERT INTO orders VALUES (7,503,10093,250);
INSERT INTO orders VALUES (8,503,10092,250);
INSERT INTO orders VALUES (9,501,10094,180);
INSERT INTO orders VALUES (10,503,10094,350);


CREATE TABLE actor_test (act_id int not null unique, act_name varchar(255));
INSERT INTO actor_test VALUES( 101,'James Stewart');  
INSERT INTO actor_test VALUES( 102,'Deborah Kerr');  
INSERT INTO actor_test VALUES( 103,'Peter OToole');  
INSERT INTO actor_test VALUES( 104,'Robert De Niro');  
INSERT INTO actor_test VALUES( 105,'F. Murray Abraham');  
INSERT INTO actor_test VALUES( 106,'Harrison Ford');  
INSERT INTO actor_test VALUES( 107,'Bill Paxton');  
INSERT INTO actor_test VALUES( 108,'Stephen Baldwin');  
INSERT INTO actor_test VALUES( 109,'Jack Nicholson');  
INSERT INTO actor_test VALUES( 110,'Mark Wahlberg');

CREATE TABLE director_test (dir_id int not null unique, dir_name varchar(255));
INSERT INTO director_test VALUES(201,'Alfred Hitchcock ');
INSERT INTO director_test VALUES(202,'Jack Clayton');
INSERT INTO director_test VALUES(203,'James Cameron');
INSERT INTO director_test VALUES(204,'Michael Cimino');
INSERT INTO director_test VALUES(205,'Milos Forman');
INSERT INTO director_test VALUES(206,'Ridley Scott');
INSERT INTO director_test VALUES(207,'Stanley Kubrick');
INSERT INTO director_test VALUES(208,'Bryan Singer');
INSERT INTO director_test VALUES(209,'Roman Polanski');

CREATE TABLE movie_test(mov_id int not null unique, movie_name varchar(255));
INSERT INTO movie_test VALUES(901,'Vertigo');                     
INSERT INTO movie_test VALUES(902,'Aliens');                     
INSERT INTO movie_test VALUES(903,'Lawrence of Arabia');                     
INSERT INTO movie_test VALUES(904,'The Deer Hunter');                     
INSERT INTO movie_test VALUES(905,'True Lies');                     
INSERT INTO movie_test VALUES(906,'Blade Runner');                     
INSERT INTO movie_test VALUES(907,'Eyes Wide Shut');                     
INSERT INTO movie_test VALUES(908,'Titanic');                     
INSERT INTO movie_test VALUES(909,'Chinatown');                     
INSERT INTO movie_test VALUES(910,'Ghosts of the Abyss');

CREATE TABLE mov_direction_test (dir_id int, mov_id int, act_id int,
FOREIGN KEY(dir_id) REFERENCES director_test(dir_id),
FOREIGN KEY(act_id) REFERENCES actor_test(act_id),
FOREIGN KEY(mov_id) REFERENCES movie_test(mov_id)
);

INSERT INTO mov_direction_test VALUES(201,901,101);
INSERT INTO mov_direction_test VALUES(203,902,107);
INSERT INTO mov_direction_test VALUES(204,904,104);
INSERT INTO mov_direction_test VALUES(203,905,107);
INSERT INTO mov_direction_test VALUES(206,906,106);
INSERT INTO mov_direction_test VALUES(203,908,107);
INSERT INTO mov_direction_test VALUES(209,909,109);
INSERT INTO mov_direction_test VALUES(203,910,107);



CREATE TABLE exam_test (exam_id int not null, subject_id int not null, exam_year int not null, no_of_student int,
primary key (exam_id,subject_id,exam_year));
INSERT INTO exam_test VALUES (71,201,2017,5146);
INSERT INTO exam_test VALUES (72,202,2017,3651);
INSERT INTO exam_test VALUES (73,202,2018,4501);
INSERT INTO exam_test VALUES (71,202,2018,5945);
INSERT INTO exam_test VALUES (73,201,2018,2647);
INSERT INTO exam_test VALUES (71,201,2018,3545);
INSERT INTO exam_test VALUES (73,201,2019,2647);
INSERT INTO exam_test VALUES (72,201,2018,3500);
INSERT INTO exam_test VALUES (71,203,2017,2500);
INSERT INTO exam_test VALUES (71,202,2019,2500);

CREATE TABLE subject_test (subject_id int not null unique, subject_name varchar(255));
INSERT INTO subject_test VALUES (201,'Mathematics');
INSERT INTO subject_test VALUES (202,'Physics');
INSERT INTO subject_test VALUES (203,'Chemistry');




CREATE TABLE exam_test (exam_id int not null, subject_id int not null, exam_year int not null, no_of_student int,
primary key (exam_id,subject_id,exam_year));
INSERT INTO exam_test VALUES (71,201,2017,5146);
INSERT INTO exam_test VALUES (72,202,2017,3651);
INSERT INTO exam_test VALUES (73,202,2018,4501);
INSERT INTO exam_test VALUES (71,202,2018,5945);
INSERT INTO exam_test VALUES (73,201,2018,2647);
INSERT INTO exam_test VALUES (71,201,2018,3545);
INSERT INTO exam_test VALUES (73,201,2019,2647);
INSERT INTO exam_test VALUES (72,201,2018,3500);
INSERT INTO exam_test VALUES (71,203,2017,2500);
INSERT INTO exam_test VALUES (71,202,2019,2500);

CREATE TABLE subject_test (subject_id int not null unique, subject_name varchar(255));
INSERT INTO subject_test VALUES (201,'Mathematics');
INSERT INTO subject_test VALUES (202,'Physics');
INSERT INTO subject_test VALUES (203,'Chemistry');





CREATE TABLE managing_body (manager_id int NOT NULL UNIQUE, manager_name varchar(255), running_years int);

INSERT INTO managing_body VALUES(51,'James',5);
INSERT INTO managing_body VALUES(52,'Cork',3);
INSERT INTO managing_body VALUES(53,'Paul',4);
INSERT INTO managing_body VALUES(54,'Adam',3);
INSERT INTO managing_body VALUES(55,'Hense',4);
INSERT INTO managing_body VALUES(56,'Peter',2);



CREATE TABLE scheme (scheme_code int NOT NULL , scheme_manager_id int NOT NULL, 
PRIMARY KEY(scheme_code,scheme_manager_id));
INSERT INTO scheme VALUES(1001,	51);
INSERT INTO scheme VALUES(1001,	53);
INSERT INTO scheme VALUES(1001,	54);
INSERT INTO scheme VALUES(1001,	56);
INSERT INTO scheme VALUES(1002,	51);
INSERT INTO scheme VALUES(1002,	55);
INSERT INTO scheme VALUES(1003,	51);
INSERT INTO scheme VALUES(1004,	52);

CREATE TABLE managing_body (manager_id int NOT NULL UNIQUE, manager_name varchar(255), running_years int);

INSERT INTO managing_body VALUES(51,'James',5);
INSERT INTO managing_body VALUES(52,'Cork',3);
INSERT INTO managing_body VALUES(53,'Paul',4);
INSERT INTO managing_body VALUES(54,'Adam',3);
INSERT INTO managing_body VALUES(55,'Hense',4);
INSERT INTO managing_body VALUES(56,'Peter',2);


CREATE TABLE item (item_code int not null unique, item_desc varchar(255), cost int);
INSERT INTO item VALUES(101,'mother board',	2700);
INSERT INTO item VALUES(102,'RAM',	800);
INSERT INTO item VALUES(103,'key board',300);
INSERT INTO item VALUES(104,'mouse',300);


CREATE TABLE sales_info (distributor_id int, item_code int, retailer_id int, date_of_sell date, quantity int, total_cost int);
INSERT INTO sales_info VALUES(5001,101,1001,'2020-02-12',3,8100);
INSERT INTO sales_info VALUES(5001,103,1002,'2020-03-15',15,4500);
INSERT INTO sales_info VALUES(5002,101,1001,'2019-06-24',2,5400);
INSERT INTO sales_info VALUES(5001,104,1003,'2019-09-11',8,2400);
INSERT INTO sales_info VALUES(5003,101,1003,'2020-10-21',5,13500);
INSERT INTO sales_info VALUES(5003,104,1002,'2020-12-27',10,3000);
INSERT INTO sales_info VALUES(5002,102,1001,'2019-05-18',12,9600);
INSERT INTO sales_info VALUES(5002,103,1004,'2020-06-17',8,2400);
INSERT INTO sales_info VALUES(5003,103,1001,'2020-04-12',3,900);



CREATE TABLE purchase (customer_id int not null, item_code int not null, purch_qty int not null);
INSERT INTO purchase VALUES (101,504,25 );
INSERT INTO purchase VALUES (101,503,50 );
INSERT INTO purchase VALUES (102,502,40 );
INSERT INTO purchase VALUES (102,503,25 );
INSERT INTO purchase VALUES (102,501,45 );
INSERT INTO purchase VALUES (103,505,30 );
INSERT INTO purchase VALUES (103,503,25 );
INSERT INTO purchase VALUES (104,505,40 );
INSERT INTO purchase VALUES (101,502,25 );
INSERT INTO purchase VALUES (102,504,40 );
INSERT INTO purchase VALUES (102,505,50 );
INSERT INTO purchase VALUES (103,502,25 );
INSERT INTO purchase VALUES (104,504,40 );
INSERT INTO purchase VALUES (103,501,35 );


CREATE TABLE topics (topic_id int, writer_id int, rated_by int, date_of_rating date);
INSERT INTO topics VALUES (10001,504,507,'2020-07-17');
INSERT INTO topics VALUES (10003,502,503,'2020-09-22'); 
INSERT INTO topics VALUES (10001,503,507,'2020-02-07'); 
INSERT INTO topics VALUES (10002,501,507,'2020-05-13'); 
INSERT INTO topics VALUES (10002,502,502,'2020-04-10'); 
INSERT INTO topics VALUES (10002,504,502,'2020-11-16'); 
INSERT INTO topics VALUES (10003,501,502,'2020-10-05'); 
INSERT INTO topics VALUES (10001,507,507,'2020-12-23'); 
INSERT INTO topics VALUES (10004,503,501,'2020-08-28'); 
INSERT INTO topics VALUES (10003,505,504,'2020-12-21');  


CREATE TABLE sale (product_id int not null, sale_qty int, qtr_no varchar(25) not null,
PRIMARY KEY(product_id,qtr_no));
INSERT INTO sale VALUES (3,20000,'qtr1');
INSERT INTO sale VALUES (2,12000,'qtr2');
INSERT INTO sale VALUES (3,23000,'qtr3');
INSERT INTO sale VALUES (1,10000,'qtr2');
INSERT INTO sale VALUES (3,15000,'qtr2');
INSERT INTO sale VALUES (1,15000,'qtr1');
INSERT INTO sale VALUES (4,25000,'qtr2');
INSERT INTO sale VALUES (2,20000,'qtr1');
INSERT INTO sale VALUES (4,18000,'qtr4');
INSERT INTO sale VALUES (3,22000,'qtr4');


CREATE TABLE order_stat (order_id int not null unique, com_name varchar(25), ord_qty int, ord_stat varchar(25), stat_date date);

INSERT INTO order_stat VALUES (151, 'MMS INC'		,500,	'Booked',		'2020-08-15');
INSERT INTO order_stat VALUES (152, 'BCT LTD'		,300,	'Cancelled',	'2020-08-15');
INSERT INTO order_stat VALUES (153, 'MMS INC'		,400,	'Cancelled',	'2020-08-26');
INSERT INTO order_stat VALUES (154, 'XYZ COR'		,500,	'Booked',		'2020-08-15');
INSERT INTO order_stat VALUES (155, 'MMS INC'		,500,	'Cancelled',	'2020-10-11');
INSERT INTO order_stat VALUES (156, 'BWD PRO LTD'	,250,	'Cancelled',	'2020-11-15');
INSERT INTO order_stat VALUES (157, 'BCT LTD'		,600,	'Booked',		'2020-10-07');
INSERT INTO order_stat VALUES (158, 'MMS INC'		,300,	'Booked',		'2020-12-11');
INSERT INTO order_stat VALUES (159, 'XYZ COR'		,300,	'Booked',		'2020-08-26');
INSERT INTO order_stat VALUES (160, 'BCT LTD'		,400,	'Booked',		'2020-11-15');



