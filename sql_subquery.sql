-- sub query
-- query inside another query 
-- non- correlated subquery
SELECT *
FROM salesdb.orders
WHERE sales > (
SELECT 
AVG(sales) AS AvgSales
FROM salesdb.orders
);

-- correlated query
SELECT *
FROM salesdb.orders AS o
WHERE o.sales >(
SELECT 
AVG(sales)
FROM salesdb.orders
WHERE productid =  o.productid
);

-- scalar subquery
SELECT 
AVG(sales)
FROM salesdb.orders;

-- use scalar subquery inside WHERE clause 
SELECT 
*
FROM salesdb.orders
WHERE sales >(
SELECT 
AVG(sales)
FROM salesdb.orders
);

-- ROW SUBQUERY
SELECT 
*
FROM salesdb.orders
WHERE(productid,sales)=(
SELECT  productid, sales
FROM salesdb.orders
WHERE orderid = 3
);

-- TABLE SUBQUERY
SELECT *
FROM(
SELECT
productid,
SUM(sales) AS total_sales
FROM salesdb.orders
GROUP BY productid
) AS t
WHERE total_sales > 100;

-- rank customers  based on sum of sales 
SELECT
t.customerid,
t.total_sales,
RANK() OVER(ORDER BY t.total_sales DESC) AS customer_rank
FROM (
SELECT 
customerid,
SUM(sales) AS total_sales
FROM salesdb.orders
GROUP BY customerid
) AS t
