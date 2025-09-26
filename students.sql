create database student_grading_system;
use student_grading_system;

-- إنشاء جدول الطلاب
create table students (
student_id int primary key,
first_name varchar(50),last_name varchar(50),
email varchar(100),date_of_birth date);

-- إنشاء جدول المواد
create table courses(
course_id int primary key,course_name varchar(100)
,course_code varchar(10));

-- إنشاء جدول النتائج
create table grades(
grade_id int primary key, student_id int ,course_id int,
grade_value decimal(5,2), exam_date date,
-- لربط الجداول ببعضها
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses(course_id)); 

-- إدخال بيانات في جدول الطلاب
insert into students
values (71,'Ahmed','Mostafa','sagjh188@gmail.com','2006-06-20'),
(72,'Soheer','Mohamed','sohmohamed143@gmail.com','2006-07-08'),
(73,'Salma','Kamal','sdhbf445@gmail.com','2005-04-29'),
(74,'Malak','Shady','hiuhvr@gmail.com','2005-10-07'),
(75,'Maryam','Matter','irfhid@gmail.com','2006-09-01'),
(76,'Ahmed','Masoud','iudhdco@gmail.com','2002-05-30'),
(77,'Mohamed','Tharwat','mohakvfn@gmail.com','2005-05-05'),
(78,'Sara','Ramadan','sarsora74@gmail.com','2006-04-23'),
(79,'Rawan','Mahmoud','gfhgsd@gmail.com','2006-06-26'),
(80,'Seef','Mohamed','cbdukiu78@gmail.com','1999-06-06'); 
select * from students order by first_name asc;

-- إدخال بيانات في جدول المواد
insert into courses 
values (24,'Database Management System','CS101'),
(25,'Introduction to Programming','CS102'),
(26,'Operating System','CS103'),
(27,'Data Structures and Algorithms','CS201'),
(28,'Computer Networks','CS202');
select * from courses;

-- إدخال بيانات في جدول النتائج
insert into grades 
values (1,71,24,85.5,'2025-05-12'),(2,71,28,90,'2025-05-20'),
(3,72,25,98.7,'2025-05-15'),(4,72,24,89,'2025-05-12'),
(5,73,27,67.34,'2025-05-23'),(6,73,25,74.32,'2025-05-15'),
(7,74,26,55,'2025-06-01'),(8,74,28,46.8,'2025-05-20'),
(9,75,26,75,'2025-06-01'),(10,75,27,98,'2025-05-23'),
(11,76,25,69.6,'2025-05-15'),(12,76,28,74.9,'2025-05-20'),
(13,77,25,45.64,'2025-05-15'),(14,77,26,77,'2025-06-01'),
(15,78,26,93,'2025-06-01'),(16,78,24,74.8,'2025-05-12'),
(17,79,24,86.93,'2025-05-12'),(18,79,27,95,'2025-05-23'),
(19,80,27,90,'2025-05-23'),(20,80,28,88.8,'2025-05-20'); 
select * from grades; 

-- عرض الصفوف التي تحتوي على قيم متطابقة في الجدولين
select first_name ,last_name, course_name, grade_value,exam_date
from grades 
inner join students
on grades.student_id = students.student_id
inner join courses
on grades.course_id = courses.course_id;