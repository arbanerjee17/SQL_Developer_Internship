# 📚 SQL Library Database — Basic SELECT Queries

This project demonstrates how to create and query a simple **Library Management Database** using SQL.  
It is designed for practicing **basic `SELECT` queries** along with `WHERE`, `ORDER BY`, `LIMIT`, and `JOIN` clauses.

---

## 📌 Project Structure

- **tables.sql** → Contains `CREATE TABLE` statements for `books`, `borrowers`, and `book_loans`.
- **inserts.sql** → Contains `INSERT` statements with sample data.
- **queries.sql** → Example queries for retrieving data.
- **README.md** → Documentation (this file).

---

## 🗄️ Database Schema

### **books**
| Column           | Type     | Description                       |
|------------------|----------|-----------------------------------|
| book_id          | INTEGER  | Primary Key                       |
| title            | TEXT     | Book title                        |
| author           | TEXT     | Author name                       |
| genre            | TEXT     | Genre/Category                    |
| published_year   | INTEGER  | Year of publication               |
| copies_available | INTEGER  | Available copies in library       |

### **borrowers**
| Column           | Type     | Description                       |
|------------------|----------|-----------------------------------|
| borrower_id      | INTEGER  | Primary Key                       |
| name             | TEXT     | Borrower's full name              |
| email            | TEXT     | Borrower's email address          |
| phone            | TEXT     | Contact number                    |
| membership_date  | DATE     | Date of joining library           |

### **book_loans**
| Column           | Type     | Description                       |
|------------------|----------|-----------------------------------|
| loan_id          | INTEGER  | Primary Key                       |
| book_id          | INTEGER  | Foreign Key → books(book_id)      |
| borrower_id      | INTEGER  | Foreign Key → borrowers(borrower_id) |
| loan_date        | DATE     | Date the book was borrowed        |
| due_date         | DATE     | Date the book is due              |
| return_date      | DATE     | Date the book was returned (NULL if not returned) |
| status           | TEXT     | Loan status (`loaned` / `returned`) |

---

## 🚀 How to Run

### **Using MySQL Workbench / DB Browser for SQLite**
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/library-sql.git
   cd library-sql
2.Open your SQL tool (MySQL Workbench or DB Browser for SQLite).

3.Run tables.sql to create the tables.

4.Run inserts.sql to populate sample data.

5.Run queries.sql to execute example SELECT queries.

