-- Morgan Dive 'n' Thrive Database (CIS 330 team project, JMU)
-- Fake sample data for testing (run after schema.sql)
-- Written for MySQL

/* ---------- 1. Customer ---------- */
INSERT INTO Customer (FirstName, LastName, Email, Address) VALUES
    ('John', 'Doe', 'johndoe@gmail.com', '100 garden road'),
    ('Jack', 'Brown', 'jackbrown@gmail.com','101 garden road'),
    ('Billy', 'Thorn', 'billythorn@gmail.com','102 garden road'),
    ('Julio', 'Hernandez', 'juliohernandez@gmail.com','103 garden road'),
    ('Frank', 'Beans', 'frankandbeans@gmail.com','104 garden road'),
    ('Harry', 'Potter', 'harrypotter@gmail.com','105 garden road'),
    ('Luke', 'Skywalker', 'lukeskywalker@gmail.com','106 garden road'),
    ('Gregg', 'Frog', 'greggfrog@gmail.com','107 garden road'),
    ('Lebron', 'James', 'lebronjames@gmail.com','108 garden road'),
    ('Tiger', 'Woods', 'tigerwoods@gmail.com','109 garden road');

/* ---------- 2. Cust_PhoneNumber ---------- */
INSERT INTO Cust_PhoneNumber (PhoneNumber, PhoneType, CustomerID) VALUES
    ('540-555-1023', 'Mobile', 1),
    ('571-555-3847', 'Home', 2),
    ('703-555-9274', 'Work', 3),
    ('540-555-6612', 'Mobile', 4),
    ('804-555-2198', 'Home', 5),
    ('276-555-7741', 'Work', 6),
    ('571-555-4306', 'Mobile', 7),
    ('703-555-1589', 'Home', 8),
    ('540-555-8925', 'Work', 9),
    ('804-555-3476', 'Mobile', 10);

/* ---------- 3. Scuba_Certified_Customer ---------- */
INSERT INTO Scuba_Certified_Customer (CustomerID, CertType, CertDate, CertCardNumber) VALUES
    (2, 'Open Water Diver', '2021-06-15', 'OWD-472938'),
    (6, 'Advanced Open Water Diver', '2020-08-22', 'AOWD-839201'),
    (9, 'Rescue Diver', '2019-05-10', 'RD-561774');

/* ---------- 4. Boat_Certified_Customer ---------- */
INSERT INTO Boat_Certified_Customer (CustomerID, ProviderName, CertDate, CertNumber) VALUES
    (1, 'US Powerboating', '2022-04-18', 'USB-482901'),
    (4, 'BoatUS Foundation', '2021-07-09', 'BUF-739255'),
    (8, 'US Coast Guard Auxiliary', '2020-05-27', 'USCG-194672');

/* ---------- 5. Product ---------- */
INSERT INTO Product (ManufactureName, Size, Price, Description, QuantityInStock) VALUES
    ('Yamaha', 'Medium', 1200.00, '25ft recreational boat engine unit', 5),
    ('SeaRay', 'Large', 1500.00, '30ft luxury boat package', 3),
    ('Bayliner', 'Medium', 900.00, '20ft fishing boat', 7),
    ('Kawasaki', 'Small', 600.00, 'Jet Ski watercraft', 10),
    ('Mares', 'Small', 25.00, 'Scuba air tank', 50),
    ('Cressi', 'Medium', 15.00, 'Neoprene wetsuit medium size', 30),
    ('Cressi', 'Large', 15.00, 'Neoprene wetsuit large size', 25),
    ('AquaLung', 'Small', 20.00, 'Diving regulator system', 40),
    ('Scubapro', 'Medium', 18.00, 'Buoyancy control device (BCD)', 35),
    ('Seaview', 'Small', 10.00, 'Professional diving mask', 60);

/* ---------- 6. Orders ---------- */
INSERT INTO Orders (OrderDate, ShipmentDate, TotalAmount, CustomerID) VALUES
    ('2024-03-10', '2024-03-12', 149.99, 1),
    ('2024-03-15', '2024-03-17', 89.50, 3),
    ('2024-04-02', '2024-04-05', 249.75, 6),
    ('2024-04-18', '2024-04-20', 59.99, 8),
    ('2024-05-01', '2024-05-03', 399.00, 10);

