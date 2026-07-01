-- crateing database 
CREATE DATABASE practice_database
--
--
--  creating the departments table 
CREATE TABLE departments (
  department_id smallserial PRIMARY KEY,
  department_name varchar(50) NOT NULL
)
--
--
-- creating the employees table
CREATE TABLE employees (
  employee_id smallserial PRIMARY KEY,
  employee_name varchar(50) NOT NULL,
  department_id smallint REFERENCES departments (department_id),
  salary decimal(10, 2),
  hire_date date
)
--
--
--  data insert to the departments table
INSERT INTO
  departments (department_name)
VALUES
  ('Human Resources'),
  ('Information Technology'),
  ('Finance'),
  ('Marketing'),
  ('Sales'),
  ('Operations'),
  ('Customer Support');


--
--
--  insert data into employees table
INSERT INTO
  employees (employee_name, department_id, salary, hire_date)
VALUES
  ('John Smith', 5, 55000.00, '2020-01-15'),
  ('Emma Johnson', 7, 62000.00, '2019-03-22'),
  ('Michael Brown', 3, 48000.00, '2021-07-10'),
  ('Sophia Davis', 4, 71000.00, '2018-11-05'),
  ('James Wilson', 5, 53000.00, '2022-02-14'),
  ('Olivia Taylor', 1, 68000.00, '2019-09-18'),
  ('William Anderson', 6, 59000.00, '2020-06-30'),
  ('Isabella Martinez', 3, 45000.00, '2023-01-12'),
  ('Benjamin Thomas', 2, 77000.00, '2017-08-25'),
  ('Charlotte Garcia', 2, 61000.00, '2021-12-03'),
  ('Daniel Rodriguez', 1, 54000.00, '2022-04-09'),
  ('Amelia Hernandez', 7, 73000.00, '2018-10-21'),
  ('Matthew Lopez', 4, 50000.00, '2020-05-17'),
  ('Mia Gonzalez', 6, 69000.00, '2019-02-28'),
  ('Henry Perez', 5, 47000.00, '2023-06-11'),
  ('Evelyn Wilson', 7, 58000.00, '2021-01-26'),
  ('Alexander Moore', 2, 81000.00, '2017-12-15'),
  ('Harper Jackson', 3, 52000.00, '2022-08-04'),
  ('Sebastian Martin', 4, 76000.00, '2019-11-19'),
  ('Abigail Lee', 5, 60000.00, '2020-09-13'),
  ('David Walker', 5, 49000.00, '2023-03-08'),
  ('Emily Hall', 2, 72000.00, '2018-05-27'),
  ('Joseph Allen', 3, 56000.00, '2021-10-01'),
  ('Elizabeth Young', 7, 84000.00, '2016-07-16'),
  ('Samuel King', 5, 51000.00, '2022-12-20'),
  ('Grace Wright', 1, 66000.00, '2019-04-11'),
  ('Christopher Scott', 6, 78000.00, '2017-09-06'),
  ('Lily Green', 3, 46000.00, '2023-02-23'),
  ('Andrew Baker', 4, 70000.00, '2020-08-29'),
  ('Ella Adams', 2, 64000.00, '2018-01-31');


--
--
-- 1. inner join to retrieve employees and departments informaton.
SELECT
  *
FROM
  employees
  INNER JOIN departments USING (department_id)
  --
  -- 2. show department name with average salary.
SELECT
  department_name,
  round(avg(salary), 2) AS average_salary
FROM
  departments
  INNER JOIN employees USING (department_id)
GROUP BY
  department_name
  --
  -- 3. count employees in each departments.
SELECT
  department_name,
  count(*) AS total_emplyees
FROM
  employees
  INNER JOIN departments USING (department_id)
GROUP BY
  department_name
  --
  -- 4. find the department name with the heighest average salary.
SELECT
  department_name,
  round(avg(salary), 2) AS average_salary
FROM
  departments
  INNER JOIN employees USING (department_id)
GROUP BY
  department_name
ORDER BY
  average_salary DESC
LIMIT
  1
  --
  -- 5. count employees hired each year
SELECT
  extract(
    YEAR
    FROM
      hire_date
  ) AS hired_year,
  count(*) AS total_emplyees
FROM
  employees
GROUP BY
  hired_year
ORDER BY
  hired_year