-- 1️⃣ Create database (MySQL; skip in SQLite)
CREATE DATABASE sales_db;
USE sales_db;

-- 2️⃣ Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

-- 3️⃣ Insert values into customers
INSERT INTO customers (customer_id, name, city, join_date) VALUES
(1, 'Ravi Kumar', 'Delhi', '2023-01-15'),
(2, 'Priya Sharma', 'Mumbai', '2022-11-10'),
(3, 'Aman Verma', 'Bangalore', '2023-03-05'),
(4, 'Neha Singh', 'Kolkata', '2021-12-20'),
(5, 'Vikram Rao', 'Delhi', '2023-06-25');

-- 4️⃣ Insert values into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 55000),
(2, 'Smartphone', 'Electronics', 25000),
(3, 'Desk Chair', 'Furniture', 7000),
(4, 'Washing Machine', 'Appliances', 32000),
(5, 'Microwave Oven', 'Appliances', 12000);

-- 5️⃣ Insert values into orders
INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, 1, '2023-08-01'),
(2, 1, 3, 2, '2023-08-15'),
(3, 2, 2, 1, '2023-07-10'),
(4, 3, 4, 1, '2023-08-05'),
(5, 4, 1, 1, '2023-09-12'),
(6, 4, 5, 1, '2023-09-15'),
(7, 5, 2, 3, '2023-08-25'),
(8, 2, 3, 4, '2023-09-20'),
(9, 3, 5, 2, '2023-09-28'),
(10, 5, 4, 1, '2023-10-02');

-- 6️⃣ Aggregate Queries (No Joins)

-- a) Total number of orders for each customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- b) Total quantity ordered by each product
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;

-- c) Average quantity per order for each product
SELECT product_id, AVG(quantity) AS avg_quantity
FROM orders
GROUP BY product_id;

-- d) Products ordered more than 3 times
SELECT product_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY product_id
HAVING COUNT(order_id) > 3;

-- e) Customers who ordered more than 4 items in total
SELECT customer_id, SUM(quantity) AS total_items
FROM orders
GROUP BY customer_id
HAVING SUM(quantity) > 4;
