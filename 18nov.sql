create database december;


use december;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    City VARCHAR(50),
    Course_ID INT
);


INSERT INTO Students (Student_ID, Student_Name, City, Course_ID)
VALUES
(101, 'Aarav', 'Jaipur', 1),
(102, 'Riya', 'Delhi', 2),
(103, 'Neha', 'Mumbai', 3),
(104, 'Rahul', 'Jaipur', 1),
(105, 'Priya', 'Pune', 4),
(106, 'Aman', 'Delhi', 2),
(107, 'Simran', 'Jodhpur', 5),
(108, 'Karan', 'Mumbai', 3),
(109, 'Ananya', 'Jaipur', NULL),
(110, 'Rohit', 'Udaipur', 6),
(111, 'Sneha', 'Delhi', 7),
(112, 'Mohit', 'Pune', NULL),
(113, 'Pooja', 'Jaipur', 4),
(114, 'Arjun', 'Jodhpur', 8),
(115, 'Meera', 'Kota', 9),
(116, 'Dev', 'Ajmer', 10),
(117, 'Isha', 'Delhi', 11),
(118, 'Varun', 'Mumbai', 12);


CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Instructor_ID INT,
    Fees DECIMAL(10,2)
);

INSERT INTO Courses (Course_ID, Course_Name, Instructor_ID, Fees)
VALUES
(1, 'Python', 201, 15000),
(2, 'SQL', 202, 12000),
(3, 'Power BI', 203, 14000),
(4, 'Excel', 204, 8000),
(5, 'Data Analytics', 205, 20000),
(6, 'Machine Learning', 206, 25000),
(7, 'Statistics', 207, 10000),
(8, 'Tableau', 208, 16000),
(9, 'AWS', 209, 22000),
(10, 'Java', 210, 18000),
(11, 'C++', 211, 11000),
(12, 'Cloud Computing', 212, 24000),
(13, 'Cyber Security', 213, 23000),
(14, 'DevOps', NULL, 21000),
(15, 'Data Science', 214, 28000),
(16, 'AI', 215, 30000),
(17, 'R Programming', NULL, 13000);


CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE,
    Score INT
);

INSERT INTO Enrollments
(Enrollment_ID, Student_ID, Course_ID, Enrollment_Date, Score)
VALUES
(1001, 101, 1, '2026-01-10', 85),
(1002, 102, 2, '2026-01-12', 78),
(1003, 103, 3, '2026-01-15', 92),
(1004, 104, 1, '2026-01-18', 67),
(1005, 105, 4, '2026-01-20', 88),
(1006, 106, 2, '2026-01-22', 74),
(1007, 107, 5, '2026-01-25', 95),
(1008, 108, 3, '2026-01-28', 81),
(1009, 110, 6, '2026-02-01', 89),
(1010, 111, 7, '2026-02-05', 76),
(1011, 113, 4, '2026-02-08', NULL),
(1012, 114, 8, '2026-02-10', 91),
(1013, 115, 9, '2026-02-12', 69),
(1014, 116, 10, '2026-02-15', 84),
(1015, 117, 11, '2026-02-18', 73),
(1016, 101, 2, '2026-02-20', 90),
(1017, 103, 5, '2026-02-22', 87),
(1018, 105, NULL, '2026-02-25', 80),
(1019, NULL, 12, '2026-02-27', 72),
(1020, 118, 12, '2026-03-01', 93);

select * from Students;

select * from Courses;

select * from Enrollments;


--  dispaly student names along with theri cource name
select course.course_name, student.student_name
from students as student 
inner join courses as course 
on student.course_id = course.course_id;

-- display all student along with theri city course name
select s.student_name, c.course_name
from students as s
left join course  as c
 on s.course_id = c.course_id;
 
 
 -- find student who are  enrolled in the python course
 select course.course_name, student.student_name
from students as student 
inner join courses as course 
on student.course_id = course.course_id
where course.course_name = 'Python';

