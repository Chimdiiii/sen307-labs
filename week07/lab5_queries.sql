-- ============================================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Chimdiebube Chianumba
-- Matric: 11303
-- ============================================================

USE sen307_11303;

-- Task 1: Students in one department, sorted A-Z

SELECT s.student_id, s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: Joins Student and Department on dept_id to filter only students in Software Engineering and sorts them alphabetically by full_name.


-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_code, c.course_title, l.full_name AS lecturer_name, ca.academic_session
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code ASC, l.full_name ASC;
-- Explanation: Connects Course to Lecturer through the CourseAllocation junction table using two INNER JOINs; SEN307 appears twice because two lecturers are allocated to it.


-- Task 3: Students and their courses (LEFT JOIN)
-- Part A: All students and their enrolled courses (including those with none)
SELECT s.student_id, s.matric_no, s.full_name, c.course_code, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name ASC;

-- Part B: Only students with NO enrolments
SELECT s.student_id, s.matric_no, s.full_name
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;
-- Explanation: Uses LEFT JOIN from Student through Enrolment to Course so every student is kept even without a match; filtering WHERE c.course_title IS NULL isolates the unenrolled students (Peter Ogbonna, Zainab Momoh, and Transfer Student).


-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT s.matric_no, s.full_name, s.gender, s.date_of_birth, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE (s.gender = 'F' OR s.gender = 'M')
  AND s.dept_id IN (1, 3)
  AND s.date_of_birth BETWEEN '2005-01-01' AND '2007-12-31'
ORDER BY s.date_of_birth ASC;
-- Explanation: Combines OR (inside parentheses), IN, AND, and BETWEEN to retrieve students in Software Engineering (1) or Artificial Intelligence (3) born between 2005 and 2007.


-- Task 5: Paginating enrolments with LIMIT and OFFSET

SELECT e.enrolment_id, s.full_name AS student_name, c.course_code, c.course_title
FROM Enrolment e
INNER JOIN Student s ON e.student_id = s.student_id
INNER JOIN Course c ON e.course_id = c.course_id
ORDER BY e.enrolment_id ASC
LIMIT 10 OFFSET 0;


SELECT e.enrolment_id, s.full_name AS student_name, c.course_code, c.course_title
FROM Enrolment e
INNER JOIN Student s ON e.student_id = s.student_id
INNER JOIN Course c ON e.course_id = c.course_id
ORDER BY e.enrolment_id ASC
LIMIT 10 OFFSET 10;
-- Explanation: Paginates enrolment records 10 rows per page using LIMIT and OFFSET. ORDER BY is mandatory with LIMIT/OFFSET because SQL tables have no guaranteed physical row order, so without sorting, pages could return duplicate or skipped rows across requests.


-- Challenge (Optional): Task 3 rewritten using RIGHT JOIN
SELECT s.student_id, s.matric_no, s.full_name, c.course_code, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name ASC;
-- Explanation: Reverses the table order (Course -> Enrolment -> Student) with RIGHT JOINs so all rows from Student on the right are preserved. The LEFT JOIN version is much easier to read because it starts naturally with the primary entity (Student) and reads left-to-right into its optional courses.