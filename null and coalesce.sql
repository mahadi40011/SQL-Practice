select null = null

insert into employee(user_name, age) values('halima', 24)
  
select * from employee where email is null
  
select user_name, age, coalesce(email, 'not provided') as email from employee

