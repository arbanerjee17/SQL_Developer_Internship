-- 1️⃣ Create a new database and use it
CREATE DATABASE join_task_db;
USE join_task_db;

-- 2️⃣ Create related tables
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

-- 3️⃣ Insert sample data into Customers
INSERT INTO Customers (CustomerName, Country) VALUES
('John Smith', 'USA'),
('Emma Brown', 'UK'),
('Raj Kumar', 'India'),
('Sophia Lee', 'Australia'),
('Michael Chan', 'Canada');

-- 4️⃣ Insert sample data into Orders
INSERT INTO Orders (OrderDate, CustomerID, Amount) VALUES
('2025-08-01', 1, 250.00),
('2025-08-03', 1, 175.50),
('2025-08-05', 3, 300.00),
('2025-08-06', 4, 150.00),
('2025-08-08', 3, 200.00);

-- 5️⃣ INNER JOIN - Only matching rows from both tables
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 6️⃣ LEFT JOIN - All customers, even without orders
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 7️⃣ RIGHT JOIN - All orders, even without matching customers
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- 8️⃣ FULL OUTER JOIN (Simulated in MySQL using UNION of LEFT + RIGHT JOIN)
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- ✅ Optional: Check table data
SELECT * FROM Customers;
SELECT * FROM Orders;;
