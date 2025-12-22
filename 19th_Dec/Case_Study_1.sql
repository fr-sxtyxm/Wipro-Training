--1
CREATE DATABASE EmpMgmtDB;
USE EmpMgmtDB;

--2
CREATE TABLE Departments (
    DeptID INT IDENTITY(1,1) PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

--3
CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50),
    Email VARCHAR(100),
    Salary INT,
    JoinDate DATE,
    DeptID INT,
    CONSTRAINT fk_department
        FOREIGN KEY (DeptID)
        REFERENCES Departments(DeptID)
);

--4
ALTER TABLE Employees
ADD Status VARCHAR(20);
--SELECT * FROM Employees;

--5
ALTER TABLE Employees
ALTER COLUMN EmpName VARCHAR(100);
--SHOW Employees;

--6
ALTER TABLE Employees
DROP COLUMN Email;
--SELECT * FROM Employees;

--7
--not getting removed w/o removing fk
ALTER TABLE Employees
DROP CONSTRAINT fk_department;

DROP TABLE Departments;

--8
CREATE INDEX IDX_EmployeeName
ON Employees (EmpName);

--9
CREATE INDEX IDX_Dept
ON Employees (DeptID);

--10
SELECT EmpID, EmpName, Salary
FROM Employees
WHERE DeptID = 3;