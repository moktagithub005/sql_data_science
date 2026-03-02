-- aggregation function
 -- COUNT(*)
 SELECT 
COUNT(*) AS TotalOrders
 FROM salesdb.orders;
 
 
 SELECT 
 *
 FROM salesdb.orders;
 
 -- SUM()
 SELECT 
 SUM(sales) AS Totalsales
 FROM salesdb.orders;
 
 SELECT 
 AVG(sales) AS Avgsales
 FROM salesdb.orders;
 
 -- MAX()
 SELECT 
 MAX(sales) AS Highestsales
 FROM salesdb.orders;
 
 -- MIN()
 SELECT 
 MIN(sales) AS Lowestsales
 FROM salesdb.orders;
 
 SELECT 
 productid,
 COUNT(*) AS TotalSales
 FROM salesdb.orders
 GROUP BY productid;
 
 -- sql task
 SELECT 
 productid,
 orderid,
 orderdate,
 SUM(sales) OVER(PARTITION BY productid) TotalSlaes
 FROM salesdb.orders;

-- sql task over()
SELECT 
productid,
orderid,
orderdate,
SUM(sales) OVER(PARTITION BY productid) Totalsales
FROM salesdb.orders;

-- 
SELECT
orderid,
orderdate,
productid,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY productid, orderstatus) AS SalesbyPrAndSta
FROM salesdb.orders;

SELECT
orderid,
orderdate,
RANK() OVER(ORDER BY sales) Rankofsales
FROM salesdb.orders;

--  window fxn
SELECT 
orderid,
orderstatus,
orderdate,
sales,
SUM(sales) OVER(
          PARTITION BY orderstatus 
          ORDER BY orderdate 
          ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
          ) AS TotalSales

FROM salesdb.orders;

--
SELECT 
orderid,
orderstatus,
orderdate,
sales,
SUM(sales)  OVER(
	PARTITION BY orderstatus
	ORDER BY orderdate
) As TotalSales
FROM salesdb.orders;

--
SELECT 
orderid,
orderstatus,
orderdate,
sales,
SUM(sales)  OVER(
	PARTITION BY orderstatus
	ORDER BY orderdate
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) As TotalSales
FROM salesdb.orders;

-- 
SELECT 
orderid,
orderstatus,
orderdate,
sales,
SUM(sales)  OVER(
	PARTITION BY orderstatus
	ORDER BY orderdate
    ROWS  UNBOUNDED PRECEDING 
) As TotalSales
FROM salesdb.orders;

-- 
SELECT 
orderid,
orderstatus,
SUM(sales) OVER(PARTITION BY orderstatus) As TotalaSalesByStatus
FROM salesdb.orders
ORDER BY TotalaSalesByStatus;

-- 
SELECT 
orderid,
orderstatus,
SUM(sales) OVER(PARTITION BY orderstatus) As TotalaSalesByStatus
FROM salesdb.orders;

-- 
SELECT  *
FROM (
SELECT 
orderid,
SUM(sales) OVER(PARTITION BY orderstatus) AS TotalSales
FROM salesdb.orders
)t
WHERE  TotalSales > 140;

-- 
SELECT 
AVG(TotalSales) OVER() AS AvgOfCustomerSales
FROM(
SELECT 
customerid,
SUM(sales) AS TotalSales
FROM salesdb.orders
GROUP BY customerid
)t;

-- 
SELECT 
customerid,
SUM(sales) AS TotalSales,
RANK() OVER(ORDER BY SUM(sales) DESC )
FROM salesdb.orders
GROUP BY customerid;





 