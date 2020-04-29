# Find the films with less duration, show the title and rating.
SELECT title,rating FROM film f where f.`length` = (SELECT MIN(`length`) FROM film f2 );


# Write a query that returns the title of the film which duration is the lowest. If there are more than one film with the lowest durtation, the query returns an empty resultset.
SELECT title, rating from film f 
	where f.`length` = (SELECT MIN(`length`) FROM film f2)
	AND f.film_id = ALL (
			SELECT f.film_id FROM film f 
				where f.`length` = (SELECT MIN(`length`) FROM film f2);
				
		

