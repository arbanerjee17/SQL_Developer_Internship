-- Create database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create tables
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    genre VARCHAR(50),
    author_id INT,
    price DECIMAL(6,2),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Insert sample data
INSERT INTO Authors VALUES
(1, 'J.K. Rowling', 'UK'),
(2, 'George R.R. Martin', 'USA'),
(3, 'Haruki Murakami', 'Japan');

INSERT INTO Books VALUES
(101, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1, 19.99),
(102, 'Harry Potter and the Chamber of Secrets', 'Fantasy', 1, 21.50),
(103, 'A Game of Thrones', 'Fantasy', 2, 25.00),
(104, 'Kafka on the Shore', 'Fiction', 3, 18.75);

CREATE VIEW FantasyBooks AS
SELECT b.title, b.genre, b.price, a.name AS author_name, a.country
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE b.genre = 'Fantasy';

SELECT * FROM FantasyBooks;

CREATE VIEW AvgPriceByGenre AS
SELECT genre, AVG(price) AS average_price
FROM Books
GROUP BY genre;

SELECT * FROM AvgPriceByGenre;
