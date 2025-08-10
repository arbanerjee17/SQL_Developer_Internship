# Task 4: Aggregate Functions and Grouping

## Objective
Use aggregate functions and grouping to summarize data from single tables without using `JOIN`s.

## Tools
- DB Browser for SQLite **or**
- MySQL Workbench

## Deliverables
- SQL queries using:
  - `SUM()`
  - `COUNT()`
  - `AVG()`
  - `GROUP BY`
  - `HAVING`

---

## Dataset

We created three tables:
1. **customers** – Stores customer details.
2. **products** – Stores product details.
3. **orders** – Stores customer purchase records.

### Table Creation
```sql
CREATE DATABASE sales_db;
USE sales_db;

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
