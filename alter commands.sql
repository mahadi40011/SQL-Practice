-- 1. create a table
CREATE TABLE employe (id serial, name varchar(255), age smallint)
-- drop the table
DROP TABLE employee
-- 2. rename this table
ALTER TABLE employe
RENAME TO employee
-- 3. add a colume
ALTER TABLE employee
ADD COLUMN email varchar(50)
-- 5. rename a colume
ALTER TABLE employee
RENAME COLUMN name TO user_name
-- 4. drop the colume
ALTER TABLE employee
DROP COLUMN email
-- 6. modify the column type
ALTER TABLE employee
ALTER COLUMN user_name type varchar(30)
-- 7. add constraint
ALTER TABLE employee
ALTER COLUMN email
SET NOT NULL
-- 8. drop constraint
ALTER TABLE employee
ALTER COLUMN email
DROP NOT NULL
-- data insert 
INSERT INTO
  employee (user_name, age)
VALUES
  ('hasan', 20)
  -- set default values
ALTER TABLE employee
ALTER COLUMN email
SET DEFAULT 'test@gmail.com'
-- remove default 
ALTER TABLE employee
ALTER COLUMN email
DROP DEFAULT
-- 9. add constraint (table level constraint)
ALTER TABLE employee
ADD CONSTRAINT unique_employee_email UNIQUE (email)
-- 10. drop constraint (table level constraint)
ALTER TABLE employee
DROP CONSTRAINT unique_employee_email
-- update a row
UPDATE employee
SET
  email = ('mehedi@gmail.com')
WHERE
  id = 1