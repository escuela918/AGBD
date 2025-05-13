SELECT * from film 
INNER join inventory  on film.film_id = inventory.film_id

INNER join store on inventory.store_id = store.store_id
INNER JOIN address on store.address_id = address.address_id
INNER JOIN city on address.city_id = city.city_id
INNER JOIN country on city.country_id = country.country_id 

WHERE title= 'ACE GOLDFINGER'

3	4.99	48	12.99	G	Trailers,Deleted Scenes	2020-12-23 07:12:31	9	2	2	2020-12-23 07:12:45	2	2	2	2020-12-23 07:12:31	2	28 MySQL Boulevard		 	576		 	2020-12-23 07:12:21	576	Woodridge	8	2020-12-23 07:12:21	8	Australia	2020-12-23 07:12:12
3	4.99	48	12.99	G	Trailers,Deleted Scenes	2020-12-23 07:12:31	10	2	2	2020-12-23 07:12:45	2	2	2	2020-12-23 07:12:31	2	28 MySQL Boulevard		 	576		 	2020-12-23 07:12:21	576	Woodridge	8	2020-12-23 07:12:21	8	Australia	2020-12-23 07:12:12
3	4.99	48	12.99	G	Trailers,Deleted Scenes	2020-12-23 07:12:31	11	2	2	2020-12-23 07:12:45	2	2	2	2020-12-23 07:12:31	2	28 MySQL Boulevard		 	576		 	2020-12-23 07:12:21	576	Woodridge	8	2020-12-23 07:12:21	8	Australia	2020-12-23 07:12:12


SELECT * from film
INNER join film_category on film.film_id = film_category.film_id
INNER JOIN category on film_category.category_id = category.category_id
INNER JOIN language on film.language_id = language.language_id 
WHERE length between 60 and 120 



SELECT * from rental
INNER JOIN staff on rental.staff_id = staff.staff_id
INNER JOIN address on staff.address_id = address.address_id
iNNER JOIN city on address.city_id = city.city_id
INNER JOIN country on city.country_id = country.country_id 

1	2005-05-24 22:53:30.000	367	130	2005-05-26 22:04:30.000	1	2020-12-23 07:15:20	1	Mike	Hillyer	3		Mike.Hillyer@sakilastaff.com	1	1	Mike	8cb2237d0679ca88db6464eac60da96345513964	2020-12-23 07:12:31	3	23 Workhaven Lane		 	300		 	2020-12-23 07:12:21	300	Lethbridge	20	2020-12-23 07:12:17	20	Canada	2020-12-23 07:12:12
2	2005-05-24 22:54:33.000	1525	459	2005-05-28 19:40:33.000	1	2020-12-23 07:15:20	2	Jon	Stephens	4		Jon.Stephens@sakilastaff.com	2	1	Jon	8cb2237d0679ca88db6464eac60da96345513964	2020-12-23 07:12:31	4	1411 Lillydale Drive		 	576		 	2020-12-23 07:12:21	576	Woodridge	8	2020-12-23 07:12:21	8	Australia	2020-12-23 07:12:12


SELECT f.title, min(return_date), max(return_date) FROM rental r
INNER JOIN inventory i on r.inventory_id = i.inventory_id
INNER JOIN film f on i.film_id = f.film_id

RECORDS ZORRO	2005-05-25 23:55:21.000	2005-09-02 02:35:22.000

5 nc mucho teorico 
6º SELECT rating, count(*) AS rating from film
GROUP BY rating
ORDER BY  rating DESC

7º SELECT name, count(*) AS category from category
INNER JOIN film_category on film_category.category_id= category.category_id
INNER JOIN film on film.film_id = film_category.film_id
GROUP by name
ORDER by name DESC

8º SELECT last_name, count(*) AS actors from actor
INNER JOIN film_actor on film_actor.actor_id= actor.actor_id
INNER JOIN film on film.film_id = film_actor.film_id
GROUP by last_name
ORDER by actors DESC 
LIMIT 10;

