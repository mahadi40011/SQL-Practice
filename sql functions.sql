CREATE FUNCTION count_emp () returns int language sql AS $$ select count(*) from employees $$
--
SELECT
    count_emp ()
    --
    --
    --
CREATE FUNCTION get_single_emp (emp_id int) returns setof employees language sql AS $$ select * from employees where employee_id = emp_id $$
--
SELECT
    *
FROM
    get_single_emp (5)