/* ---------- 7. Product_Order ---------- */
INSERT INTO Product_Order (ProductID, OrderID, Quantity) VALUES
    (5, 1, 2),
    (10, 1, 1),
    (6, 2, 1),
    (8, 2, 1),
    (1, 3, 1),
    (9, 3, 1),
    (10, 4, 2),
    (5, 4, 1),
    (4, 5, 1),
    (7, 5, 2);

/* ---------- 8. DiveTrip ---------- */
INSERT INTO DiveTrip (StartDate, EndDate, Description, Cost, MaxCapacity) VALUES
    ('2026-01-10', '2026-01-12', 'Key Largo Reef Weekend', 450.00, 12),
    ('2026-02-15', '2026-02-18', 'Bahamas Blue Hole Adventure', 950.00, 10),
    ('2026-03-05', '2026-03-07', 'Florida Wreck Dive', 600.00, 8),
    ('2026-04-20', '2026-04-22', 'Coral Conservation Trip', 500.00, 15),
    ('2026-05-01', '2026-05-04', 'Deep Sea Exploration', 1100.00, 6),
    ('2026-06-10', '2026-06-12', 'Night Dive Weekend', 550.00, 10),
    ('2026-07-07', '2026-07-10', 'Marine Photography Tour', 700.00, 9),
    ('2026-08-14', '2026-08-16', 'Cavern Dive Experience', 800.00, 7),
    ('2026-09-03', '2026-09-05', 'Turtle Reef Excursion', 620.00, 12),
    ('2026-10-11', '2026-10-14', 'Advanced Drift Diving', 875.00, 10);

/* ---------- 9. Location ---------- */
INSERT INTO Location (LocationName, PeakStart, PeakEnd, PortFee) VALUES
    ('Key Largo', '2026-03-01', '2026-08-31', 45.00),
    ('Bahamas', '2026-04-01', '2026-09-30', 75.00),
    ('Destin Harbor', '2026-05-01', '2026-08-15', 40.00),
    ('Miami Reef', '2026-03-15', '2026-07-30', 50.00),
    ('Naples Bay', '2026-02-01', '2026-06-30', 35.00),
    ('Pensacola Coast', '2026-04-01', '2026-09-01', 38.00),
    ('Orlando Springs', '2026-01-01', '2026-12-31', 25.00),
    ('Sarasota Reef', '2026-03-10', '2026-08-20', 42.00),
    ('Jacksonville Wreck', '2026-05-01', '2026-10-01', 47.00),
    ('Fort Lauderdale', '2026-02-15', '2026-09-15', 55.00);

/* ---------- 10. DiveTrip_Location ---------- */
INSERT INTO DiveTrip_Location (DiveTripID, LocationID) VALUES
    (1, 1),
    (2, 2),
    (3, 9),
    (4, 4),
    (5, 10),
    (6, 6),
    (7, 8),
    (8, 7),
    (9, 5),
    (10, 3);

/* ---------- 11. Scuba_Certified_Customer_DiveTrip ---------- */
INSERT INTO Scuba_Certified_Customer_DiveTrip (CustomerID, DiveTripID) VALUES
    (2, 1),
    (2, 3),
    (2, 6),
    (6, 2),
    (6, 5),
    (6, 7),
    (9, 1),
    (9, 4),
    (9, 8),
    (9, 10);

/* ---------- 12. Status ---------- */
INSERT INTO Status (StatusType) VALUES
    ('Available for Rent'),
    ('Rented Out'),
    ('Out of Service'),
    ('Removed from Service');

