# 1
SELECT created_at FROM users;

INSERT INTO users
  (created_at, updated_at)
values
  (now(), now());
  
SELECT created_at FROM users;

#2
alter table users modify created_at DATETIME;
alter table users modify updated_at DATETIME;

SELECT created_at FROM users;

#3
select value from storehouses_products order by value = 0 ASC, value ASC;

#4
select name, birthday_at from users
where MONTHNAME(birthday_at) in ('August', 'May');

#5
SELECT * FROM catalogs WHERE id IN (5, 1, 2)
order BY id = 5 DESC, id ASC;

#Aggregation
#1
-- select name, timestampdiff(year, birthday_at, now()) as age from users;
select AVG(timestampdiff(year, birthday_at, now())) from users;

#2
select dayname(birthday_at) as week_day, count(*) from users group by week_day;

#3
select exp(sum(ln(value))) from storehouses_products where value > 0;
