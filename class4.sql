
SELECT title, special_features 
	FROM film f 
	WHERE rating="PG-13";


SELECT DISTINCT `length` 
	FROM film f;
	
SELECT title, rental_rate, replacement_cost 
	FROM film WHERE replacement_cost BETWEEN 20.00 AND 24.00
	
SELECT f.title, c2.name, f.rating FROM film f, category c2, film_category fc 
	WHERE f.film_id = fc.film_id
		AND c2.category_id = fc.category_id AND f.special_features = "Behind the Scenes"
	
SELECT first_name, last_name FROM actor a, film_actor fa , film f 
	WHERE a.actor_id = fa.actor_id 
	AND fa.film_id = f.film_id 
	AND f.title = "ZOOLANDER FICTION";
	
SELECT a.address, c2.country, c.city FROM store s, address a, city c, country c2 
	WHERE s.address_id = a.address_id 
	AND a.address_id = 1
	AND c.city_id = a.city_id
	AND c2.country_id = c.country_id;
	
SELECT f.title, f2.title, f.rating FROM film f, film f2 
	WHERE f.rating = f2.rating AND f.film_id <> f2.film_id 

SELECT f.title, s.first_name FROM inventory i ,film f ,staff s, store s2 
	WHERE s2.manager_staff_id = s.staff_id 
	AND s2.store_id = 2
	AND i.store_id = i.film_id
	AND i.film_id = f.film_id 