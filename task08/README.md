# Task 8: Stored Procedures and Functions

## 📌 Objective
Learn how to create and use reusable SQL blocks by implementing stored procedures and functions in MySQL.

## 🛠 Tools Used
- MySQL Workbench  
- (Alternative: DB Browser for SQLite – note: SQLite does not support stored procedures/functions)

## 📂 Deliverables
- One Stored Procedure (GetHighScorers)
- One Function (GetGrade)

## 📖 Description
This task demonstrates:
1. How to create a stored procedure with parameters.
2. How to create a function with conditional logic.
3. How to modularize SQL logic for reuse.

## 💻 SQL Code
```sql
-- 1️⃣ Create Database and Table
CREATE DATABASE schoolDB;
USE schoolDB;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (name, marks) VALUES
('Amit', 85),
('Priya', 92),
('Rahul', 76),
('Sneha', 59);

-- 2️⃣ Stored Procedure
DELIMITER $$

CREATE PROCEDURE GetHighScorers(IN min_marks INT)
BEGIN
    SELECT * 
    FROM students
    WHERE marks >= min_marks;
END $$

DELIMITER ;

-- Call the Stored Procedure
CALL GetHighScorers(80);

-- 3️⃣ Function
DELIMITER $$

CREATE FUNCTION GetGrade(marks INT) 
RETURNS VARCHAR(2)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(2);
    IF marks >= 90 THEN
        SET grade = 'A';
    ELSEIF marks >= 75 THEN
        SET grade = 'B';
    ELSEIF marks >= 60 THEN
        SET grade = 'C';
    ELSE
        SET grade = 'D';
    END IF;
    RETURN grade;
END $$

DELIMITER ;

-- Use the Function
SELECT name, marks, GetGrade(marks) AS grade
FROM students;
