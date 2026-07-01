-- PostgreSQL Scalar Functions 
| Category                | Functions                                     |
| ----------------------- | --------------------------------------------- |
| String Manipulation     | `UPPER()`, `LOWER()`, `LENGTH()`, `CONCAT()`  |
| Mathematical Operations | `ABS()`, `ROUND()`, `CEIL()`, `FLOOR()`       |
| Date and Time           | `NOW()`, `CURRENT_DATE`, `AGE()`, `EXTRACT()` |
| Conditional Expressions | `COALESCE()`, `NULLIF()`                      |

-- PostgreSQL Scalar Functions Description
| Category                | Function                        | Description                        | Example                                     |
|-------------------------|---------------------------------|------------------------------------|---------------------------------------------|
| String Manipulation     | `UPPER(text)`                   | Converts text to uppercase         | `UPPER('hello')` → `HELLO`                  |
| String Manipulation     | `LOWER(text)`                   | Converts text to lowercase         | `LOWER('HELLO')` → `hello`                  |
| String Manipulation     | `LENGTH(text)`                  | Returns the length of a string     | `LENGTH('PostgreSQL')` → `10`               |
| String Manipulation     | `CONCAT(text1, text2)`          | Concatenates strings               | `CONCAT('Hello', ' World')` → `Hello World` |
| Mathematical Operations | `ABS(num)`                      | Returns the absolute value         | `ABS(-15)` → `15`                           |
| Mathematical Operations | `ROUND(num, decimals)`          | Rounds a number                    | `ROUND(15.678, 2)` → `15.68`                |
| Mathematical Operations | `CEIL(num)`                     | Rounds up to the nearest integer   | `CEIL(15.2)` → `16`                         |
| Mathematical Operations | `FLOOR(num)`                    | Rounds down to the nearest integer | `FLOOR(15.9)` → `15`                        |
| Date and Time           | `NOW()`                         | Returns the current date and time  | `NOW()`                                     |
| Date and Time           | `CURRENT_DATE`                  | Returns the current date           | `CURRENT_DATE`                              |
| Date and Time           | `AGE(timestamp)`                | Calculates age between dates       | `AGE('2000-01-01')`                         |
| Date and Time           | `EXTRACT(field FROM timestamp)` | Extracts a part of a date/time     | `EXTRACT(YEAR FROM NOW())`                  |
| Conditional Expressions | `COALESCE(val1, val2)`          | Returns the first non-NULL value   | `COALESCE(NULL, 'N/A')` → `N/A`             |
| Conditional Expressions | `NULLIF(val1, val2)`            | Returns NULL if values are equal   | `NULLIF(10, 10)` → `NULL`                   |



select upper(first_name) from students where country = 'China'
select concat(first_name,' ', last_name) as "Name" from students


-- PostgreSQL Common General-Purpose Aggregates Functions
| Category  | Function     | Query                                             |
| --------- | ------------ | ------------------------------------------------- |
| Aggregate | COUNT()      | `SELECT COUNT(*) FROM students;`                  |
| Aggregate | AVG()        | `SELECT AVG(age) FROM students;`                  |
| Aggregate | SUM()        | `SELECT SUM(age) FROM students;`                  |
| Aggregate | MAX()        | `SELECT MAX(age) FROM students;`                  |
| Aggregate | MIN()        | `SELECT MIN(age) FROM students;`                  |
| Aggregate | STRING_AGG() | `SELECT STRING_AGG(country, ', ') FROM students;` |
| Aggregate | ARRAY_AGG()  | `SELECT ARRAY_AGG(country) FROM students;`        |
--
--
| Function            | Standard Data Type Arguments                     | Returns NULL on Empty Set? |
|---------------------|--------------------------------------------------|----------------------------|
| `COUNT(expression)` | Any data type                                    | ❌ No (Returns `0`)        |
| `SUM(expression)`   | Numeric, Interval, Money                         | ✅ Yes                     |
| `AVG(expression)`   | Numeric, Interval                                | ✅ Yes                     |
| `MIN(expression)`   | Numeric, String, Date/Time, Network, Enum, Array | ✅ Yes                     |
| `MAX(expression)`   | Numeric, String, Date/Time, Network, Enum, Array | ✅ Yes                     |
--
--
| Function                      | Description                                | Example                                              |
|-------------------------------|--------------------------------------------|------------------------------------------------------|
| COUNT(*)                      | Counts all rows                            | `SELECT COUNT(*) FROM students;`                     |
| COUNT(column)                 | Counts non-NULL values in a column         | `SELECT COUNT(email) FROM students;`                 |
| SUM(column)                   | Returns the total sum                      | `SELECT SUM(age) FROM students;`                     |
| AVG(column)                   | Returns the average value                  | `SELECT AVG(age) FROM students;`                     |
| MAX(column)                   | Returns the maximum value                  | `SELECT MAX(age) FROM students;`                     |
| MIN(column)                   | Returns the minimum value                  | `SELECT MIN(age) FROM students;`                     |
| STRING_AGG(column, separator) | Concatenates values into a single string   | `SELECT STRING_AGG(first_name, ', ') FROM students;` |
| ARRAY_AGG(column)             | Combines values into an array              | `SELECT ARRAY_AGG(first_name) FROM students;`        |
| BOOL_AND(column)              | Returns TRUE if all values are TRUE        | `SELECT BOOL_AND(is_active) FROM users;`             |
| BOOL_OR(column)               | Returns TRUE if at least one value is TRUE | `SELECT BOOL_OR(is_active) FROM users;`              |

