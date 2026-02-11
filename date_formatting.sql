-- date time function
USE salesdb;

-- DAY() MONTH() YEAR()

SELECT 
DAY('2026-02-04') AS date_part,
MONTH('2026-02-04') AS month_part,
YEAR('2026-02-04') AS YEAR_part;

-- use column
SELECT 
orderid,
orderdate,
DAY(orderdate) AS day,
MONTH(orderdate) AS month,
YEAR(orderdate) AS year
FROM salesdb.orders;

-- WHERE CALUSE 
SELECT * 
FROM salesdb.orders
WHERE YEAR(orderdate) = 2025;

--  current date
SELECT
DAY(CURDATE()),
MONTH(CURDATE()),
YEAR(CURDATE());

-- QUARTER
SELECT
QUARTER('2026-12-04');

-- WEEK 
SELECT
WEEK('2026-02-04');

-- MONTHNAME
SELECT 
MONTHNAME('2026-02-04');

-- DAYNMAE 
SELECT 
DAYNAME('2026-02-04');

-- DAYOFYEAR
SELECT 
DAYOFYEAR('2026-02-04');

-- DAYOFWEEK
SELECT
DAYOFWEEK('2026-02-04');

-- Q3
SELECT 
MONTHNAME(orderdate) AS OrderMonth,
COUNT(*) AS NrOfOrders
FROM salesdb.orders
GROUP BY MONTHNAME(orderdate);

-- 
SELECT *
FROM salesdb.orders
WHERE MONTH(orderdate) = 2;

-- DATE_FORMATE
SELECT 
orderid,
creationtime,
DATE_FORMAT(creationtime,'%d') AS creation_day
FROM salesdb.orders;

-- %a 
SELECT 
orderid,
creationtime,
DATE_FORMAT(creationtime, "%a") AS abb_day
FROM salesdb.orders;
 -- % w
 SELECT 
 orderid,
 creationtime,
 DATE_FORMAT(creationtime,"%W") AS full_day
 FROM salesdb.orders;
 
 -- date format month
 SELECT 
 orderid,
 creationtime,
 DATE_FORMAT(creationtime,"%m") AS creation_month,
 DATE_FORMAT(creationtime,"%b") AS abb_month,
 DATE_FORMAT(creationtime,"%M") AS full_month
 FROM salesdb.orders;
 
 -- indian format
 SELECT 
 orderid,
 creationtime,
 DATE_FORMAT(creationtime,"%d-%m-%Y") AS ind_std
 FROM salesdb.orders;
 
 
 -- sql task 
 SELECT 
 orderid,
 creationtime,
 CONCAT(
 'DAY ',
 DATE_FORMAT(creationtime,"%a %b"),
 ' Q',QUARTER(creationtime)," ",
 DATE_FORMAT(creationtime,"%Y %h: %i: %s %p")
 ) AS custom_format
 FROM salesdb.orders;
 
 -- aggregation
 
 -- CONVERT 
 SELECT 
 CONVERT('123',SIGNED) AS string_to_in_conv,
 CONVERT(creationtime,DATE)
 FROM salesdb.orders;
 
 SELECT 
 CAST('123' AS SIGNED) AS string_to_in_conv
 