/* ---------- 13. Rental_Contract ---------- */
INSERT INTO Rental_Contract (StartTime, ProposedDays, ActualReturnTime, ContractAmount) VALUES
    ('2026-04-01 10:00:00', 5, '2026-04-06 09:30:00', 250.00),
    ('2026-04-02 14:15:00', 3, '2026-04-05 16:00:00', 120.00),
    ('2026-04-03 09:00:00', 7, '2026-04-10 11:45:00', 350.00),
    ('2026-04-04 18:30:00', 2, '2026-04-06 18:00:00', 80.00),
    ('2026-04-05 12:00:00', 4, '2026-04-09 13:20:00', 200.00),
    ('2026-04-06 08:45:00', 6, '2026-04-12 10:10:00', 300.00),
    ('2026-04-07 15:00:00', 1, '2026-04-08 14:00:00', 50.00),
    ('2026-04-08 11:30:00', 10, '2026-04-18 12:00:00', 500.00),
    ('2026-04-09 16:20:00', 5, '2026-04-14 17:00:00', 275.00),
    ('2026-04-10 09:10:00', 3, '2026-04-13 09:00:00', 150.00);

/* ---------- 14. Rental_Equipment ---------- */
INSERT INTO Rental_Equipment (Description, CostPerDay) VALUES
    ('Boat A - 25ft', 300.00),
    ('Boat B - 30ft', 350.00),
    ('Boat C - 20ft', 250.00),
    ('Jet Ski', 200.00),
    ('Scuba Tank', 25.00),
    ('Wetsuit - Medium', 15.00),
    ('Wetsuit - Large', 15.00),
    ('Regulator', 20.00),
    ('BCD Vest', 18.00),
    ('Diving Mask', 10.00);

/* ---------- 15. Rental_Equipment_Status ---------- */
INSERT INTO Rental_Equipment_Status (EquipmentID, StatusID, StatusDate, StatusTime) VALUES
    (1, 1, '2026-04-01', '09:00:00'),
    (2, 2, '2026-04-01', '10:00:00'),
    (3, 3, '2026-04-01', '11:00:00'),
    (4, 1, '2026-04-01', '09:30:00'),
    (5, 1, '2026-04-01', '08:45:00'),
    (6, 2, '2026-04-01', '12:00:00'),
    (7, 1, '2026-04-01', '09:15:00'),
    (8, 2, '2026-04-01', '13:00:00'),
    (9, 4, '2026-04-01', '14:00:00'),
    (10,1, '2026-04-01', '10:30:00');

/* ---------- 16. Boat_Equipment ---------- */
INSERT INTO Boat_Equipment (EquipmentID, HullLength, NumberOfMotors, EnginePower, Capacity) VALUES
    (1, 25.0, 2, 300, 10),
    (2, 30.0, 2, 350, 12),
    (3, 20.0, 1, 200, 8),
    (4, 15.0, 1, 150, 4);

/* ---------- 17. Diving_Equipment ---------- */
INSERT INTO Diving_Equipment (EquipmentID, EquipmentType, Size, UnitOfMeasure) VALUES
    (5,'Tank','L','Liters'),
    (6,'Mask','M','Unit'),
    (7,'Fins','L','Pair'),
    (8,'Wetsuit','L','Unit'),
    (9,'Underwater Light','S','Unit');

/* ---------- 18. Boat_Rental_Contract ---------- */
/* CustomerID must be in Boat_Certified_Customer (1, 4, 8),
   EquipmentID must be in Boat_Equipment (1, 2, 3, 4) */
INSERT INTO Boat_Rental_Contract (ContractID, GasDeparture, GasReturn, NumberMiles, CustomerID, EquipmentID) VALUES
    (1, 50, 40, 100, 1, 1),
    (2, 60, 45, 120, 4, 2),
    (3, 55, 35, 90, 8, 3),
    (4, 70, 50, 150, 1, 4),
    (5, 65, 48, 130, 4, 1);

/* ---------- 19. Equipment_Contract ---------- */
/* CustomerID must be in Scuba_Certified_Customer (2, 6, 9),
   EquipmentID must be in Diving_Equipment (5, 6, 7, 8, 9) */
INSERT INTO Equipment_Contract (ContractID, SignedWaiver, HealthMedicalClearance, CustomerID, EquipmentID) VALUES
    (6, TRUE, TRUE, 2, 5),
    (7, TRUE, TRUE, 2, 6),
    (8, TRUE, FALSE, 6, 7),
    (9, TRUE, TRUE, 6, 8),
    (10, TRUE, TRUE, 9, 9);
