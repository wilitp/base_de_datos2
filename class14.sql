# 1
-- Get all the customers that live in Argentina. Show the first and last name one column, the address and the city.

SELECT
	CONCAT(first_name, " ",last_name), address, city
FROM
	customer c
JOIN address
		using(address_id)
JOIN city 
		using(city_id)
JOIN country
		using(country_id)
WHERE country.country LIKE BINARY "Argentina";


# 2 
-- use case to map the film ratings to their longer versions

SELECT
	title,
	release_year,
	CASE
		WHEN rating like "G" THEN "General Public"
		WHEN rating like "PG" THEN "Parental Guidance Suggested"
		WHEN rating like "PG-13" THEN "Parents Strongly Cautioned"
		WHEN rating like "R" THEN "Restricted"
		WHEN rating like "NC-17" THEN "Adults Only"
		end as rating 
FROM film f;

# 3 TO DO
-- Search films by actor

SELECT
	title
from
	film f
join
	film_actor
	using(film_id)
join
	actor
	using(actor_id)
where match( actor.first_name, actor.last_name ) against('penelope' in natural language mode);

# 4 
-- Find all the rentals done in the months of May and june. Show the film title,
-- customer name and if it was returned or not

SELECT
	title,
	concat(first_name, " ", last_name) "Cliente",
	case 
		when rental_date is null then "No"
		else "Yes"
		end as "Devolvido"
FROM
	customer
join rental
	using(customer_id)
join inventory
	using(inventory_id)
join film
	using(film_id)
where
	MONTHNAME(return_date) in ("may", "JUNE")
	

# 5
-- investigate CAST and CONVERT 

-- The difference between CAST and CONVERT is that CONVERT accepts an optional arguent used for formatting. 
-- CAST is part of the ansi-sql specification and CONVERT is not. 

select * from payment where cast(amount as CHARACTER ) = '2.99';

