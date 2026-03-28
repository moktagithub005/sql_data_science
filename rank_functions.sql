-- rank orders based on sales from highest to lowest
SELECT
o.orderid,
o.productid,
o.sales,
ROW_NUMBER() OVER(PARTITION BY o.productid ORDER BY o.sales DESC) AS sales_rank
FROM salesdb.orders o;

-- when to use row_number() --> top N analysis
-- find top 3 highest sales
SELECT *
FROM(
SELECT
o.orderid,
o.sales,
ROW_NUMBER() OVER(ORDER BY o.sales DESC) AS RN
FROM salesdb.orders o
) AS sub
WHERE RN <= 3;

-- RANK() function
SELECT 
o.orderid,
o.sales,
RANK() OVER(ORDER BY o.sales DESC) AS sales_rank
FROM salesdb.orders  AS o;

-- DENSE_RANK()
SELECT 
o.orderid,
o.sales,
ROW_NUMBER() OVER(ORDER BY o.sales DESC) AS RN,
RANK() OVER(ORDER BY o.sales DESC) AS sales_rank,
DENSE_RANK() OVER(ORDER BY o.sales DESC) AS sales_dense_rank
FROM salesdb.orders  AS o;

-- BOTTOM N ANALYSIS
-- top 1 product
SELECT*
FROM(
	SELECT
	o.orderid,
	o.productid,
	o.sales,
	ROW_NUMBER() OVER(PARTITION BY o.productid
					  ORDER BY o.sales DESC
	) AS RN
	FROM salesdb.orders o
	)t
WHERE RN = 1;

-- NTILE 
SELECT 
orderid,
sales,
NTILE(3) OVER(
          ORDER BY sales DESC) AS Bucket
FROM salesdb.orders;


-- use of NTILE()
-- for segmentation
SELECT
orderid, 
sales,
CASE
	WHEN Bucket = 1 THEN 'High'
	WHEN Bucket = 2 THEN 'Medium'
	WHEN Bucket = 3 THEN 'Low'
END AS sales_segment
FROM(
SELECT 
orderid,
sales,
NTILE(3) OVER(ORDER BY sales DESC) AS Bucket
FROM salesdb.orders
)t;

-- CUME_DIST()
SELECT 
sales,
CUME_DIST() OVER(ORDER BY  sales DESC) AS Dist_Rank
FROM salesdb.orders;

SELECT 
sales,
PERCENT_RANK() OVER(ORDER BY  sales DESC) AS Dist_Rank
FROM salesdb.orders;
