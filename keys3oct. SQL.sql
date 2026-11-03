-- key ka use  kon kon si key
-- 7 key hoti hai
-- 1  primary key
-- primary key table ki har row ki unique ki phchan krti h 
-- null vallues  nhi ho skti
-- duplicate value bhi nhi skti



-- 2 foreign key 
-- foregin key ka use 2 table k bich  relationship bnane k liye kiya jata




-- 3 candidate key 
--  single columns 



-- 4 alternate key
-- candidate keys me jis key  ko primary key nhi bnayaa jata usko alternate key khte h




-- 5 super key
-- ek ya ek se aadik columns ka asea group jo table ke partyek record ki phchan kar ske
-- student_id
-- student_id + name
-- student_id +email




-- 6 composite key
-- jab 2 ya 2 se aadik column smilkar kisi record ki unique ki phchan krte h to ase composite key khte
-- student_id        course_id
-- 101               1
-- 101                2
-- 102                 1

-- yha student_id or curse_id milkar composite key bna skte hai

-- 7 unique key
-- unique key ka use kisi column me duplicate values ko rokne k liye kiya jata hai 
-- null values ho skti h



-- constraints

CREATE DATABASE company_practice;

USE company_practice;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    age INT,
    experience INT,
    gender VARCHAR(10)
);


INSERT INTO employees
(emp_id, emp_name, department, city, salary, age, experience, gender)
VALUES
(1, 'Aarav', 'IT', 'Jaipur', 55000, 25, 2, 'Male'),
(2, 'Priya', 'HR', 'Delhi', 42000, 28, 4, 'Female'),
(3, 'Rahul', 'IT', 'Mumbai', 75000, 32, 7, 'Male'),
(4, 'Sneha', 'Finance', 'Jaipur', 60000, 29, 5, 'Female'),
(5, 'Amit', 'Sales', 'Delhi', 35000, 24, 1, 'Male'),
(6, 'Neha', 'IT', 'Jaipur', 68000, 30, 6, 'Female'),
(7, 'Vikas', 'Sales', 'Mumbai', 45000, 27, 3, 'Male'),
(8, 'Pooja', 'HR', 'Jaipur', 50000, 31, 8, 'Female'),
(9, 'Rohit', 'Finance', 'Delhi', 80000, 35, 10, 'Male'),
(10, 'Anjali', 'IT', 'Delhi', 72000, 26, 4, 'Female'),
(11, 'Karan', 'Sales', 'Jaipur', 40000, 29, 5, 'Male'),
(12, 'Meena', 'Finance', 'Mumbai', 65000, 33, 9, 'Female'),
(13, 'Arjun', 'HR', 'Mumbai', 38000, 23, 2, 'Male'),
(14, 'Kavita', 'IT', 'Jaipur', 90000, 36, 12, 'Female'),
(15, 'Mohit', 'Sales', 'Delhi', 52000, 30, 6, 'Male'),
(16, 'Riya', 'Finance', 'Jaipur', 58000, 27, 3, 'Female'),
(17, 'Sahil', 'IT', 'Mumbai', 48000, 24, 1, 'Male'),
(18, 'Divya', 'HR', 'Delhi', 62000, 34, 9, 'Female'),
(19, 'Nitin', 'Sales', 'Mumbai', 70000, 32, 8, 'Male'),
(20, 'Isha', 'Finance', 'Delhi', 45000, 25, 2, 'Female');


-- 1. Display the total number of employees, maximum salary, minimum salary, and average salary from the employees table.

select count(*)as total_no_employees ,max(salary),min(salary),avg(salary)from employees;

-- 2. Find the total salary paid to employees working in the IT department.
select sum(salary) from employees where department ="it";


-- 3. Display the department-wise employee details for employees whose salary is greater than ₹50,000. (Use WHERE and ORDER BY salary in descending order.)
select * from employees where salary>50000 order by salary desc;


-- 4. Find the average salary of employees who are older than 28 years.
select avg(salary) from employees  where age>28;

-- 5. Count the number of male and female employees separately.
select gender, count(*)from employees  group by gender;

-- 6. Display the total number of employees in each department.
 select department,count(emp_id) from employees  group by department;
 

-- 7. Find the average salary of each department and arrange the result in descending order of average salary.
 select department,avg(salary) from employees group by department order by avg(salary) desc;
 
 
-- 8. Display departments having more than 3 employees.
select department,count(*) from employees group by department having  count(*)<3;


-- 9. Find departments where the maximum salary is greater than ₹70,000.
select department, max(salary) from employees group by department having max(salary)>70000;


-- 10. Display the total salary of employees city-wise, but show only those cities where the total salary exceeds ₹1,50,000.
select city,sum(salary) from employees group by city having sum(salary)>150000;


-- 11. Find the average salary of employees in each department whose experience is greater than 3 years. Display only those departments where the average salary is greater than ₹50,000.
select department,avg(salary) from employees  where experience >3 group by department having avg(salary)>50000;


-- 12. Display the department-wise employee count for employees whose age is greater than 25. Show only departments having at least 2 such employees. Sort the result by employee count in descending order.
 select department, count(*) from employees where age>25  group by department  having count(*)>=2
 order by  count(*) desc;
 
 
-- 13. Find the total and average salary of female employees in each department. Display only those departments where the average salary is greater than ₹50,000.
 select department, sum(salary),avg(salary) from employees where gender ="female"  group by department 
 having sum(salary)>50000;
 
 
-- 14. Display the top 3 highest-paid employees along with their names, departments, and salaries.
 select emp_name,department, salary from employees order by salary desc limit 3;
 
 
-- 15. Find the top 3 departments based on their average salary. Consider only employees earning more than ₹40,000 and display departments having at least 2 qualifying employees.
select department, avg(salary), count(*) from employees
where  salary > 40000 
group by  department 
having count(*) > 2 
order by  avg(salary) desc
limit 3;
