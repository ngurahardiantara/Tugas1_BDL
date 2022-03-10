SELECT CategoryName,
COUNT(*) AS NumberOfProducts,
ROUND(AVG(UnitPrice), 2) AS AveragePrice,
MIN(UnitPrice) AS MinPrice,
MAX(UnitPrice) AS MaxPrice,
SUM(UnitsOnOrder) AS TotalOrder
FROM Category INNER JOIN Product ON Category.Id = Product.CategoryID
GROUP BY CategoryName HAVING NumberOfProducts>10 ORDER BY CategoryName;

-- Beverages|12|37.98|4.5|263.5|60
-- Condiments|12|23.06|10|43.9|170
-- Confections|13|25.16|9.2|81|180
-- Seafood|12|20.68|6|62.5|120