-- show databases;
use sakila;
show databases;
-- create database basic;
-- use basic;
-- ye comment out k liye h

show tables;
select *from actor;

select first_name, last_name from actor;
select actor_id,  actor_id* 10 as product from actor;


select * from actor
where actor_id=5;

select* from actor
where first_name ="ed";

select* from actor
where first_name ="ed" and actor_id>100;

select * from actor
where first_name="ed" or actor_id>100;


select *from actor
where actor_id>10 and actor_id<25;

select  first_name, last_name from actor
where actor_id>12 and actor_id<15;

select * from actor where  actor_id in (3,6);

-- % - any number of charecter ,_ - exaxtly one charecter
select * from actor where first_name like "j%";
select * from actor where  first_name like "m__";

-- jaha first = nnick ya fir first name = ed ho
select * from actor where first_name ="nick" or   first_name ="ed";

--  first name ed or last name chase
 select * from actor where first_name = "ed" and last_name ="chase";
 
 
 -- find  actors whose last name is s
select* from actor where last_name like "s%";


-- display whose first name ends with a
select * from  actor where first_name like "s%a";


-- display actors whose first name  has the second charecter is a
select * from actor where  first_name like "_a%";


-- 1. Find actors whose first name is 'NICK' or 'ED' and whose actor_id is greater than 10.
 select *from actor where first_name = "nick" or first_name= "ed" and actor_id >10;
 
 -- 2. Display actors whose actor_id is between 20 and 80 and whose first name starts with 'A'.
 select * from actor where actor_id between 20 and 80 and first_name like "a%";
 
 
 
 -- 3. Find actors whose first name is in 'NICK', 'ED', 'JOHNNY' and whose last name starts with 'D'.
select * from actor where first_name in( "nick", "ed","johnny") and last_name like "a%";


-- 4. Display actors whose actor_id is between 1 and 50 or whose first name ends with 'A'.
select * from actor where actor_id between 1 and 50 or  first_name like "a%";


-- 5. Find actors whose last name contains 'S' and whose actor_id is between 50 and 100.
select * from actor where actor_id between 50 and 100 and last_name like "%s%";

use sakila;
select  distinct (first_name) from actor;

select * from actor;
select count(last_name) from actor;

select  count(*)from actor;

-- dff between  count* and count column 

select  first_name, upper(lower(first_name)) as new_name from actor;

 select first_name, substr(first_name,3)from actor;
 
 select last_name, substr(last_name,3,2)from actor;
 
 select last_name, substr(last_name,-3,2)from actor;
 
 select first_name, left(first_name,4)from actor;
 
 select first_name, right(first_name,4)from actor; 
 
 select  first_name, instr(first_name, 'n') from actor;
 
 select * from actor;
 select first_name, last_name, concat(first_name, " ", last_name) from actor;

select first_name, last_name, concat(first_name, "$", last_name) as full_name from actor;


-- lpad(), rpad()
select first_name, lpad(first_name,6,"#") from actor;
select first_name, rpad(first_name,6,"#") from actor;

-- trim - whitespace, character
-- trim use hota hai exta spece ko remove ke liye
select  first_name, trim(first_name) from actor;


-- isnull or isnotnull kab or kha use karte hai


-- length or charlength
-- locate or instr
-- replace nam ka function hota hai use kese kerte hai


select last_name, substr(last_name,1,3)from actor;

-- finde tha position of letter  a  in actor frist name
select first_name, instr(first_name, "a") from actor;