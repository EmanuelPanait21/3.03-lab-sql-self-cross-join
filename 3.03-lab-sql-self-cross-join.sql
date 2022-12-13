/*
1. Get all pairs of actors that worked together.
2.Get all pairs of customers that have rented the same film more than 3 times.
3. Get all possible pairs of actors and films.
*/

-- 1. Get all pairs of actors that worked together.
use sakila;

select f1.actor_id, f1.film_id, f2.actor_id from film_actor f1
join film_actor f2
on f1.film_id = f2.film_id
and f1.actor_id > f2.actor_id;

-- 2.Get all pairs of customers that have rented the same film more than 3 times.

select a1.customer_id, a1.film_id, a2.customer_id

from(
select customer_id, film_id from customer
join rental using(customer_id)
join inventory using(inventory_id)
	) a1

join(
select customer_id, film_id from customer
join rental using(customer_id)
join inventory using(inventory_id)
	) a2
    
on a1.film_id = a2.film_id
and a1.customer_id < a2.customer_id
;


-- 3. Get all possible pairs of actors and films.

select * from (
  select distinct title from film 
) sub1
cross join (
  select distinct actor_id from film_actor
) sub2