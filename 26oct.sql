use sakila;
select * from payment;

-- multi - row funcation : sum , count , max , min , avg

select count(*) from payment;

select count(customer_id) from payment;

select distinct(customer_id) from payment;
select count(distinct(customer_id)) from payment;

select count(customer_id) from payment;

select  count(customer_id) as totalcustomer,
count(distinct(customer_id)) as uniquecustomer,
count(customer_id) - count(distinct(customer_id)) as repeatative_customer from payment;

-- Aggregate function are used to perform calculations 
select * from payment;

select sum(amount) from payment;
select avg(amount) from payment;
select min(amount) from payment;
select max(amount) from payment;

-- group by --> similar values ka group bana deta hai 

select customer_id, sum(amount) from payment
group by customer_id;

-- questions 

use sakila ;

select * from film;

select count(*) from film;

select avg(rental_rate) from film;

select max(replacement_cost), min(replacement_cost) from film;

-- find the max payment prosed by staf member id 1
-- calculate the total revenue (sum of amount) from payment table amount is > then 3
select * from payment;

select max(amount) from payment where staff_id = 1;

select sum(amount) from payment where amount > 3;

-- find the avg rental duration of films rated 'PG'

select * from film;

select avg(rental_duration) from film where rating = 'PG';

-- count films whose replacement cost is >20

select count(*) from film where replacement_cost > 20;

-- find the avg payment amount for each customer
select * from payment;
select customer_id, avg(amount) from payment group by customer_id;

-- count the no. of payment > 5 for each customer

select count(*) from payment where amount > 5 group by customer_id; 