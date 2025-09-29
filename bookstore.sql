-- Author Table
CREATE TABLE Author (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  birthdate DATE
);

-- Book Table
CREATE TABLE Book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  publication_date DATE,
  price DECIMAL(10, 2),
  stock_qty INT DEFAULT 0,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES Author (author_id)
);

-- Customer Table
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20)
);

-- Purchase Table
CREATE TABLE Purchase (
  purchase_id INT PRIMARY KEY AUTO_INCREMENT,
  purchase_date DATE NOT NULL,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);

-- Purchase_Detail Table (for many-to-many relationship)
CREATE TABLE Purchase_Detail (
  purchase_id INT,
  book_id INT,
  quantity INT DEFAULT 1,
  PRIMARY KEY (purchase_id, book_id),
  FOREIGN KEY (purchase_id) REFERENCES Purchase (purchase_id),
  FOREIGN KEY (book_id) REFERENCES Book (book_id)
);



INSERT INTO
  Author (name, birthdate)
VALUES
  ('Mohammad Rahman', '1970-03-15'),
  ('MD Karim', '1982-07-21'),
  ('J.K. Rowling', '1965-07-31'),
  ('George R. R. Martin', '1948-09-20'),
  ('Jane Austen', '1775-12-16');

INSERT INTO
  Book (
    title,
    publication_date,
    price,
    stock_qty,
    author_id
  )
VALUES
  ('Learning SQL Basics', '2022-05-10', 25.50, 15, 1),
  (
    'Advanced Database Systems',
    '2023-09-05',
    45.00,
    5,
    2
  ),
  (
    'Harry Potter and the Philosopher''s Stone',
    '1997-06-26',
    20.00,
    50,
    3
  ),
  (
    'Harry Potter and the Chamber of Secrets',
    '1998-07-02',
    22.00,
    30,
    3
  ),
  ('A Game of Thrones', '1996-08-06', 35.00, 10, 4),
  ('A Clash of Kings', '1998-11-16', 38.00, 8, 4),
  ('Pride and Prejudice', '1813-01-28', 18.00, 25, 5),
  ('Emma', '1815-12-23', 20.00, 12, 5);

INSERT INTO
  Customer (name, email, phone)
VALUES
  ('Rakib Hasan', 'rakib@example.com', '01711111111'),
  (
    'Nusrat Jahan',
    'nusrat@example.com',
    '01822222222'
  ),
  (
    'Sabbir Ahmed',
    'sabbir@example.com',
    '01933333333'
  ),
  (
    'Fatema Akter',
    'fatema@example.com',
    '01644444444'
  );

INSERT INTO
  Purchase (purchase_date, customer_id)
VALUES
  ('2024-01-15', 1),
  ('2024-02-05', 2),
  ('2024-03-20', 3),
  ('2024-09-01', 4),
  ('2023-12-10', 1);

INSERT INTO
  Purchase_Detail (purchase_id, book_id, quantity)
VALUES
  (1, 1, 1), -- Rakib bought Learning SQL Basics
  (1, 3, 2), -- Rakib also bought 2 Harry Potter 1
  (2, 2, 1), -- Nusrat bought Advanced Database Systems
  (2, 4, 1), -- Nusrat also bought Harry Potter 2
  (3, 5, 1), -- Sabbir bought A Game of Thrones
  (3, 6, 1), -- Sabbir also bought A Clash of Kings
  (4, 7, 2), -- Fatema bought 2 copies of Pride and Prejudice
  (5, 8, 1); -- Rakib (2023) bought EmmaINSERT INTO
  Author (name, birthdate)
VALUES
  ('Mohammad Rahman', '1970-03-15'),
  ('MD Karim', '1982-07-21'),
  ('J.K. Rowling', '1965-07-31'),
  ('George R. R. Martin', '1948-09-20'),
  ('Jane Austen', '1775-12-16');

INSERT INTO
  Book (
    title,
    publication_date,
    price,
    stock_qty,
    author_id
  )
VALUES
  ('Learning SQL Basics', '2022-05-10', 25.50, 15, 1),
  (
    'Advanced Database Systems',
    '2023-09-05',
    45.00,
    5,
    2
  ),
  (
    'Harry Potter and the Philosopher''s Stone',
    '1997-06-26',
    20.00,
    50,
    3
  ),
  (
    'Harry Potter and the Chamber of Secrets',
    '1998-07-02',
    22.00,
    30,
    3
  ),
  ('A Game of Thrones', '1996-08-06', 35.00, 10, 4),
  ('A Clash of Kings', '1998-11-16', 38.00, 8, 4),
  ('Pride and Prejudice', '1813-01-28', 18.00, 25, 5),
  ('Emma', '1815-12-23', 20.00, 12, 5);

INSERT INTO
  Customer (name, email, phone)
VALUES
  ('Rakib Hasan', 'rakib@example.com', '01711111111'),
  (
    'Nusrat Jahan',
    'nusrat@example.com',
    '01822222222'
  ),
  (
    'Sabbir Ahmed',
    'sabbir@example.com',
    '01933333333'
  ),
  (
    'Fatema Akter',
    'fatema@example.com',
    '01644444444'
  );

INSERT INTO
  Purchase (purchase_date, customer_id)
VALUES
  ('2024-01-15', 1),
  ('2024-02-05', 2),
  ('2024-03-20', 3),
  ('2024-09-01', 4),
  ('2023-12-10', 1);

INSERT INTO
  Purchase_Detail (purchase_id, book_id, quantity)
VALUES
  (1, 1, 1), -- Rakib bought Learning SQL Basics
  (1, 3, 2), -- Rakib also bought 2 Harry Potter 1
  (2, 2, 1), -- Nusrat bought Advanced Database Systems
  (2, 4, 1), -- Nusrat also bought Harry Potter 2
  (3, 5, 1), -- Sabbir bought A Game of Thrones
  (3, 6, 1), -- Sabbir also bought A Clash of Kings
  (4, 7, 2), -- Fatema bought 2 copies of Pride and Prejudice
  (5, 8, 1); -- Rakib (2023) bought Emma
  
  
  
  
  
  
  
  
  SELECT * FROM author
SELECT * FROM book
SELECT * FROM customer
SELECT * FROM purchase
SELECT * FROM purchase_detail

-- Display a list of 20 latest published in-stock book titles of the store
SELECT
  title
FROM
  Book
WHERE
  stock_qty > 0
ORDER BY
  publication_date DESC
LIMIT
  20;

-- Retrieve a list of all purchases since January 01, 2024
SELECT
  *
FROM
  Purchase
WHERE
  purchase_date >= '2024-01-01'
ORDER BY
  purchase_date DESC;

-- List down all the authors in the database who have “Mohammad” or “MD” at the beginning of their name, sorted by the names (alphabetically)
SELECT
  name
FROM
  Author
WHERE
  name LIKE 'Mohammad%'
  OR name LIKE 'MD%'
ORDER BY
  name ASC;
  
