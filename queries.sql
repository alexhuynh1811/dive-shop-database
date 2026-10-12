-- Morgan Dive 'n' Thrive Database (CIS 330 team project, JMU)
-- Report queries (run after sample_data.sql)
-- Written for MySQL

-- Query 1: Rental equipment status report (all equipment in each status: Rented Out, Available for Rent, Out of Service, Removed from Service)
SELECT re.EquipmentID, re.Description, CASE WHEN be.EquipmentID IS NOT NULL THEN 'Boat' ELSE 'Diving Equipment' END AS Category, s.StatusType, res.StatusDate, res.StatusTime
FROM Rental_Equipment re
LEFT JOIN Boat_Equipment be ON re.EquipmentID = be.EquipmentID
JOIN Rental_Equipment_Status res ON re.EquipmentID = res.EquipmentID
JOIN Status s ON res.StatusID = s.StatusID
ORDER BY s.StatusType, re.EquipmentID;

-- Query 2: What equipment and boats are rented the most
SELECT re.EquipmentID, re.Description, CASE WHEN be.EquipmentID IS NOT NULL THEN 'Boat' ELSE 'Diving Equipment' END AS Category, COUNT(res.StatusID) AS TimesRented
FROM Rental_Equipment re
LEFT JOIN Boat_Equipment be ON re.EquipmentID = be.EquipmentID
JOIN Rental_Equipment_Status res ON re.EquipmentID = res.EquipmentID
JOIN Status s ON res.StatusID = s.StatusID
WHERE s.StatusType = 'Rented Out'
GROUP BY re.EquipmentID, re.Description, Category
ORDER BY TimesRented DESC;

-- Query 3: Average rental time by item type (diving equipment vs. boat)
SELECT 'Diving Equipment' AS ItemType, ROUND(AVG(rc.ProposedDays), 1) AS AvgRentalDays
FROM Rental_Contract rc
JOIN Equipment_Contract ec ON rc.ContractID = ec.ContractID

UNION ALL

SELECT 'Boat' AS ItemType, ROUND(AVG(rc.ProposedDays), 1) AS AvgRentalDays
FROM Rental_Contract rc
JOIN Boat_Rental_Contract brc ON rc.ContractID = brc.ContractID;

-- Query 4: Sales report for the last year by quarter
SELECT YEAR(OrderDate) AS OrderYear, QUARTER(OrderDate) AS OrderQuarter, CONCAT('Q', QUARTER(OrderDate), ' ', YEAR(OrderDate)) AS Period, COUNT(OrderID) AS NumberOfOrders, SUM(TotalAmount) AS TotalRevenue, AVG(TotalAmount) AS AverageOrderValue, MIN(TotalAmount) AS SmallestOrder, MAX(TotalAmount) AS LargestOrder
FROM Orders
GROUP BY YEAR(OrderDate), QUARTER(OrderDate), CONCAT('Q', QUARTER(OrderDate), ' ', YEAR(OrderDate))
ORDER BY OrderYear, OrderQuarter;

-- Query 5: Dive trip participation count for each scuba certified customer
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, scc.CertType AS CertificationType, COUNT(scdt.DiveTripID) AS TripsParticipated
FROM Customer c
JOIN Scuba_Certified_Customer scc ON c.CustomerID = scc.CustomerID
LEFT JOIN Scuba_Certified_Customer_DiveTrip scdt ON c.CustomerID = scdt.CustomerID
GROUP BY c.CustomerID, CustomerName, scc.CertType
ORDER BY TripsParticipated DESC;

-- Query 6: Upcoming dive trips with available spots remaining
SELECT dt.TripID, dt.StartDate, dt.EndDate, dt.Description, dt.Cost AS TripCost, dt.MaxCapacity, COUNT(scdt.CustomerID) AS RegisteredDivers, (dt.MaxCapacity - COUNT(scdt.CustomerID)) AS AvailableSpots
FROM DiveTrip dt
LEFT JOIN Scuba_Certified_Customer_DiveTrip scdt ON dt.TripID = scdt.DiveTripID
WHERE dt.StartDate >= CURDATE()
GROUP BY dt.TripID, dt.StartDate, dt.EndDate, dt.Description, dt.Cost, dt.MaxCapacity
HAVING AvailableSpots > 0
ORDER BY dt.StartDate;
