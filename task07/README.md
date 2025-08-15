#Task 7: Creating Views

Objective

Learn to create and use SQL views for abstraction, security, and reusability.

Tools

DB Browser for SQLite

MySQL Workbench


Description

In this task, we created SQL views to simplify complex queries and improve data abstraction.
Two views were implemented:

1. FantasyBooks – Displays all fantasy books with author details.


2. AvgPriceByGenre – Shows average book price for each genre.



Key SQL Commands

  CREATE VIEW FantasyBooks AS
  SELECT b.title, b.genre, b.price, a.name AS author_name, a.country
  FROM Books b
  JOIN Authors a ON b.author_id = a.author_id
  WHERE b.genre = 'Fantasy';
  
  CREATE VIEW AvgPriceByGenre AS
  SELECT genre, AVG(price) AS average_price
  FROM Books
  GROUP BY genre;

Usage

Query a view like a table:

  SELECT * FROM FantasyBooks;
  SELECT * FROM AvgPriceByGenre;

Outcome

Understood the concept of reusable SQL logic.

Learned how to create, store, and query SQL views.

Gained experience in simplifying complex queries.
