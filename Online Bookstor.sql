-- crateing database 
CREATE DATABASE online_bookstor
-- rename the database
ALTER DATABASE online_bookstor
RENAME TO online_bookstore
--
--
--createing 1st table 
CREATE TABLE customers (
  customer_id serial PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(100) NOT NULL UNIQUE,
  city varchar(50),
  country varchar(50),
  registration_date date NOT NULL
)
--
DROP TABLE customers
--
--
-- creating 2nd table 
CREATE TABLE books (
  book_id SMALLSERIAL PRIMARY KEY,
  title varchar(200) NOT NULL,
  author varchar(100) NOT NULL,
  genre varchar(50) NOT NULL,
  price numeric(10, 2) NOT NULL,
  publication_year smallint NOT NULL,
  stock_quantity smallint NOT NULL
);


--
DROP TABLE books
--
--
-- createing 3rd table 
CREATE TABLE orders (
  order_id smallserial PRIMARY KEY,
  customer_id smallint REFERENCES customers (customer_id) NOT NULL,
  book_id smallint REFERENCES books (book_id) NOT NULL,
  order_date date NOT NULL,
  quantity smallint NOT NULL,
  total_amount decimal(10, 2) NOT NULL
)
--
DROP TABLE orders
--
--
-- Insert the customers data
INSERT INTO
  customers (
    first_name,
    last_name,
    email,
    city,
    country,
    registration_date
  )
VALUES
  (
    'John',
    'Smith',
    'john.smith@email.com',
    'New York',
    'USA',
    '2023-01-15'
  ),
  (
    'Emma',
    'Johnson',
    'emma.j@email.com',
    'London',
    'UK',
    '2023-02-20'
  ),
  (
    'Michael',
    'Brown',
    'mbrown@email.com',
    'Toronto',
    'Canada',
    '2023-01-10'
  ),
  (
    'Sophia',
    'Davis',
    'sophia.d@email.com',
    'Sydney',
    'Australia',
    '2023-03-05'
  ),
  (
    'James',
    'Wilson',
    'jwilson@email.com',
    'New York',
    'USA',
    '2023-02-28'
  ),
  (
    'Oliver',
    'Taylor',
    'oliver.t@email.com',
    'London',
    'UK',
    '2023-04-12'
  ),
  (
    'Ava',
    'Anderson',
    'ava.anderson@email.com',
    'Los Angeles',
    'USA',
    '2023-03-18'
  ),
  (
    'William',
    'Martinez',
    'w.martinez@email.com',
    'Madrid',
    'Spain',
    '2023-01-25'
  ),
  (
    'Isabella',
    'Garcia',
    'isabella.g@email.com',
    'Mexico City',
    'Mexico',
    '2023-02-14'
  ),
  (
    'Lucas',
    'Rodriguez',
    'lucas.r@email.com',
    'Buenos Aires',
    'Argentina',
    '2023-03-30'
  )
  --
  --
  -- insert the books data
INSERT INTO
  books (
    title,
    author,
    genre,
    price,
    publication_year,
    stock_quantity
  )
VALUES
  (
    'The Great Gatsby',
    'F. Scott Fitzgerald',
    'Fiction',
    12.99,
    1925,
    45
  ),
  (
    'To Kill a Mockingbird',
    'Harper Lee',
    'Fiction',
    14.99,
    1960,
    32
  ),
  (
    '1984',
    'George Orwell',
    'Science Fiction',
    13.99,
    1949,
    28
  ),
  (
    'Pride and Prejudice',
    'Jane Austen',
    'Romance',
    11.99,
    1813,
    50
  ),
  (
    'The Catcher in the Rye',
    'J.D. Salinger',
    'Fiction',
    12.99,
    1951,
    22
  ),
  (
    'Harry Potter and the Sorcerer Stone',
    'J.K. Rowling',
    'Fantasy',
    19.99,
    1997,
    60
  ),
  (
    'The Hobbit',
    'J.R.R. Tolkien',
    'Fantasy',
    15.99,
    1937,
    38
  ),
  (
    'Brave New World',
    'Aldous Huxley',
    'Science Fiction',
    13.99,
    1932,
    25
  ),
  (
    'The Lord of the Rings',
    'J.R.R. Tolkien',
    'Fantasy',
    29.99,
    1954,
    41
  ),
  (
    'Animal Farm',
    'George Orwell',
    'Fiction',
    10.99,
    1945,
    55
  ),
  (
    'Fahrenheit 451',
    'Ray Bradbury',
    'Science Fiction',
    12.99,
    1953,
    30
  ),
  (
    'The Great Adventure',
    'John Anderson',
    'Fiction',
    16.99,
    2020,
    18
  ),
  (
    'Mystery in Paris',
    'Marie Dubois',
    'Mystery',
    14.99,
    2019,
    27
  ),
  (
    'Romance in Rome',
    'Isabella Rossi',
    'Romance',
    13.99,
    2021,
    35
  )
  --
  --
  -- insert the orders data
