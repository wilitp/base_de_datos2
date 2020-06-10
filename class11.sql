
# Find all the film titles that are not int the inventory.
 SELECT
	f.title
FROM
	film f
WHERE
	f.film_id NOT IN (
	SELECT
		i3.film_id
	FROM
		inventory i3 );
--- Forma de hacerlo con join

SELECT * FROM film f LEFT OUTER JOIN inventory i ON f.film_id = i.film_id where inventory_id IS NULL;

# Find all the films that are in the inventory but were never rented

SELECT
	title, inventory.inventory_id, rental.rental_id
FROM
	film 
INNER JOIN 
	inventory 
	ON film.film_id = inventory.film_id 
LEFT OUTER JOIN 
	rental 
	ON inventory.inventory_id = rental.inventory_id
WHERE rental_id IS NULL;

#Generate a report with:
-- customer name, store id, film title
-- when the film was rented and returned for each of these customers
-- order by store_id, customer last_name

SELECT
	first_name,
	last_name, rental_id, inventory.store_id as "store id" , title , rental_date, return_date
FROM
	customer
INNER JOIN 
	rental USING(customer_id)
INNER JOIN 
	inventory USING(inventory_id)
INNER JOIN 
	film USING(film_id)
ORDER BY last_name, "store id";

# Show sales per store
-- show store's city, country, manager info and total sales
-- Use concat to show the city and country and the manager's name and last name

SELECT SUM(amount) as "Total sales", store.store_id, CONCAT(city, ", ", country), CONCAT(first_name," ", last_name)
FROM
	payment
INNER JOIN
	rental USING(rental_id)
INNER JOIN 
	inventory USING(inventory_id)
INNER JOIN
	store USING(store_id)
INNER JOIN 
	address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id), 
staff  
where staff.staff_id = store.manager_staff_id 
GROUP BY store_id;



# Which is the actor who acted in the most films?

SELECT 
	actor
FROM
	(
	SELECT
		concat(a.first_name, " ", a.last_name) AS actor, COUNT(fa.actor_id) as amount_featured
	FROM
		actor a, film_actor fa
	where
		a.actor_id = fa.actor_id
	GROUP BY
		fa.actor_id
	order by
		amount_featured desc
	limit 1) as a


