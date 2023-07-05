-- Basket Analysis
SELECT * FROM FactOnlineSales

SELECT COUNT(1)
FROM(
	SELECT DISTINCT(SalesOrderNumber)
	FROM FactOnlineSales
	WHERE ProductKey = 1153
) as f

SELECT * 
FROM FactOnlineSales
WHERE SalesOrderNumber IN (SELECT SalesOrderNumber
						FROM FactOnlineSales
						WHERE ProductKey = 1153) and ProductKey <> 1153

SELECT COUNT(1)
FROM(
	SELECT DISTINCT(SalesOrderNumber)
	FROM FactOnlineSales
	WHERE SalesOrderNumber IN (SELECT SalesOrderNumber
						FROM FactOnlineSales
						WHERE ProductKey = 1153) and ProductKey = 1306
) as f

SELECT *
FROM FactOnlineSales
WHERE SalesOrderNumber = '200805184CS610'

SELECT COUNT(1)
FROM(
	SELECT DISTINCT(SalesOrderNumber)
	FROM FactOnlineSales
) as f

SELECT *
FROM DimProduct
WHERE ProductKey = 1306

-- Final:
-- Orders
DECLARE @Product_A INT = 1153
DECLARE @Product_B INT = 1306
SELECT COUNT(1)
FROM(
	SELECT DISTINCT(SalesOrderNumber)
	FROM FactOnlineSales
	WHERE SalesOrderNumber IN (SELECT SalesOrderNumber
						FROM FactOnlineSales
						WHERE ProductKey = @Product_A) and ProductKey = @Product_B
) as f

-- Customers
DECLARE @Product_A INT = 1153
DECLARE @Product_B INT = 1306
SELECT COUNT(1)
FROM(
	SELECT DISTINCT(CustomerKey)
	FROM FactOnlineSales
	WHERE CustomerKey IN (SELECT CustomerKey
						FROM FactOnlineSales
						WHERE ProductKey = @Product_A) and ProductKey = @Product_B
) as f