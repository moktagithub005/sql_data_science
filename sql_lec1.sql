-- DQL 
-- SELECT and FROM
USE salesdb;

SELECT 
firstname,
country,
score
FROM customers;

-- WHERE CLAUSE
SELECT 
score
FROM customers
WHERE country='india';

-- sort your data
-- ASC and DESC
SELECT *
FROM customers
ORDER BY score  DESC;

SELECT *
FROM customers
ORDER BY score  ASC;

-- NESTED SORTING
SELECT *
FROM customers
ORDER BY 
	country ASC,
	score DESC;
-- GROUP BY 
SELECT 
country,
SUM(score) AS  total_score
FROM customers
GROUP BY country
