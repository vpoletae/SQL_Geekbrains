#1
select
	users.name,
	count(orders.id) as user_orders
from
	users
	left join orders
	on users.id = orders.user_id
group by users.id
having user_orders > 1;

#2
select
	products.name,
	catalogs.name
from
	products
	left join catalogs
	on products.catalog_id = catalogs.id
	
#3
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255),
  `to` VARCHAR(255)
)

INSERT INTO flights (`from`, `to`) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');
 
select * from flights;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255),
  name VARCHAR(255)
)

INSERT INTO cities (label, name) VALUES
  ('moscow', '??????'),
  ('novgorod', '????????'),
  ('irkutsk', '???????'),
  ('omsk', '????'),
  ('kazan', '??????');

select
	from_country,
	cities.name as to_country
from
	(select
		cities.name as from_country,
		flights.`to` as to_country_eng
	from
		flights
		left join cities
		on flights.`from` = cities.label) as from_table
	left join cities
	on from_table.to_country_eng = cities.label
	