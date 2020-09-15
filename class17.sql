# 1
-- The next query runs in 57ms(+242ms) whatever that means
SELECT * from address;

-- The next query runs in 18ms. Due to cache I think
SELECT * from address where postal_code in (35200, 17886);

-- The next query runs in 45ms
SELECT
	*
FROM
	address
JOIN
	city c 
	using(city_id)
JOIN
	country c2 
	using(country_id);
	
-- Creating index on postal code column
CREATE INDEX postalCode on address(postal_code);

# 2
-- Querying actors' names and last names separately

-- Run in 27ms
SELECT last_name FROM actor;

-- Run in 4ms
SELECT first_name FROM actor;

-- The last_name field has an index, so the result is caused by cache I think

# 3
-- This query took 10ms(I ran them again, but adding the title in the select, just to make the cache less relevant)
SELECT title, description from film where description LIKE "%drama%";

-- This query took 6ms 
SELECT title, description from film_text where MATCH(title, description) AGAINST('drama');

-- The difference between them may be caused by the second one using an full text index

