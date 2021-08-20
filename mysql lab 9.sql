USE sakila;
-- 1
SELECT COUNT(DISTINCT sakila.actor.last_name) as 'number of diferent last names'
FROM sakila.actor;
-- 2
SELECT* ,
CASE
WHEN date_format(rental_date,'%a') in ('Mon', 'Tue', 'Wed','Thu','Fry') then 'Weekday'
ELSE 'Weekend'
END as 'day_type'
FROM sakila.rental;
-- 3
SELECT title
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';
-- 4
SELECT title, length
FROM sakila.film
ORDER BY length DESC
LIMIT 10;
-- 5
SELECT COUNT(special_features) as 'Behind the scenes included'
FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
-- 6
SELECT rating, round(AVG(length),2) as 'average duration'
FROM sakila.film
GROUP BY rating
HAVING round(AVG(length),2)>120;
-- 7
SELECT  DENSE_RANK() OVER(ORDER BY length ASC) as 'rank',length,title
FROM sakila.film
WHERE length IS NOT NULL AND length !=0
ORDER BY length ASC;