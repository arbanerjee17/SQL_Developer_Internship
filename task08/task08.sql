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

-- 2️⃣ Create Stored Procedure
DELIMITER $$

CREATE PROCEDURE GetHighScorers(IN min_marks INT)
BEGIN
    SELECT * 
    FROM students
    WHERE marks >= min_marks;
END $$

DELIMITER ;

-- Example to Call Stored Procedure
CALL GetHighScorers(80);

-- 3️⃣ Create Function
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

-- Example to Use Function
SELECT name, marks, GetGrade(marks) AS grade
FROM students;
