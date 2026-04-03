-- CTE(common table expression) 
WITH OrderSummary AS(
SELECT 
customerid,
COUNT(*) AS totalorders
FROM salesdb.orders
GROUP BY customerid
)
SELECT *
FROM OrderSummary;

--  STEP1 : CALCUALTE TOTAL SALES PER CUSTOMERS
-- STEP2: JOIN WITH CUSTOMER TABLE 

WITH CTE_total_sales AS (
    SELECT 
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
    ON cts.customerid = c.customerid;
    
    -- multiple cte 
    -- step 2: last orderdate per customer 
    WITH CTE_total_sales AS (
    SELECT 
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    ),
    CTE_last_order AS (
      SELECT
      customerid,
      MAX(orderdate)  AS LastOrder
      FROM salesdb.orders
      GROUP BY customerid
    )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales,
    clo.lastOrder
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
     ON cts.customerid = c.customerid
    LEFT JOIN CTE_last_order AS clo
     ON clo.customerid = c.customerid;
     
-- Nested cte
-- rank customer on totalsales 
WITH CTE_total_sales AS (
    SELECT 
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    ),
    -- last order calculate 
    CTE_last_order AS (
      SELECT
      customerid,
      MAX(orderdate)  AS LastOrder
      FROM salesdb.orders
      GROUP BY customerid
    ),
    -- customer rank with nested cte
    CTE_customer_rank AS (
         SELECT 
         customerid,
         TotalSales,
         RANK() OVER(ORDER BY TotalSales DESC) AS customer_rank
         FROM CTE_total_sales
    )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales,
    clo.lastOrder,
	ccr.customer_rank
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
     ON cts.customerid = c.customerid
    LEFT JOIN CTE_last_order AS clo
     ON clo.customerid = c.customerid
	LEFT JOIN CTE_customer_rank ccr
     ON c.customerid = ccr.customerid