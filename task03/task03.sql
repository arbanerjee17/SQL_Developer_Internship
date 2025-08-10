CREATE DATABASE TASK3DB;
CREATE TABLE books (
  book_id INTEGER PRIMARY KEY,
  title TEXT,
  author TEXT,
  genre TEXT,
  published_year INTEGER,
  copies_available INTEGER
);

CREATE TABLE borrowers (
  borrower_id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT,
  phone TEXT,
  membership_date DATE
);

CREATE TABLE book_loans (
  loan_id INTEGER PRIMARY KEY,
  book_id INTEGER,
  borrower_id INTEGER,
  loan_date DATE,
  due_date DATE,
  return_date DATE,     -- NULL if not returned yet
  status TEXT           -- e.g. 'loaned','returned'
);

INSERT INTO books (book_id, title, author, genre, published_year, copies_available)
VALUES
(1, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 4),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960, 2),
(3, '1984', 'George Orwell', 'Dystopian', 1949, 3),
(4, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 5),
(5, 'The Martian', 'Andy Weir', 'Science Fiction', 2011, 1),
(6, 'The Name of the Wind', 'Patrick Rothfuss', 'Fantasy', 2007, 0),
(7, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 2),
(8, 'The Silent Patient', 'Alex Michaelides', 'Thriller', 2019, 3),
(9, 'The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 5),
(10, 'Sapiens', 'Yuval Noah Harari', 'History', 2011, 2);

INSERT INTO borrowers (borrower_id, name, email, phone, membership_date)
VALUES
(1, 'Alice Johnson', 'alice.johnson@gmail.com', '9876543210', '2023-02-15'),
(2, 'Bob Smith', 'bob.smith@yahoo.com', '8765432109', '2022-11-05'),
(3, 'Charlie Davis', 'charlie.davis@gmail.com', '7654321098', '2024-01-10'),
(4, 'Diana Evans', 'diana.evans@hotmail.com', '6543210987', '2021-08-25'),
(5, 'Ethan Harris', 'ethan.harris@gmail.com', '5432109876', '2023-07-19');

INSERT INTO book_loans (loan_id, book_id, borrower_id, loan_date, due_date, return_date, status)
VALUES
(1, 1, 2, '2024-12-01', '2024-12-15', '2024-12-10', 'returned'),
(2, 3, 1, '2024-12-05', '2024-12-20', NULL, 'loaned'),
(3, 5, 3, '2024-12-10', '2024-12-25', NULL, 'loaned'),
(4, 6, 4, '2024-11-28', '2024-12-12', '2024-12-11', 'returned'),
(5, 2, 5, '2024-12-03', '2024-12-17', NULL, 'loaned'),
(6, 8, 2, '2024-12-08', '2024-12-22', NULL, 'loaned'),
(7, 10, 1, '2024-12-09', '2024-12-23', NULL, 'loaned');


-- Q1: see everything (quick inspection)
SELECT * FROM books;

-- Q2: select specific columns (less noisy)
SELECT title, author, published_year FROM books;

-- Q3: simple WHERE (exact match)
SELECT * FROM books
WHERE genre = 'Science Fiction';

-- Q4: numeric condition + ORDER BY
SELECT title, author, published_year FROM books
WHERE published_year > 2010
ORDER BY published_year DESC;

-- Q5: AND / OR
SELECT * FROM borrowers
WHERE membership_date >= '2023-01-01' AND email LIKE '%@gmail.com';

-- Q6: LIKE (pattern matching)
SELECT * FROM books
WHERE title LIKE '%adventure%';  -- contains 'adventure'

-- Q7: BETWEEN (inclusive range)
SELECT * FROM books
WHERE published_year BETWEEN 2000 AND 2010;

-- Q8: ORDER BY multiple columns
SELECT title, author, published_year FROM books
ORDER BY author ASC, published_year DESC;

-- Q9: LIMIT (top N) and OFFSET (pagination)
SELECT * FROM books
ORDER BY published_year DESC
LIMIT 10;                 -- top 10 newest books


-- Q10: combine WHERE + ORDER BY + LIMIT
SELECT title, author FROM books
WHERE genre = 'Fantasy'
ORDER BY published_year DESC
LIMIT 5;

-- Q11: DISTINCT (unique values)
SELECT DISTINCT genre FROM books;

-- Q12: search with OR (multiple possible matches)
SELECT * FROM books
WHERE author = 'J. K. Rowling' OR author = 'Terry Pratchett';
