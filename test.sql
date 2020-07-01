-- 1

SELECT
	rating,COUNT(rental_id)
FROM
	rental
join
	inventory 
	USING(inventory_id)
join
	film 
	using(film_id)
WHERE
	return_date is null
GROUP BY rating;

-- 2
SELECT
	CONCAT(first_name, " ", last_name), sum(amount) as spent, count(rental_id) as rentals
FROM
	customer
JOIN
	rental
	USING(customer_id)
JOIN
	payment
	USING(rental_id)
group by customer.customer_id
having spent > 10 and spent < 100;

-- 3
SELECT 
	address
FROM 
	address 
JOIN
	city
	USING(city_id)
JOIN
	country
	USING(country_id)
WHERE
	city like "E%"
	AND 
		country like "%a";