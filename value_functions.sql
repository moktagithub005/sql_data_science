-- Month over Month analuysis 
SELECT *,
-- percentage
current_month_sales - previous_month_sales AS mom_change
FROM
(SELECT
MONTH(orderdate) AS order_month,
SUM(sales) AS  current_month_sales,
LAG(SUM(sales)) OVER(ORDER BY MONTH(orderdate) ) AS previous_month_sales
FROM salesdb.orders
GROUP BY  
     MONTH(orderdate)
)t;

-- LAST values
SELECT 
orderid,
productid,
sales,
FIRST_VALUE(sales) OVER(
                       PARTITION BY productid
                       ORDER BY sales
                       ) AS lowest_sales,
                       
LAST_VALUE(sales) OVER(
                       PARTITION BY productid
                       ORDER BY sales
                       ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
                       ) AS highest_sales
                       
FROM salesdb.orders
                       


