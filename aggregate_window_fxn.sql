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
FROM salesdb.orders o

-- AVg() 
-- find the average sale for the each product, while keeping order level details




