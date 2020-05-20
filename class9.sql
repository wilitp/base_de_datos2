

-- Get amount of cities per country
SELECT
	COUNT(*) as cities, c3.country
FROM
	city c,
	country c3
WHERE c.country_id = c3.country_id
GROUP BY c3.country, c.country_id;


-- Get amount of cities per country. Show only the countries with more than one city. Order by amount of cities

SELECT
	COUNT(*) as cities, c3.country
FROM
	city c,
	country c3
WHERE c.country_id = c3.country_id
GROUP BY c3.country, c.country_id
HAVING cities > 10
ORDER BY cities;

-- Show customers, their addresses, the amount of films they've rented, and the total money spent

SELECT
	c.first_name,
	c.last_name,
	a.address,
	COUNT(*) as amount_rented,
	sum(p.amount) as spent
FROM
	customer c,
	address a,
	rental r ,
	payment p
WHERE
	c.address_id = a.address_id
	AND c.customer_id = r.customer_id
	AND p.rental_id = r.rental_id
GROUP BY
	c.first_name,
	c.last_name,
	a.address
ORDER BY 
	spent DESC;

-- Show categories ordering them descending by their average film duration

SELECT
	c.name,
	AVG(f.`length`) as average_length
FROM
	category c,
	film f ,
	film_category fc
WHERE
	f.film_id = fc.film_id
	AND c.category_id = fc.category_id
GROUP BY c.name
HAVING average_length > (SELECT AVG(f2.`length`) FROM film f2 )
ORDER BY average_length DESC;


-- Show sales per film rating

SELECT
	COUNT(*) as sales,
	f.rating
FROM
	film f,
	inventory i,
	rental r
WHERE
	f.film_id = i.film_id
	AND r.inventory_id = i.inventory_id 
GROUP BY f.rating;



