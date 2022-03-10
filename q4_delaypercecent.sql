SELECT CompanyName, ROUND(delay * 100.0 / cnt, 2) AS percentage
FROM (SELECT ShipVia, COUNT(*) AS cnt FROM 'Order' GROUP BY ShipVia) AS total
INNER JOIN (SELECT ShipVia, COUNT(*) AS delay FROM 'Order' WHERE ShippedDate > RequiredDate GROUP BY ShipVia) AS delay
ON total.ShipVia = delay.ShipVia
INNER JOIN Shipper ON total.ShipVia = Shipper.Id
ORDER BY percentage DESC;

-- Federal Shipping|23.61
-- Speedy Express|23.46
-- United Package|23.44