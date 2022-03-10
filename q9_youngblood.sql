SELECT RegionDescription, FirstName, LastName, birthday
FROM (
SELECT RegionId AS regid, MAX(Employee.Birthdate) AS birthday 
FROM Employee
INNER JOIN EmployeeTerritory ON Employee.Id = EmployeeTerritory.EmployeeId
INNER JOIN Territory ON TerritoryId = Territory.Id
GROUP BY RegionId)
INNER JOIN (
SELECT FirstName, LastName, Birthdate, RegionId, EmployeeId
FROM Employee
INNER JOIN EmployeeTerritory ON Employee.Id = EmployeeTerritory.EmployeeId
INNER JOIN Territory ON TerritoryId = Territory.Id)
ON Birthdate = birthday AND regid = RegionId
INNER JOIN Region ON Region.Id = RegionId
GROUP BY EmployeeId
ORDER BY regid;

-- Eastern|Steven|Buchanan|1987-03-04
-- Western|Michael|Suyama|1995-07-02
-- Northern|Anne|Dodsworth|1998-01-27
-- Southern|Janet|Leverling|1995-08-30