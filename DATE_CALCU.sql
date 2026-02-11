-- date calculation
SELECT 
DATE_ADD('2026-02-09',INTERVAL 2 DAY);

-- MONTH
SELECT 
DATE_ADD('2026-02-09',INTERVAL 2 MONTH);

-- YEAR 
SELECT 
DATE_ADD('2026-02-09',INTERVAL 2 YEAR);

-- DATE_SUB()
SELECT 
DATE_SUB('2026-02-09',INTERVAL 9 DAY);

-- MONTH
SELECT 
DATE_SUB('2026-02-09',INTERVAL 9 MONTH);

-- YEAR 
SELECT 
DATE_SUB('2026-02-09',INTERVAL 9 YEAR);

-- DATEDIFF
SELECT
DATEDIFF('2027-02-09','2026-02-09'); -- IT INGNORE TIME PART

-- STR_TO_DATE()
SELECT 
STR_TO_DATE('2026-02-09','%Y-%m-%d');

SELECT 
STR_TO_DATE('123','%Y-%m-%d');

-- validation str_to_date
SELECT 
	CASE
	WHEN STR_TO_DATE('2026-02-30','%Y-%m-%d') IS NULL
	THEN 'INVALID'
	ELSE 'VALID DATE'
END AS DateStatus;

-- timestampdiff
SELECT TIMESTAMPDIFF(YEAR,'2002-06-08','2026-02-10');

-- RANDM QUERY
SELECT 
employeeid,
birthdate,
TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS age
FROM salesdb.employees;

-- lag()
SELECT 
orderid,
orderdate AS currentO_date,
LAG(orderdate) OVER(ORDER BY orderdate) AS previous_Odate,
DATEDIFF(orderdate,LAG(orderdate) OVER(ORDER BY orderdate)) AS NrOfdays
FROM salesdb.orders;

