#1
SELECT * FROM actor a WHERE EXISTS (
	SELECT * FROM actor a2 WHERE a.last_name = a2.last_name AND a.actor_id <> a2.actor_id
) ORDER  BY a.last_name


select * from actor a ;

#2
SELECT * FROM actor a WHERE NOT EXISTS (
	SELECT * FROM film_actor fa, film f2 WHERE a.actor_id = fa.actor_id
			AND f2.film_id = fa.film_id
);# No se si está bien

#3
SELECT * FROM customer c 
    WHERE (SELECT COUNT(*) FROM rental r2 WHERE r2.customer_id = c.customer_id) = 1;

    
#4
SELECT * FROM customer c 
    WHERE (SELECT COUNT(*) FROM rental r2, customer c2 WHERE r2.customer_id = c2.customer_id) > 1

#5
SELECT DISTINCT a.first_name FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id = fa.film_id AND (f.title = "BETRAYED REAR" OR f.title = "CATCH AMISTAD");

	
#6
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id=fa.film_id AND f.title="BETRAYED REAR" AND a.actor_id NOT IN (
		SELECT a2.actor_id from actor a2, film_actor fa2, film f2 WHERE a2.actor_id = fa2.actor_id 
			AND f2.film_id=fa2.film_id AND f2.title="CATCH AMISTAD"
	);

#7
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id=fa.film_id AND f.title="BETRAYED REAR" AND a.actor_id IN (
		SELECT a2.actor_id from actor a2, film_actor fa2, film f2 WHERE a2.actor_id = fa2.actor_id 
			AND f2.film_id=fa2.film_id AND f2.title="CATCH AMISTAD"
	);


#8
SELECT * FROM actor a, film_actor fa , film f WHERE a.actor_id=fa.actor_id
	AND f.film_id = fa.film_id AND (f.title <> "BETRAYED REAR" OR f.title <> "CATCH AMISTAD");
	
