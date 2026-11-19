create database nov;
use nov;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    age INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    amount INT,
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'Jaipur', 25),
(2, 'Priya', 'Delhi', 28),
(3, 'Amit', 'Mumbai', 30),
(4, 'Neha', 'Jaipur', 24),
(5, 'Karan', 'Pune', 32),
(6, 'Sneha', 'Delhi', 27),
(7, 'Rohit', 'Udaipur', 26);

INSERT INTO orders VALUES
(101, 1, 'Laptop', 55000, '2026-01-10', 'Delivered'),
(102, 2, 'Mobile', 25000, '2026-01-12', 'Delivered'),
(103, 1, 'Mouse', 800, '2026-01-15', 'Pending'),
(104, 3, 'Keyboard', 1500, '2026-01-18', 'Delivered'),
(105, 4, 'Laptop', 60000, '2026-02-01', 'Pending'),
(106, 2, 'Headphones', 3000, '2026-02-05', 'Delivered'),
(107, 5, 'Mobile', 20000, '2026-02-10', 'Cancelled'),
(108, 1, 'Monitor', 12000, '2026-02-15', 'Delivered'),
(109, 6, 'Tablet', 18000, '2026-02-20', 'Pending'),
(110, 3, 'Mouse', 900, '2026-02-25', 'Delivered');


select * from customers;


SELECT * FROM orders;

-- display couster names along with there order id's.
select customer.customer_name, o.order_id 
from customers as customer
inner join orders as o
on customer.customer_id = o.customer_id;

-- find all order placed by customers from jaipur 
select o.order_id , customer.city
from customers as customer
inner join orders as o
on customer.customer_id = o.customer_id
where city = 'Jaipur';

-- show customer name , product name , order status
select Customer.customer_name, o.product_name, o.status
from customers as customer
inner join orders as o
on customer.customer_id = o.customer_id;

-- display all customers, including those who have not placed any orders
select customer.*
from customers as customer
left join orders as o
on customer.customer_id = o.customer_id;

-- find all order along with customer names, including orders without matching customers.
select o.order_id, customer.customer_name
from orders as o
left join customers as customer
on  o.customer_id= customer.customer_id;

-- display customers who have placed more than one order 
select customer.customer_name,count(o.order_id) as total_count
from orders as o
inner join customers as customer
on  o.customer_id= customer.customer_id
group by customer.customer_name
having count(o.order_id) >1;

-- find customers who have not placed any order
select customer.customer_name
from customers as customer
left  join orders as o
on  customer.customer_id= o.customer_id
where o.order_id is null;