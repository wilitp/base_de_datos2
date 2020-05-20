

-- Get amount of cities per country
SELECT
	COUNT(*), c3.country
FROM
	city c,
	country c3
WHERE c.country_id = c3.country_id
GROUP BY c3.country, c.country_id;

