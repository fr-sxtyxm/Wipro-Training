--orderDB

--16
CREATE DATABASE OrderDB;
USE OrderDB;

--17
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone INT,
);

--18
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATE,
    OrderAmount INT,
    CustomerID INT,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE SET NULL
);

--19
ALTER TABLE Orders
ADD OrderStatus VARCHAR(20);

--20
DROP TABLE Orders;
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATETIME NOT NULL,
    OrderAmount DECIMAL(8,2),
    OrderStatus VARCHAR DEFAULT 'Pending',
    CustomerID INT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE SET NULL
);

--21
CREATE INDEX IDX_Orders_CustomerID
ON Orders (CustomerID);

--22
CREATE INDEX IDX_Orders_Amount
ON Orders (OrderAmount);