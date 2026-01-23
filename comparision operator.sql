USE salesdb;
--  comparision opertator


-- EQUAL OPERATOR
SELECT *
FROM customers
WHERE country='Germany';

-- != (not equl to)
SELECT *
FROM customers
WHERE country!='Germany';

-- >  
SELECT * 
FROM customers 
WHERE score > 500;

-- >= 
SELECT * 
FROM customers 
WHERE score >= 500;

-- logocal operator  \
-- AND
SELECT * 
FROM customers
WHERE country = 'india' AND score > 800;

-- OR
SELECT * 
FROM customers
WHERE country = 'india' OR score > 800;

-- NOT
SELECT *
FROM customers
WHERE NOT score < 500;

-- RANGE OPERATOR 
-- BETWEEN
SELECT *
 FROM customers
 WHERE score BETWEEN 100 AND 500;
 
 SELECT * 
FROM customers
WHERE score >= 100 AND score <= 500;

-- IN 
SELECT *
FROM customers 
WHERE country IN('Germany','india','UK');

-- same thing yo can do with the OP operator

-- search operator 
SELECT *
FROM customers
WHERE firstname LIKE 'M%'




