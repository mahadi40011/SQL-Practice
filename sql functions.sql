-- functions
CREATE FUNCTION count_emp () returns int language sql AS $$ 
    select count(*) from employees 
  $$
--
SELECT
  count_emp ()
  -----
  -----
  -----
CREATE FUNCTION get_single_emp (emp_id int) returns setof employees language sql AS $$ 
    select * from employees where employee_id = emp_id 
  $$
--
SELECT
  *
FROM
  get_single_emp (5)
  ----
  ----
  ----
  ----
  -- procedure --> update , delete , insert 
CREATE PROCEDURE delete_emp_by_id (emp_id int) language plpgsql AS $$
  begin 
    delete from employees where employee_id = emp_id;
  end;
  $$
--
CALL delete_emp_by_id (0)
-----
-----
-- Find the average salary of everyone in a department, and update the salary of those whose salary is below the average salary by 10%.
CREATE OR REPLACE PROCEDURE increase_lower_salary(dpt_name VARCHAR(50))
LANGUAGE plpgsql
AS $$
DECLARE
    avg_salary DECIMAL(10,2);
BEGIN
    SELECT AVG(salary)
    INTO avg_salary
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    WHERE d.department_name = dpt_name;

    UPDATE employees e
    SET salary = salary * 1.10
    FROM departments d
    WHERE e.department_id = d.department_id
      AND d.department_name = dpt_name
      AND e.salary < avg_salary;
END;
$$;
--
call increase_lower_salary('Sales')
