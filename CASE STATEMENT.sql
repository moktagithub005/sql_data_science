SELECT 
orderid,
sales,
CASE
	WHEN sales >50 THEN 'HIGH'
	WHEN sales > 20 THEN 'MEDIUM'
	ELSE 'LOW'
END category

 FROM salesdb.orders;
 
 SELECT 
 employeeid,
 firstname,
 lastname,
 gender,
 CASE 
	 WHEN gender = 'F' THEN 'Female'
	 WHEN gender = 'M' THEN 'Male'
	 ELSE 'Unknown'
	 END genderfulltext
	 
 FROM salesdb.employees;
 
 
 SELECT 
 customerid,
 firstname,
 lastname,
 country,
 CASE 
	 WHEN country = 'Germany' THEN 'DE'
	 WHEN country = 'India' THEN 'ind'
	 ELSE 'n/a'
	 END abb_country
 FROM salesdb.customers;
 
 -- handling nulls using case statement
 SELECT 
 customerid,
 firstname,
 score,
 CASE
	 WHEN score IS NULL THEN 0
	 ELSE score
 END AS cleanscore,
 AVG(
     CASE 
		 WHEN  score IS NULL THEN 0
		 ELSE score
    END
 ) OVER() AvgCustomerClean,
 AVG(score) OVER() AS AvgCustomer
 
 FROM salesdb.customers;
 
 -- condiional aggregation
 SELECT
 customerid,
 SUM(
 CASE
   WHEN sales > 30 THEN 1
   ELSE 0
END
 ) AS totalOrdersHighSales,
 COUNT(*) AS totalorders
 FROM salesdb.orders
 GROUP BY customerid;
 
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
 
 
 
 
 