INSERT INTO
  orders (
    customer_id,
    book_id,
    order_date,
    quantity,
    total_amount
  )
VALUES
  (1, 1, '2023-05-10', 2, 25.98),
  (1, 6, '2023-05-15', 1, 19.99),
  (2, 3, '2023-05-12', 1, 13.99),
  (3, 2, '2023-05-11', 3, 44.97),
  (4, 7, '2023-05-13', 1, 15.99),
  (5, 9, '2023-05-14', 2, 59.98),
  (2, 4, '2023-05-16', 1, 11.99),
  (6, 6, '2023-05-17', 2, 39.98),
  (7, 1, '2023-05-18', 1, 12.99),
  (8, 8, '2023-05-19', 1, 13.99),
  (1, 10, '2023-06-01', 2, 21.98),
  (3, 5, '2023-06-02', 1, 12.99),
  (9, 11, '2023-06-03', 3, 38.97),
  (10, 12, '2023-06-04', 1, 16.99),
  (4, 13, '2023-06-05', 2, 29.98),
  (5, 14, '2023-06-06', 1, 13.99),
  (2, 6, '2023-06-07', 1, 19.99),
  (7, 3, '2023-06-08', 2, 27.98)
  --
  --
  --Display all books with their titles and prices, ordered by price (lowest to highest)
SELECT
  title,
  price
FROM
  books
ORDER BY
  price ASC
  --
  --Find all distinct countries where customers are from
SELECT DISTINCT
  country
FROM
  customers
  --
  --Find all books whose titles start with "The"
SELECT
  *
FROM
  books
WHERE
  title LIKE 'The%'
  --
  --Change the column name first_name to customer_first_name in the customers table
ALTER TABLE customers
RENAME COLUMN first_name TO customer_first_name
--
--Find all books in the Fantasy genre
SELECT
  *
FROM
  books
WHERE
  genre = 'Fantasy'
  --
  --Count the total number of orders in the database
SELECT
  count(*)
FROM
  orders
  --
  --Find the average price of books by genre, but only show genres with an average price greater than $14
SELECT
  genre,
  avg(price) AS average_price
FROM
  books
GROUP BY
  genre
HAVING
  avg(price) > 14
  --
  --Find all customers whose email addresses end with .com and are from either USA or UK
  -- option 1
SELECT
  *
FROM
  customers
WHERE
  email LIKE '%.com'
  AND (
    country = 'USA'
    OR country = 'UK'
  )
  -- option 2
SELECT
  *
FROM
  customers
WHERE
  email LIKE '%.com'
  AND (country IN ('USA', 'UK'))
  --
  --Display all customers with their full name in uppercase (concatenated first and last name), original email, and city in lowercase. Only show customers from USA or UK.
SELECT
  upper(concat(customer_first_name, ' ', last_name)) AS "Full Name",
  email,
  lower(city) AS city
FROM
  customers
WHERE
  country IN ('USA', 'UK')
  --
  --Find the total revenue, average order amount, maximum order amount, and minimum order amount from all orders placed in June 2023.
SELECT
  SUM(total_amount) AS "Total Revenue",
  ROUND(AVG(total_amount), 2) AS "Average Order Amount",
  MAX(total_amount) AS "Maximum Order Amount",
  MIN(total_amount) AS "Minimum Order Amount"
FROM
  orders
WHERE
  order_date BETWEEN '2023-06-01' AND '2023-06-30';
--