9º SELECT country,city, address, count(*) as inventory_id from inventory
INNER JOIN store on store.store_id= inventory.store_id
INNER JOIN address on address.address_id = store.address_id
INNER JOIN city on city.city_id = address.address_id
INNER JOIN country on country.country_id = city.city_id
GROUP by store.store_id

10º SELECT country,city, address, title,  count(*) as film from film 
INNER JOIN inventory on inventory.film_id = film.film_id
INNER JOIN store on store.store_id= inventory.store_id
INNER JOIN address on address.address_id = store.address_id
INNER JOIN city on city.city_id = address.address_id
INNER JOIN country on country.country_id = city.city_id
GROUP by title
10º SELECT country,city, address, count(*) as inventory_id from inventory
INNER JOIN store on store.store_id= inventory.store_id
INNER JOIN address on address.address_id = store.address_id
INNER JOIN city on city.city_id = address.address_id
INNER JOIN country on country.country_id = city.city_id
GROUP by store.store_id

11º SELECT name, AVG(rental_duration * rental_rate) AS costo_promedio from film
INNER JOIN film_category on film_category.film_id= film.film_id
INNER JOIN category on film_category.category_id = category.category_id
GROUP by name

12º SELECT title as nombre,(rental_duration*rental_rate) as costo_total, rental_duration as dias,rental_rate as costo_por_dia,rental_date as dia_que_se_alquilo,return_date  as dia_que_se_devolvio from film 
INNER JOIN inventory on inventory.film_id = film.film_id
INNER JOIN rental on rental.inventory_id = inventory.inventory_id
WHERE title ="ALABAMA DEVIL"
GROUP by title

13º SELECT title,length, name from film
INNER JOIN film_category on film_category.film_id = film.film_id
INNER JOIN category on category.category_id = film_category.category_id
ORDER by length DESC

14º SELECT count (a.actor_id) AS amen,a.first_name,f.title FROM film f
INNER JOIN film_actor fa on fa.film_id = f.film_id
INNER JOIN actor a on a.actor_id = fa.actor_id
WHERE title like "w%"
GROUP by f.film_id
HAVING amen>= 5
ORDER by amen ASC

15º SELECT sum(amount) as jaja, first_name, last_name from rental r
INNER JOIN payment p on r.rental_id = p.rental_id
INNER JOIN customer c on c.customer_id= r.customer_id
GROUP by c.customer_id

16º SELECT title, length,first_name FROM film
INNER JOIN film_actor on film_actor.film_id = film.film_id
INNER JOIN actor on actor.actor_id = film_actor.actor_id
ORDER by length ASC

17ºSELECT last_name,city,country,address, amount from rental r
INNER JOIN payment p on p.rental_id = r.rental_id
INNER JOIN customer c on c.customer_id = r.customer_id
INNER JOIN address a on a.address_id = c.address_id
INNER JOIN city ci on ci.city_id = a.city_id
INNER JOIN country co on co.country_id = ci.country_id 
ORDER by amount ASC

18ºinsert into actor (actor_id,first_name,last_name,last_update)
VALUES("201","brigit","aguirre","2020-11-25")

19ºinsert into actor (actor_id,first_name,last_name,last_update)
VALUES("202","leonardo","ojeda","2020-13-22"),
      ("203","ana","porco","2020-29-03")

20º UPDATE actor
SET first_name = "ANA", last_name = "PORCO"
WHERE first_name = "ana";
UPDATE actor
SET first_name = "LEONARDO", last_name = "OJEDA"
WHERE first_name = "leonardo";
UPDATE actor
SET first_name = "BRIGIT", last_name = "AGUIRRE"
WHERE first_name = "brigit";

21º DELETE FROM actor
WHERE first_name = "ANA";
DELETE FROM actor
WHERE first_name = "BRIGIT";
DELETE FROM actor
WHERE first_name = "LEONARDO";
