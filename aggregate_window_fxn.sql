USE salesdb;
-- find how many orders exist for each product, while keeping every oreder row visible
SELECT 
o.orderid,
o.productid,
COUNT(1) OVER(PARTITION BY o.productid) AS orders_per_product
FROM salesdb.orders AS o;

-- count only orders that have a non NULL sales value per product
SELECT
o.orderid,
o.productid,
COUNT(sales) OVER(PARTITION BY productid) AS non_null_sales
FROM salesdb.orders AS o;

-- find total orders and still shows order level detail 
SELECT 
o.orderid,
o.orderdate,
COUNT(*) OVER() AS total_orders
FROM salesdb.orders AS o;

-- FIND HOW MANY ORDERS EACH CUSTOMERS PLACED, PER ORDER ROW
SELECT 
o.orderid,
o.customerid,
COUNT(*) OVER(PARTITION BY o.customerid) AS orders_per_customer
FROM salesdb.orders AS o;

--  find how many customers actually have score
SELECT 
c.customerid,
COUNT(c.score) OVER() AS total_sales
FROM salesdb.customers AS c;

-- detection of duplocates by COUNT() window function
-- verify weather orderid contains duplicate or not
SELECT
o.orderid,
COUNT(*) over(PARTITION BY o.orderid) AS check_pri_key
FROM salesdb.orders AS o;

-- identify duplicates orderid values in archived data
SELECT *
FROM(
SELECT
oa.orderid,
COUNT(*) over(PARTITION BY oa.orderid) AS check_pri_key
FROM salesdb.orders_archive AS oa
) AS sub
WHERE check_pri_key > 1;
-- SUM()
-- TASK 1 : find total sales for each product while keeping every order row
SELECT 
o.orderid,
o.productid,
o.sales,
SUM(sales) OVER(PARTITION BY productid) TotalSalesByproduct
FROM salesdb.orders AS o;

-- task: show overall total sales, while keeing order level details.
SELECT 
o.orderid,
o.productid,
o.sales,
SUM(sales) OVER() TotalSales
FROM salesdb.orders AS o;

-- task : find how much each order contributes to the total sales
SELECT 
o.orderid,
o.productid,
o.sales,
ROUND(
	(CAST(o.sales AS DECIMAL(10,2))/SUM(o.sales) OVER()) *100,
	2
) AS percentage_of_total
FROM salesdb.orders o;

-- AVg() 
-- find the average sale for the each product, while keeping order level details
SELECT 
o.orderid,
o.productid,
o.sales,
AVG(o.sales) OVER(PARTITION BY o.productid) AS avg_sales_perproduct
FROM salesdb.orders o;

-- NULL handling 
SELECT 
o.orderid,
o.productid,
o.sales,
AVG(COALESCE(o.sales)) OVER(PARTITION BY o.productid) AS avg_sales_perproduct
FROM salesdb.orders o;

-- FIND THE OVERALL AVERAFE SALES 
SELECT
o.orderid,
o.orderdate,
o.sales,
AVG(o.sales) OVER() avg_overallSales
FROM salesdb.orders o;

-- find the average customer score, showing customer details
SELECT
c.firstname,
c.score,
AVG(c.score) OVER() AS avg_customer_score
FROM salesdb.customers c;

-- comparison analysis 
-- find all orders where sales > average sales
SELECT *
FROM(
SELECT
o.orderid,
o.productid,
o.sales,
AVG(o.sales) OVER() AS avg_sales
FROM salesdb.orders o
) AS sub 
WHERE sales > avg_sales;

-- find the maximum and minimum sales for each product,
SELECT
o.orderid,
o.productid,
o.sales,
MAX(o.sales) OVER(PARTITION BY o.productid) AS max_sales,
MIN(o.sales) OVER(PARTITION BY o.productid) AS min_sales
FROM salesdb.orders o;

-- show employees who have the highest salary
SELECT *
FROM(
SELECT
e.employeeid,
e.firstname,
e.salary,
MAX(e.salary) OVER() AS HIGHEST_SAL
FROM salesdb.employees e
) AS sub
WHERE salary = HIGHEST_SAL;

-- measure how far each sale is from minimum and maximum
SELECT
o.orderid,
o.sales,
o.sales - MIN(o.sales) OVER() AS deviation_from_min,
MAX(o.sales) OVER()  -  o.sales AS deviation_from_max  
FROM salesdb.orders o;






