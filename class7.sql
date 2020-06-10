# Find the films with less duration, show the title and rating.
SELECT
	title,
	rating
FROM
	film f
where
	f.`length` <= ALL (
	SELECT
		`length`
	FROM
		film f2 );
# Write a query that returns the title of the film which duration is the lowest.
# If there are more than one film with the lowest durtation, the query returns an empty resultset.
 SELECT
	title,
	rating
from
	film f
where
	f.`length` = (
	SELECT
		MIN(`length`)
	FROM
		film f2)
	AND f.film_id = ALL (
	SELECT
		f.film_id
	FROM
		film f
	where
		f.`length` = (
		SELECT
			MIN(`length`)
		FROM
			film f2));
#Generate a report with list of customers showing the lowest payments done by each of them. 
#Show customer information, the address and the lowest amount, provide both solution using ALL and/or ANY and MIN.

-- Como creo que le gustaría al alexis
SELECT
	DISTINCT c.customer_id,
	c.first_name,
	c.last_name,
	a.address,
	(
	SELECT
		MIN(p2.amount)
	FROM
		payment p2 
	WHERE p2.customer_id = c.customer_id) AS 'min_amount'
FROM
	customer c,
	address a
WHERE
	c.address_id = a.address_id
ORDER BY
	min_amount;

SELECT DISTINCT
	c.first_name,
	c.last_name,
	a.address,
	p.amount AS 'min_amount'
FROM
	customer c,
	address a,
	payment p
WHERE
	c.address_id = a.address_id
	AND p.customer_id = c.customer_id
	AND p.amount <= ALL (
	SELECT
		p2.amount
	FROM
		payment p2
	WHERE
		p2.customer_id = c.customer_id)
ORDER BY
	min_amount;
#Generate a report that shows the customer's information with the highest payment and the lowest payment in the same row.
 SELECT
	DISTINCT c.customer_id,
	c.first_name,
	c.last_name,
	a.address,
	p.amount AS 'min_amount',
	p3.amount AS "max_amount"
FROM
	customer c,
	address a,
	payment p,
	payment p3
WHERE
	c.address_id = a.address_id
	AND p.customer_id = c.customer_id
	AND p3.customer_id = c.customer_id
	AND p.amount <= ALL (
	SELECT
		p2.amount
	FROM
		payment p2
	WHERE
		p2.customer_id = c.customer_id)
	AND p3.amount >= ALL (
	SELECT
		p2.amount
	FROM
		payment p2
	WHERE
		p2.customer_id = c.customer_id)
ORDER BY
	min_amount;
