-- Morgan Dive 'n' Thrive Database (CIS 330 team project, JMU)
-- Creates all 19 tables
-- Written for MySQL

/* ---------- 1. Customer ---------- */
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(200)
);

/* ---------- 2. Cust_PhoneNumber ---------- */
CREATE TABLE Cust_PhoneNumber(
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    PhoneType VARCHAR(20),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

/* ---------- 3. Scuba_Certified_Customer ---------- */
CREATE TABLE Scuba_Certified_Customer(
    CustomerID INT PRIMARY KEY,
    CertType VARCHAR(50),
    CertDate DATE,
    CertCardNumber VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

/* ---------- 4. Boat_Certified_Customer ---------- */
CREATE TABLE Boat_Certified_Customer(
    CustomerID INT PRIMARY KEY,
    ProviderName VARCHAR(100),
    CertDate DATE,
    CertNumber VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

/* ---------- 5. Product ---------- */
CREATE TABLE Product(
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ManufactureName VARCHAR(100),
    Size VARCHAR(20),
    Price DECIMAL(10,2),
    Description VARCHAR(200),
    QuantityInStock INT
);

/* ---------- 6. Orders ---------- */
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    ShipmentDate DATE,
    TotalAmount DECIMAL(10,2),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

/* ---------- 7. Product_Order ---------- */
CREATE TABLE Product_Order(
    ProductID INT NOT NULL,
    OrderID INT NOT NULL,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (ProductID, OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/* ---------- 8. DiveTrip ---------- */
CREATE TABLE DiveTrip(
    TripID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE,
    EndDate DATE,
    Description VARCHAR(200),
    Cost DECIMAL(10,2),
    MaxCapacity INT
);

/* ---------- 9. Location ---------- */
CREATE TABLE Location(
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100),
    PeakStart DATE,
    PeakEnd DATE,
    PortFee DECIMAL(10,2)
);

/* ---------- 10. DiveTrip_Location ---------- */
CREATE TABLE DiveTrip_Location(
    DiveTripID INT NOT NULL,
    LocationID INT NOT NULL,
    PRIMARY KEY (DiveTripID, LocationID),
    FOREIGN KEY (DiveTripID) REFERENCES DiveTrip(TripID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

/* ---------- 11. Scuba_Certified_Customer_DiveTrip ---------- */
CREATE TABLE Scuba_Certified_Customer_DiveTrip(
    CustomerID INT NOT NULL,
    DiveTripID INT NOT NULL,
    PRIMARY KEY (CustomerID, DiveTripID),
    FOREIGN KEY (CustomerID) REFERENCES Scuba_Certified_Customer(CustomerID),
    FOREIGN KEY (DiveTripID) REFERENCES DiveTrip(TripID)
);

/* ---------- 12. Status ---------- */
CREATE TABLE Status(
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    StatusType VARCHAR(50)
);

/* ---------- 13. Rental_Contract ---------- */
CREATE TABLE Rental_Contract(
    ContractID INT PRIMARY KEY AUTO_INCREMENT,
    StartTime DATETIME,
    ProposedDays INT,
    ActualReturnTime DATETIME,
    ContractAmount DECIMAL(10,2)
);

/* ---------- 14. Rental_Equipment ---------- */
CREATE TABLE Rental_Equipment(
    EquipmentID INT PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(200),
    CostPerDay DECIMAL(10,2)
);

/* ---------- 15. Rental_Equipment_Status ---------- */
CREATE TABLE Rental_Equipment_Status(
    EquipmentID INT NOT NULL,
    StatusID INT NOT NULL,
    StatusDate DATE,
    StatusTime TIME,
    PRIMARY KEY (EquipmentID, StatusID),
    FOREIGN KEY (EquipmentID) REFERENCES Rental_Equipment(EquipmentID),
    FOREIGN KEY (StatusID) REFERENCES Status(StatusID)
);

/* ---------- 16. Boat_Equipment ---------- */
CREATE TABLE Boat_Equipment(
    EquipmentID INT PRIMARY KEY,
    HullLength DECIMAL(5,2),
    NumberOfMotors INT,
    EnginePower INT,
    Capacity INT,
    FOREIGN KEY (EquipmentID) REFERENCES Rental_Equipment(EquipmentID)
);

/* ---------- 17. Diving_Equipment ---------- */
CREATE TABLE Diving_Equipment(
    EquipmentID INT PRIMARY KEY,
    EquipmentType VARCHAR(50),
    Size VARCHAR(20),
    UnitOfMeasure VARCHAR(20),
    FOREIGN KEY (EquipmentID) REFERENCES Rental_Equipment(EquipmentID)
);

/* ---------- 18. Boat_Rental_Contract ---------- */
CREATE TABLE Boat_Rental_Contract(
    ContractID INT PRIMARY KEY,
    GasDeparture DECIMAL(5,2),
    GasReturn DECIMAL(5,2),
    NumberMiles DECIMAL(8,2),
    CustomerID INT NOT NULL,
    EquipmentID INT NOT NULL,
    FOREIGN KEY (ContractID) REFERENCES Rental_Contract(ContractID),
    FOREIGN KEY (CustomerID) REFERENCES Boat_Certified_Customer(CustomerID),
    FOREIGN KEY (EquipmentID) REFERENCES Boat_Equipment(EquipmentID)
);

/* ---------- 19. Equipment_Contract ---------- */
CREATE TABLE Equipment_Contract(
    ContractID INT PRIMARY KEY,
    SignedWaiver BOOLEAN,
    HealthMedicalClearance BOOLEAN,
    CustomerID INT NOT NULL,
    EquipmentID INT NOT NULL,
    FOREIGN KEY (ContractID) REFERENCES Rental_Contract(ContractID),
    FOREIGN KEY (CustomerID) REFERENCES Scuba_Certified_Customer(CustomerID),
    FOREIGN KEY (EquipmentID) REFERENCES Diving_Equipment(EquipmentID)
);
