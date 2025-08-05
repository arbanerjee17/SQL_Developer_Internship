CREATE DATABASE Task2DB;
USE Task2DB;
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);
INSERT INTO employees (name, email, salary, department)
VALUES ('John Doe', 'john@example.com', 50000, 'Sales');
INSERT INTO employees (name, email, salary, department)
VALUES ('Jane Smith', NULL, 60000, 'HR');

SELECT * FROM EMPLOYEES;
UPDATE employees
SET email = 'not_provided@example.com'
WHERE email IS NULL;
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET salary = 55000
WHERE name = 'John Doe';
DELETE FROM employees
WHERE name = 'Jane Smith';
SELECT * FROM EMPLOYEES;


