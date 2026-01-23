-- joins 
USE salesdb;
-- no joins
SELECT * 
FROM customers;

SELECT *
FROM products;

-- INNER JOIN
SELECT *
FROM customers c
INNER JOIN orders o
ON c.customerid = o.orderid;

-- column selection
SELECT 
	c.firstname,
	o.sales
FROM customers c
INNER JOIN orders o
ON c.customerid = o.orderid;

-- LEFT JOIN
SELECT
	c.customerid,
	c.firstname,
	o.sales,
	o.orderid
FROM orders AS o
LEFT JOIN customers AS c
ON  o.orderid = c.customerid;

-- RIGHT JOIN 
SELECT 
c.customerid,
c.firstname,
o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customerid = o.orderid;

--  FULL JOIN
SELECT 
	c.customerid,
	c.firstname,
	o.sales
FROM customers c
FULL JOIN orders o
ON c.customerid = o.orderid;

-- LEFT ANTI JOIN
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
WHERE o.customerid IS NULL;

-- FULL ANTI JOIN
SELECT *
FROM orders o
FULL  JOIN customers c
ON o.customerid = c.customerid
WHERE c.customerid IS NULL OR o.customerid IS NULL;

-- CROSS JOIN 
SELECT *
FROM customers
CROSS JOIN orders;

-- question 1
SELECT 
c.firstname,
COUNT(o.orderid) AS totalorders
FROM customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
GROUP BY c.firstname ;

-- QUESTION 2
SELECT 
	e.firstname
FROM employees e
LEFT JOIN orders o
ON e.employeeid= o.salespersonid
WHERE o.orderid IS NULL;

-- question 3
SELECT
	o.orderid,
	p.product,
	o.sales,
	p.price
FROM orders o
 LEFT JOIN products p
ON o.productid = p.productid
WHERE o.sales != p.price;

-- multiple joins
SELECT 
o.orderid,
o.sales,
c.firstname,
c.lastname,
p.product,
p.price,
e.firstname
FROM orders o
LEFT JOIN customers c
ON o.customerid = c.customerid
LEFT JOIN products p
ON o.productid = p.productid
LEFT JOIN employees e 
ON o.salespersonid = e.employeeid;

-- question 4
SELECT
	o.orderid,
	oa.orderid
FROM orders o
LEFT JOIN orders_archive oa
ON o.orderid = oa.orderid
WHERE oa.orderid IS NULL



