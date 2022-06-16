

Select random();

Select random () * 10+5;

Select floor(random () * 10+5) :: int ;

select floor(3.7); 

--------------------------------------------------------------

CREATE OR REPLACE FUNCTION Random_Test (Min INT ,MAX INT) RETURNS INT AS
$$
BEGIN
RETURN floor(random()* (MAX-Min + 1) + Min);
END;
$$ language 'plpgsql' STRICT;


SELECT Random_Test(100,1000);

SELECT Random_Test(100,1000);

------------------------------------------------------------------------

SELECT * FROM generate_series(1,10);
























