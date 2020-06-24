# 1
-- Add a customer to the store 1 and with the US address with the highest id
INSERT
	INTO
	customer (store_id, first_name, last_name, email, address_id, active , last_update)
VALUES(1, 'Lorenzo', 'Grasso', 'lolito@gmail.com',(
SELECT
	MAX(address_id)
from
	address
JOIN city
		USING(city_id)
JOIN country
		USING(country_id)
WHERE
	country = 'United States') , 1, CURRENT_TIMESTAMP);

# 2
-- Add a rental(The query should depend on the film's name and not the id)
 INSERT
	INTO
	rental (inventory_id, customer_id, return_date, staff_id, last_update)
VALUES((
SELECT
	inventory_id
FROM
	inventory
JOIN film
		USING(film_id)
WHERE
	title = 'ACADEMY DINOSAUR'
limit 1 ), (
SELECT
	customer_id
FROM
	customer
limit 1 ) , NULL, (
SELECT
	staff_id
FROM
	staff
where
	staff.store_id = 2
limit 1 ), CURRENT_TIMESTAMP);

# 3
-- Update film year based on the rating. Use any mapping you want. You can use multiple statements

UPDATE film set 
	release_year = 2001
where rating = "G";

UPDATE film set 
	release_year = 2002
where rating = "NC-17";

UPDATE film set 
	release_year = 2003
where rating = "PG-13";

UPDATE film set 
	release_year = 2004
where rating = "R";

# 4
-- Return any film that hasn't been returned yet
#UPDATE rental set
#	return_date = CURRENT_TIMESTAMP	
#WHERE rental_id = (SELECT r.rental_id FROM rental r WHERE r.return_date IS NULL limit 1);
-- No se puede usar la tabla que se está actualizando xd

# 5 
-- Delete a film(related rows aren't set up to be deleted so you'll have to do that before)
-- To delete a film you need to delete all related rows and rows related to the latter
DELETE
FROM
	film_actor
WHERE 
	film_id = 3;
--
DELETE 
FROM
	film_category
WHERE
	film_id = 3;
-- 

DELETE
FROM
	payment
WHERE
	rental_id in (
	SELECT
		rental_id
	FROM
		rental
	JOIN inventory
			using(inventory_id)
	WHERE
		film_id = 3 );

--
DELETE
FROM
	rental
WHERE
	inventory_id in (
	SELECT 
		inventory_id 
	FROM
		inventory
	WHERE film_id = 3
		);
	
--

DELETE
FROM
	inventory
WHERE
	film_id = 3;

DELETE FROM film
WHERE film_id = 3;

# 6
-- Rent a film. Find one that is in stock and insert a rental and a payment.

SET @someAvailableId =(SELECT
	inventory_id
from
	inventory
where
	inventory_id not in (
	select
		inventory_id
	from
		rental
	where
		return_date is not null) limit 1);


INSERT INTO rental
(rental_id, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(23452,@someAvailableId, 4, NULL, 1, CURRENT_TIMESTAMP);

INSERT INTO payment
(customer_id, staff_id, rental_id, amount, last_update)
VALUES(4, 1, 23452, 24,  CURRENT_TIMESTAMP);






