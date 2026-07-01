-- 1. find the highest salary
SELECT
  max(salary)
FROM
  employees
  --
  -- 2. find which employee gets the highest salary
SELECT
  *
FROM
  employees
WHERE
  salary = (
    SELECT
      max(salary)
    FROM
      employees
  )
  --
  -- 3. find employees who earn more than  the average salary
SELECT
  *
FROM
  employees
WHERE
  salary > (
    SELECT
      avg(salary)
    FROM
      employees
  )
  --
  -- 4. Name of the employees who gets the highest salary in Information Technology department
SELECT
  employee_name
FROM
  employees
  INNER JOIN departments USING (department_id)
WHERE
  department_name = 'Information Technology'
  AND salary = (
    SELECT
      max(salary)
    FROM
      employees
      INNER JOIN departments USING (department_id)
    WHERE
      department_name = 'Information Technology'
  )