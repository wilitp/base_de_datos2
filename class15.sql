# 1
-- Create a view named list_of_customers, it should contain the following columns

drop view if exists list_of_customers ;
CREATE VIEW list_of_customers AS
	SELECT 
		customer_id,
		store_id,
		concat(first_name, " ", last_name) "name",
		address,
		postal_code,
		phone,
		city,
		country,
		CASE 
			when active = 1 then "Active"
			else "Inactive"
			end as "Status"
		
	FROM 
		customer
	JOIN 
		address
		using(address_id)
	JOIN
		city
		using(city_id)
	JOIN
		country
		using(country_id);
		
select * FROM list_of_customers;

# 2
-- Create a view nameed film_details, it should contain the following columns: film id, title, description, category, price, length, rating, actors -
-- as a string of all the actors separated by comma. Hint use GROUP_CONCAT

drop view if exists film_details;
CREATE VIEW film_details AS
	SELECT
		film_id,
		title,
		rental_rate as "price",
		GROUP_CONCAT(concat(first_name, " ", last_name)) as actors,
		description,
		name as "category"
	FROM
		category
	JOIN
		film_category
		using(category_id)
	JOIN
		film
		using(film_id)
	JOIN
		film_actor fa
		using(film_id)
	JOIN
		actor
		using(actor_id)
	group by film_id, name;
	
SELECT * from film_details;

# 3
-- Create view sales_by_film_category, it should return "category" and "total_ rental" columns.
drop view if exists sales_by_film_category;

CREATE VIEW sales_by_film_category AS
	SELECT
		name,
		count(*)
	FROM
		category
	JOIN film_category
			using(category_id)
	JOIN film
			using(film_id)
	JOIN inventory
			using(film_id)
	JOIN rental
			using(inventory_id)
	group by
		name;
select * from sales_by_film_category;

# 4
-- Create a view called actor_information where it should return, actor id, first name, last name and the amount of films he/she acted on.

drop view if exists actor_information;
CREATE VIEW actor_information AS 
	SELECT
		actor_id,
		first_name,
		last_name,
		count(*) as "number of films"
	FROM
		actor
	JOIN
		film_actor
		using(actor_id)
	group by actor_id;

select * from actor_information;

# 5
-- Analyze view actor_info, explain the entire query and specially how the sub query works. =>
select * from actor_info;

-- The query selects fields from joining the actor, film, and category tables.

-- Intento de recrear la query =>
select
	actor_id,
	first_name,
	last_name,
	group_concat(concat(" ", name, ": ", title)) as "film_info"
FROM 
	actor
join
	film_actor
	using(actor_id)
join 
	film
	using(film_id)
join 
	film_category
	using(film_id)
join 
	category
	using(category_id)
group by actor_id;


# 6
-- Investigate about materialized query tables(materialized views)