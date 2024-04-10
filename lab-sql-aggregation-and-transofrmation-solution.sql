USE sakila;
-- Challenge 1
-- 1.1
SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM sakila.film;
-- 1.2
SELECT ROUND(AVG(length)) AS avg_duration FROM sakila.film;
SELECT CONCAT(AVG(length) DIV 60, ' hours ', ROUND(AVG(length) % 60), ' minutes ') AS avg_duration FROM sakila.film;

-- 2.1
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS no_of_operating_days FROM sakila.rental;
-- 2.2 I assumed that the start date of the rental was meant, it was not specified.
SELECT * FROM sakila.rental;
SELECT *, MONTHNAME(rental_date) AS 'month_of_rental', DAYNAME(rental_date) AS day_of_rental FROM sakila.rental
LIMIT 20;
-- 2.3
SELECT *, MONTHNAME(rental_date) AS 'month_of_rental', DAYNAME(rental_date) AS day_of_rental, 
CASE 
WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM sakila.rental;

-- 3. 
SELECT title, IFNULL(rental_duration, 'Not Available') from sakila.film
ORDER BY title ASC;

-- 4.
SELECT CONCAT(first_name, ' ', last_name) AS full_name,LEFT(email, 3) AS start_email_adress FROM sakila.customer
ORDER BY last_name ASC;

-- Challenge 2
-- 1.1 I can count the number of films that are in this database and I assume I can get all of them by looking at the unique film_id.
SELECT COUNT(film_id) AS total_number_of_films from sakila.film;
-- 1.2 
SELECT rating, COUNT(*) AS film_count FROM sakila.film
GROUP BY rating;
-- 1.3
SELECT rating, COUNT(*) AS film_count FROM sakila.film
GROUP BY rating
ORDER BY film_count DESC;

-- 2.1
SELECT rating, ROUND(AVG(length), 2) AS avg_duration FROM sakila.film
GROUP BY rating
ORDER BY avg_duration DESC;
-- 2.2
SELECT rating, ROUND(AVG(length), 2) AS avg_duration FROM sakila.film
GROUP BY rating
HAVING avg_duration > 120
ORDER BY avg_duration DESC;

-- 3.
SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;