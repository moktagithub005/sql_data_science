 -- SET Operator
 ## RULE NO.1
 SELECT 
 o.firstname
 FROM customers o
 UNION
 SELECT 
 e.firstname
 FROM employees e
 ORDER BY firstname;
 
 -- UNION
  SELECT 
 o.firstname,
 o.lastname
 FROM customers o
 UNION
 SELECT 
 e.firstname,
 e.lastname
 FROM employees e;
 
 -- UNION ALL
 SELECT 
 o.firstname,
 o.lastname
 FROM customers o
 UNION ALL
 SELECT 
 e.firstname,
 e.lastname
 FROM employees e;
 
 -- EXCEPT
 SELECT 
 e.firstname,
 e.lastname
 FROM employees e
 EXCEPT
 SELECT
 o.firstname,
 o.lastname
 FROM customers o;
 
 -- INTERSECT
 SELECT 
 e.firstname,
 e.lastname
 FROM employees e
 INTERSECT
 SELECT
 o.firstname,
 o.lastname
 FROM customers o;
 
 SELECT firstname, lastname
 FROM customers
 WHERE score  > 500
 UNION 
 SELECT firstname, lastname
 FROM employees 
 WHERE salary > 60000
 ORDER BY firstname
 LIMIT 3;
 
 
 
