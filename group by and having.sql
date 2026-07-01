select country, avg(age) from students group by country

-- count students by country
select country, count(*) from students group by country

-- count students by grade
select grade , count(*) from students group by grade


--  courses with more than 2 students
select course , count(*) from students group by course having count(*) > 2

--  countries where average age is grather than 21
select country, avg(age) from students group by country having avg(age) > 21


