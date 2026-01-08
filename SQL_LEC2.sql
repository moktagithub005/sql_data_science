-- lec 2 in sql 
USE salesdb;

SELECT 
country,
COUNT(customerid) AS total
FROM customers
GROUP BY country
HAVING COUNT(customerid) > 2;
-- 
SELECT 
	country,
	SUM(score)
FROM customers
GROUP BY country
HAVING SUM(score)>900;

SELECT 
country,
AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

-- DISTINCT AND TOP
SELECT DISTINCT
country
FROM customers;

-- LIMIT
SELECT * 
FROM customers
ORDER BY score DESC
LIMIT 3;
