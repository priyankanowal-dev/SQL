 select * from actor;
use sakila;
select 9*123 from dual;
select sysdate(), current_timestamp(), now();

select curdate(), curtime() from dual;

select now(), adddate(now(),2) from dual;

select now(), adddate(now(), interval 2 month) from dual;

select datediff('2025-07-19', '2025-05-19') from dual;

select extract(minute from now()) from dual;

select now(), date_format(now(), 'this is %y year')from dual;

select last_day(now()) from dual;

select month (now()), year (now()) from dual;

select extract(year from now()) from dual;

-- number function - round(), truncate(), pow, floor(), ceil
 select 24.654, round(24.654);
 
 select 24.654, round(24.654), round(24.654,1), round(24.654,-1)from dual;
 
 select round(364.32,-2) from dual;
 
 select truncate(364.32,2)from dual;
 
 select mod(11,2), pow(3,3), floor(11.9999), ceil(9.0001) from dual;


-- condition statment ka use kiya ha
select first_name, if (first_name='nick', 'yes', if(first_name='ed', 'hello', 'no')) from actor;

select mod(11,2);

select actor_id, first_name,
case
when mod(actor_id, 2) = 0 then "even"
when actor_id = 5 then "$$$"
else "odd"
end as category
from actor;

-- oder by = sorting , alias
select * from actor order by first_name;

select * from actor order by first_name desc;