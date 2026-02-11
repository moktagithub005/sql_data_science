-- SQL FUNCTIONS
USE salesdb;

SELECT CONCAT(firstname, " " , lastname) AS full_name
FROM customers;

SELECT CONCAT(firstname, "-" , country) AS full_name_with_country
FROM customers;

-- UPPER AND LOWER

SELECT 
firstname,
CONCAT(firstname, "-", country) AS first_country,
UPPER(firstname) AS first_up,
LOWER(firstname) AS first_lower
FROM customers;

-- TRIM 
SELECT
firstname
FROM customers
WHERE firstname != TRIM(firstname);

-- LEN
SELECT
firstname,
LENGTH(firstname) len_name,
LENGTH(TRIM(firstname)) len_trim_name,
LENGTH(firstname) - LENGTH(TRIM(firstname)) flag
FROM customers;

-- REPLACE 
SELECT 
'123-456-7890' AS phone,
REPLACE('123-456-7890','-','') AS clean_phone;

-- LEFT
SELECT 
firstname,
LEFT(firstname,1) AS first_2_char
FROM customers;

-- RIGHT
SELECT 
firstname,
RIGHT(firstname,1) AS first_2_char
FROM customers;

-- SUBSTRING
SELECT 
firstname,
SUBSTRING(TRIM(firstname),2,LENGTH(firstname)) As sub_name
FROM customers;

-- ROUND
SELECT
3.516,
ROUND(3.516,2) AS round_2,
ROUND(3.516,1) AS round_1,
ROUND(3.516,0) AS round_0;

-- abs
 SELECT
 -10,
 ABS(-10) AS abs_10