-- display student name course name  and course fees 
select course.course_name, student.student_name, course.fees 
from students as student 
inner join courses as course 
on student.course_id= course.course_id;
 
 
 -- find all student who belong to jaipur  along with theri course name
 select course.course_name, student.student_name
 from students as student 
left join courses as course 
on student.course_id= course.course_id
where student.city ="jaipur";


-- display all student  including those  who have not been assigned any course
 select course.course_name, student.student_name
 from courses as course 
left join students as student 
on student.course_id= course.course_id;

-- display all course  along with   the  names of student enrolled in them, including course  that  have no student
select course.course_id, course.course_name, student.student_name
from courses as course
left join enrollments as e
on course.course_id = e.course_id
left join  students as student
on e.student_id=student.student_id;

-- display student name , course name, enrollment dates, and scores
select course.course_id, course.course_name, student.student_name, e.score
from courses as course
left join enrollments as e
on course.course_id = e.course_id
left join  students as student
on e.student_id=student.student_id;


-- 9. Find students who scored more than 80, along with their course names.
select course.course_id, course.course_name, student.student_name, e.score
from courses as course
left join enrollments as e
on course.course_id = e.course_id
left join  students as student
on e.student_id=student.student_id
where e.score>80;

-- 10. Display students who enrolled in courses with fees greater than ₹15,000.
select c.course_id, c.course_name, s.student_name, c.fees
from students as s
inner join enrollments as e
on s.student_id = e.student_id
inner join  courses as c
on e.course_id= c.course_id
where c.fees>1500;


-- 11. Find students who enrolled in more than one course.
select s.student_id, s.student_name, count( e.course_id)
from students as s
inner join enrollments as e
on e.student_id=s.student_id
group by s.student_id, s.student_name
having count(e.course_id)>1;


-- 12. Display all students who have not enrolled in any course.
select s.student_id, s.student_name
from students as s
inner join enrollments as e
on e.student_id=s.student_id
where e.student_id is null;


-- 13. Find courses in which no student has enrolled.
select course.course_id, course.course_name
from courses as course
left join enrollments as e
on course.course_id = e.course_id
where e.course_id is null;


-- 14. Display student names, course names, instructor IDs, and scores using all three tables.
select c.course_id, s.student_name, instructor_id, e.score
from students as s
inner join enrollments as e
on s.student_id=e.student_id
inner join  courses as c
on e.course_id = c.course_id;

-- 15. Find the total number of students enrolled in each course.
select c.course_id,c.course_name, count(e.student_id) as total_students
from courses as c
left join enrollments as e
on c.course_id=e.course_id
group by c.course_id,c.course_name;


-- 16. Calculate the average score of each course.
select c.course_id,c.course_name, avg( e.score) 
from courses as c
inner join enrollments as e
on c.course_id=e.course_id
group by c.course_id,c.course_name;


-- 17. Find the course with the highest number of enrollments.
select c.course_id,c.course_name, count( e.course_id) 
from courses as c
inner join enrollments as e
on c.course_id=e.course_id
group by c.course_id,c.course_name
order by count( e.course_id) desc
limit 1;

-- 18. Display the total fees collected from each course based on enrollments.
select c.course_id, c.course_name, sum(c.fees) as total_fess
from courses as c
inner join enrollments as e
on c.course_id=e.course_id
group by c.course_id,c.course_name;


-- 19. Find students who have enrolled in courses from more than one course category (distinct courses).
select s.student_id, s.student_name, count(distinct e.course_id) as course_count
from students as s
join enrollments as e
on s.student_id = e.student_id
group by s.student_id, s.student_name
having count(distinct e.course_id) > 1;
-- 20. Display course names whose average score is greater than 80, along with their average score.
select c.course_name, avg(e.score) as average_score
from courses as c
join enrollments as e
on c.course_id = e.course_id
group by c.course_name
having avg(e.score) > 80;