Use sakila;

SELECT c.first_name, c.last_name, c.email, a.city_id
FROM customer AS c
JOIN address AS a ON a.address_id = c.address_id
WHERE a.city_id=312;

SELECT *
FROM category;

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.category_id
FROM film AS f
JOIN film_category AS c ON f.film_id = c.film_id
WHERE c.category_id = 5;

SELECT a.last_name,
	(SELECT f.title, f.release_year
		FROM film AS f)
FROM actor AS a
WHERE a.last_name = 'Lollobrigida';

SELECT a.last_name, a.first_name, f.title
FROM actor AS a
JOIN film_actor AS fa
ON a.actor_id = fa.actor_id
JOIN film AS f
ON fa.film_id = f.film_id
WHERE f.title = 'Bingo Talented';

SELECT c.customer_id AS 'customer id', p.amount*2 AS Amount
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING Amount > AVG(Amount);

SELECT c.first_name, c.last_name, COUNT(p.payment_id) AS num_payments
FROM payment AS p
JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY c.customer_id 
ORDER BY num_payments DESC
LIMIT 5;

SELECT *
FROM customer;