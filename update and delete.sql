SELECT
  *
FROM
  employee
  --
  --
UPDATE employee
SET
  email = 'default@gmail.com'
WHERE
  email IS NULL
  --
  --
SELECT
  *
FROM
  students
  --
  --
UPDATE students
SET
  grade = 'A-'
WHERE
  student_id IN (1, 2, 3)

--delete command
select * from students

select * from students where age <= 22 and grade = 'A-'
delete from students where age <= 22 and grade = 'A-'