-- display all record      select *
-- show specific columns    select
-- remove duplicate values   disitinct
-- find  record where        where
-- both condition            ans
-- any one condition        or
-- between two values       between
-- match values from a list   in
-- starts with a             like "a%"
-- ends with a               like "%a"
-- contains a                like"%a%"
-- count total salary         count(salary)
-- find total salary          sum(slary)
-- highest value              max()
-- find avg salary            avg()
-- lowest value               min ()
-- department wise            group by
-- city wise                  group by
--  filter groups             having
-- arrange asc              order by ASC
-- arrange desc              order by desc
-- top 5 record               limit 5





use company_practice;

drop table if exists employees, sales;

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10,2),
    Joining_Date DATE,
    Email VARCHAR(100),
    Gender VARCHAR(10)
);

INSERT INTO Employees VALUES
(101, 'Rahul Sharma', 'IT', 'Jaipur', 55000, '2022-03-15', 'rahul@gmail.com', 'Male'),
(102, 'Priya Verma', 'HR', 'Delhi', 42000, '2021-06-20', 'priya@gmail.com', 'Female'),
(103, 'Amit Kumar', 'IT', 'Jaipur', 65000, '2020-01-10', 'amit@yahoo.com', 'Male'),
(104, 'Neha Singh', 'Finance', 'Mumbai', 48000, '2023-02-05', 'neha@gmail.com', 'Female'),
(105, 'Rohit Meena', 'Sales', 'Delhi', 38000, '2022-11-18', 'rohit@yahoo.com', 'Male'),
(106, 'Anjali Gupta', 'IT', 'Mumbai', 72000, '2019-08-25', 'anjali@gmail.com', 'Female'),
(107, 'Vikas Jain', 'Finance', 'Jaipur', 52000, '2021-04-12', 'vikas@gmail.com', 'Male'),
(108, 'Sneha Rao', 'HR', 'Mumbai', 45000, '2023-07-01', 'sneha@yahoo.com', 'Female'),
(109, 'Karan Patel', 'Sales', 'Jaipur', 41000, '2020-09-30', 'karan@gmail.com', 'Male'),
(110, 'Pooja Sharma', 'IT', 'Delhi', 68000, '2022-01-15', 'pooja@yahoo.com', 'Female'),
(111, 'Arjun Singh', 'Finance', 'Delhi', 58000, '2018-12-10', 'arjun@gmail.com', 'Male'),
(112, 'Meena Joshi', 'Sales', 'Mumbai', 39000, '2021-10-22', 'meena@gmail.com', 'Female'),
(113, 'Ravi Kumar', 'IT', 'Jaipur', 60000, '2023-05-14', 'ravi@yahoo.com', 'Male'),
(114, 'Simran Kaur', 'HR', 'Jaipur', 47000, '2020-06-08', 'simran@gmail.com', 'Female'),
(115, 'Deepak Yadav', 'Sales', 'Delhi', 44000, '2019-03-19', 'deepak@yahoo.com', 'Male'),
(116, 'Isha Malhotra', 'Finance', 'Mumbai', 62000, '2022-08-11', 'isha@gmail.com', 'Female'),
(117, 'Manish Soni', 'IT', 'Mumbai', 75000, '2017-07-21', 'manish@gmail.com', 'Male'),
(118, 'Kavita Das', 'HR', 'Delhi', 50000, '2021-12-05', 'kavita@yahoo.com', 'Female'),
(119, 'Suresh Patel', 'Sales', 'Jaipur', 46000, '2023-09-17', 'suresh@gmail.com', 'Male'),
(120, 'Ritu Sharma', 'Finance', 'Delhi', 55000, '2020-02-28', 'ritu@yahoo.com', 'Female');

select * from employees;

-- 1. Display employee names in uppercase, along with their department and salary. Include only employees earning more than ₹45,000.
select upper(emp_name) department,salary 
from employees
where salary>450000;


-- 2. Find the total number of employees and average salary in each department. Sort departments by average salary in descending order.
select department, count(*),avg(salary)as total_employee from employees group by department order by total_employee desc;


-- 3. Find departments having more than 3 employees and a total salary expenditure greater than ₹1,50,000.
select department, count(*),sum(salary) from employees group by department having count(*)>3 and sum(salary)>150000;


-- 4. Display employee names, joining dates, and joining month names for employees who joined after 2020.
select emp_name, joining_date, monthname(joining_date) from employees where joining_date>="2021-01-01";



-- 5. Find the top 5 highest-paid employees from Jaipur and Mumbai, excluding employees earning less than ₹45,000.
select* from employees where city in ("jaipur","mumbai")and salary>=45000 order by salary desc limit 5;


-- 6. Display the number of employees who joined in each year. Sort the result by year in ascending order.
select year(joining_date), count(*) from employees group by (joining_date) order by count(*) desc;


-- 7. Find the average salary of male and female employees separately in each department. Display only groups having an average salary above ₹45,000.
select department gender,avg(salary) from employees group by department having avg(salary)>45000;

-- 8. Display employee names and their first names extracted using string functions. Sort the output alphabetically by first name.
select emp_name, substring_index(emp_name, ' ', 1) as first_name from employees order by first_name;


-- 9. Find cities having at least 3 employees whose salaries are greater than ₹40,000. Display their employee count and average salary.
select city, count(*), avg(salary)from employees where salary>40000 group by city having count(*)>=3;


-- 10. Display the 5 most recently joined employees, along with their names, departments and joining dates.
select emp_name, department, joining_date from employees order by joining_date limit 5;


-- 11. Find the maximum and minimum salary in each city. Display only cities where the salary difference exceeds ₹15,000.
select city, max(salary),min(salary),max(salary)-min(salary)from employees group by city
 having max(salary)-min(salary)>15000;
 
 
-- 12. Display employees whose email addresses end with gmail.com and whose names contain the letter 'a'. Sort by salary in descending order.
select * from employees where email like "%gmail.com" and emp_name like "%a%" order by salary desc;


-- 13. Find the total salary expenditure for each department and gender combination. Display only groups having total salary greater than ₹1,00,000.
select department, gender, sum(salary) as total_salary
from employees group by department, gender
having sum(salary) > 100000;

-- 14. Display the top 3 departments based on the number of employees, considering only employees who joined after 2020.
select department, count(*) as employee_count
from employees
where year(joining_date)>2020 
group by department
order by employee_count desc
limit 3;

-- 15. Find the number of employees who joined in each month. Sort the months by employee count in descending order.
select monthname(joining_date), count(*) from employees group by monthname(joining_date) order by count(*);

-- 16. Display employee names in reverse order along with their email addresses. Include only employees whose salary is between ₹40,000 and ₹60,000.
select reverse(emp_name), email from employees where salary between 40000 and 60000;


-- 17. Find departments having more than 2 employees from Jaipur and calculate their average salary.
select department,avg(salary) from employees where city ="jaipur" group by department having count(*)>2;


-- 18. Display employees who joined in January, June or December. Show their name, joining date and joining year.
select emp_name, joining_date, year(joining_date) 
from employees
where month(joining_date) in (1, 6, 12);

-- 19. Display the third, fourth and fifth highest-paid employees using ORDER BY, LIMIT and OFFSET.
select * from employees  order by salary desc limit 3 offset 2;


-- 20. Find the department-wise average salary for employees whose names contain more than 8 characters. Display only departments having at least 2 such employees.
select department, avg(salary), count(*) 
from employees
where length(emp_name)>8 
group by department
having count(*) >= 2;

