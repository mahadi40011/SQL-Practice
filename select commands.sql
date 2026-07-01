-- create a table
CREATE TABLE students (
  student_id serial PRIMARY KEY,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  email varchar(50) UNIQUE,
  age smallint,
  grade char(2),
  course varchar(50),
  dob date,
  blood_group varchar(5),
  country varchar(30)
)

-- set constraint to the email column
alter table students 
alter column email set not null

-- insert data
INSERT INTO students (
  first_name,
  last_name,
  email,
  age,
  grade,
  course,
  dob,
  blood_group,
  country
)
VALUES
('John', 'Smith', 'john.smith@gmail.com', 21, 'A', 'Computer Science', '2005-01-15', 'O+', 'USA'),
('Emma', 'Johnson', 'emma.johnson@gmail.com', 22, 'A+', 'Data Science', '2004-03-22', 'A+', 'Canada'),
('Liam', 'Brown', 'liam.brown@gmail.com', 20, 'B+', 'Software Engineering', '2006-07-11', 'B+', 'UK'),
('Sophia', 'Davis', 'sophia.davis@gmail.com', 23, 'A', 'Business Administration', '2003-05-19', 'AB+', 'Australia'),
('Noah', 'Wilson', 'noah.wilson@gmail.com', 24, 'B', 'Mechanical Engineering', '2002-09-08', 'O-', 'Germany'),
('Olivia', 'Moore', 'olivia.moore@gmail.com', 19, 'A+', 'Economics', '2007-02-27', 'A-', 'France'),
('Ethan', 'Taylor', 'ethan.taylor@gmail.com', 22, 'B+', 'Civil Engineering', '2004-11-13', 'B-', 'Italy'),
('Ava', 'Anderson', 'ava.anderson@gmail.com', 20, 'A', 'Information Technology', '2006-04-16', 'O+', 'Spain'),
('Lucas', 'Thomas', 'lucas.thomas@gmail.com', 21, 'C+', 'Marketing', '2005-08-30', 'AB-', 'Brazil'),
('Mia', 'Jackson', 'mia.jackson@gmail.com', 18, 'A+', 'Graphic Design', '2008-01-07', 'A+', 'Argentina'),
('William', 'White', 'william.white@gmail.com', 23, 'B+', 'Computer Science', '2003-06-25', 'O+', 'Japan'),
('Charlotte', 'Harris', 'charlotte.harris@gmail.com', 22, 'A', 'Data Science', '2004-10-12', 'B+', 'South Korea'),
('James', 'Martin', 'james.martin@gmail.com', 20, 'B', 'Accounting', '2006-12-04', 'A-', 'China'),
('Amelia', 'Thompson', 'amelia.thompson@gmail.com', 21, 'A+', 'Software Engineering', '2005-03-29', 'AB+', 'India'),
('Benjamin', 'Garcia', 'benjamin.garcia@gmail.com', 24, 'B+', 'Electrical Engineering', '2002-07-18', 'O-', 'Mexico'),
('Isabella', 'Martinez', 'isabella.martinez@gmail.com', 19, 'A', 'Business Administration', '2007-09-14', 'A+', 'South Africa'),
('Henry', 'Robinson', 'henry.robinson@gmail.com', 22, 'C', 'Economics', '2004-02-05', 'B-', 'Egypt'),
('Evelyn', 'Clark', 'evelyn.clark@gmail.com', 20, 'A+', 'Computer Science', '2006-05-23', 'O+', 'Turkey'),
('Alexander', 'Rodriguez', 'alexander.rodriguez@gmail.com', 23, 'B+', 'Information Technology', '2003-08-09', 'AB-', 'Russia'),
('Harper', 'Lewis', 'harper.lewis@gmail.com', 18, 'A', 'Graphic Design', '2008-04-28', 'A-', 'New Zealand');

-- select 
select * from students
select first_name, age, country from students

-- Column name alias
select first_name as "First Name", last_name as "Last Name", email as "Email" from students

-- sorting 
select student_id, first_name, last_name, age from  students order by age desc

-- distinct
select distinct country from students
select distinct course from students
select distinct age from students order by age asc

-- select students from a specific country
select first_name, age, course, country from students where country = 'India'

  -- and operator
-- select studenta with grade 'A+' in Economics
select first_name, age, course,grade, country from students where grade= 'A+' and course= 'Economics'
  

-- select students with blood group "A+"
select first_name, age, blood_group, country from students where blood_group='A+'

  -- and, or operator
-- Select students with grade A+ or A or B+ in Economics or Data Science
select first_name, grade, course, country from students
where (grade = 'A+' or grade = 'A' or grade = 'B+') and (course= 'Economics' or course = 'Data Science')

  -- and, or operator
-- select students from China or India or Japan and the age is 20
select first_name, age, country from students
where (country= 'India' or country= 'China'or country ='Japan' ) and age = 20

-- Comparison operator
-- Select students older than 20
select * from students where age > 20

-- select students without Bangladesh
select student_id, first_name , age, country from students where country != 'Bangladesh'

-- select students whose age is between 20 and 22
select student_id, first_name, country, age from students where age between 20 and 22 order by age desc


-- select distinct age from students as birth year
SELECT distinct extract(year from dob) as "Birth Year" from students order by "Birth Year"


-- in operator [sort version of multiple or operator]
-- select students form China, Japan, USA 
select first_name, country from students where country in ('China', 'Japan', 'USA')

-- select students whose course is Economics, Data Science, Computer Science
select first_name, course from students where course in ('Economics', 'Data Science', 'Computer Science')

-- like operator
-- select students whose first name start with M
select first_name from students where first_name like 'M%'

-- SQL LIKE Pattern Cheatsheet:
| Pattern  | Description                                   | Example Match                 |
| -------- | --------------------------------------------- | ----------------------------- |
| `'a%'`   | Starts with "a"                               | `"apple"`, `"alpha"`          |
| `'%a'`   | Ends with "a"                                 | `"banana"`, `"omega"`         |
| `'%or%'` | Contains "or" in any position                 | `"world"`, `"orbit"`, `"for"` |
| `'_r%'`  | Has "r" in the second position                | `"brand"`, `"green"`          |
| `'a_%'`  | Starts with "a" and has at least 2 characters | `"am"`, `"act"`               |
| `'a__%'` | Starts with "a" and has at least 3 characters | `"apps"`, `"agent"`           |
| `'a%o'`  | Starts with "a" and ends with "o"             | `"audio"`, `"avocado"`        |


-- NOT operator
-- select students who are not from bangladesh
select student_id, first_name, age, course, country from students where not country = 'Bangladesh'  -- 1st equivalent syntax
select student_id, first_name, age, course, country from students where  country != 'Bangladesh' -- 2nd equivalent syntax
select student_id, first_name, age, course, country from students where  country <> 'Bangladesh' -- 3rd equivalent syntax

-- select students whose grade is not 'A+'
select student_id, first_name, age, course, grade, country from students where not grade = 'A+'