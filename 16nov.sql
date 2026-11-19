-- self join or cross join

use sakila;
select * from film;

select * from film_actor;

 select * from actor;
 
-- display all film id and film title with there film actor id

select f.film_id, f.title, fa.actor_id 
from film as f
join film_actor as fa 
on f.film_id = fa.film_id;

-- find all film in witch actor id = 5 has work

select f.title, fa.actor_id
from film as f
join film_actor as fa
on f.film_id =fa.film_id where fa.actor_id=5;

-- actor_id first_name last_name film_id
select f.film_id, fa.actor_id, fa.first_name , fa.last_name 
from film_actor as f
join actor as fa 
on f.actor_id = fa.actor_id ;
