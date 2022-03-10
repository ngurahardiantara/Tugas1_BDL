SELECT productname, CompanyName, ContactName
FROM (SELECT productname, MIN(OrderDate), CompanyName, ContactName
FROM (SELECT Id AS pId, ProductName AS productname FROM Product WHERE Discontinued != 0) as discontinued
INNER JOIN OrderDetail on ProductId = pId
INNER JOIN 'Order' on 'Order'.Id = OrderDetail.OrderId
INNER JOIN Customer on CustomerId = Customer.Id
GROUP BY pId)
ORDER BY productname;

-- Alice Mutton|Consolidated Holdings|Elizabeth Brown
-- Chef Anton's Gumbo Mix|Piccolo und mehr|Georg Pipps
-- Guaraná Fantástica|Piccolo und mehr|Georg Pipps
-- Mishi Kobe Niku|Old World Delicatessen|Rene Phillips
-- Perth Pasties|Piccolo und mehr|Georg Pipps
-- Rössle Sauerkraut|Piccolo und mehr|Georg Pipps
-- Singaporean Hokkien Fried Mee|Vins et alcools Chevalier|Paul Henriot
-- Thüringer Rostbratwurst|Piccolo und mehr|Georg Pipps