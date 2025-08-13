# SQL Developer Internship - Task 5

**Objective:** Practice SQL Joins (INNER, LEFT, RIGHT, FULL) to combine data from multiple tables.  
**Tool:** MySQL Workbench  

---

## Tables

**Customers**
- CustomerID (PK)
- CustomerName
- Country

**Orders**
- OrderID (PK)
- OrderDate
- CustomerID (FK)
- Amount

---

## SQL Code

```sql
CREATE DATABASE join_task_db;
USE join_task_db;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerName, Country) VALUES
('John Smith', 'USA'),
('Emma Brown', 'UK'),
('Raj Kumar', 'India'),
('Sophia Lee', 'Australia'),
('Michael Chan', 'Canada');

INSERT INTO Orders (OrderDate, CustomerID, Amount) VALUES
('2025-08-01', 1, 250.00),
('2025-08-03', 1, 175.50),
('2025-08-05', 3, 300.00),
('2025-08-06', 4, 150.00),
('2025-08-08', 3, 200.00);

-- INNER JOIN
SELECT * FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN
SELECT * FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN
SELECT * FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL JOIN via UNION
SELECT * FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT * FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
