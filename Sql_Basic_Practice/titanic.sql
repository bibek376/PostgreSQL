-- Let's Use the testdb Database
USE testdb;

-- Let's Drop the table ConsumerComplaints
DROP TABLE `P9-ConsumerComplaints`;

-- Select All the data which is present in titanic_train Column
SELECT * FROM titanic_train;

-- Select All the person who servived
SELECT * FROM titanic_train 
WHERE Survived>0
ORDER BY Name;

-- Select Name and Ticket Column From Table And Sorted By Name
SELECT Name,Ticket FROM titanic_train
ORDER BY Name;

-- Select unique passenger class in a database
SELECT DISTINCT pclass FROM titanic_train;

-- Select Person From Pclass 1 And 2
SELECT * FROM titanic_train 
WHERE Pclass IN(1,2);


-- Total Number Of Survived 
SELECT COUNT(Survived) FROM titanic_train
WHERE Survived>0;

-- Average Age In Database 
SELECT AVG(Age) FROM titanic_train;


-- Select Person Whose Age is Between 20 To  30.
SELECT * FROM titanic_train 
WHERE Age BETWEEN 20 AND 30
ORDER BY Name;