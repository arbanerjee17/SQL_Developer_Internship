-- 1. Create Database
CREATE DATABASE task6_subqueries;
USE task6_subqueries;

-- 2. Create Tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 3. Insert Sample Data
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Alice', 1, 45000),
(102, 'Bob', 2, 60000),
(103, 'Charlie', 2, 70000),
(104, 'David', 3, 55000),
(105, 'Eva', 3, 65000);

INSERT INTO projects VALUES
(201, 'Recruitment System', 1),
(202, 'Website Redesign', 2),
(203, 'Payroll Automation', 3);

-- 4. Subquery in SELECT (Scalar Subquery)
-- Show each employee’s salary and the company-wide average salary
SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;

-- 5. Subquery in WHERE (Using IN)
-- Find employees who work in departments that have projects
SELECT emp_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id FROM projects
);

-- 6. Subquery in FROM (Derived Table)
-- Get average salary per department and filter only those above 50000
SELECT d.dept_name, dept_avg.avg_salary
FROM (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dept_avg
JOIN departments d ON dept_avg.dept_id = d.dept_id
WHERE avg_salary > 50000;

-- 7. Correlated Subquery
-- Find employees earning more than the average salary in their department
SELECT emp_name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);

-- 8. Using EXISTS
-- List departments with at least one employee earning above 60000
SELECT dept_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
      AND e.salary > 60000
);
