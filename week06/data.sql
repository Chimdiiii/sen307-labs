USE sen307_11303;
SHOW TABLES;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');
INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Mr Ikouwem Usoh', 'i.usoh@vua.edu.ng', 2),
('VUA/ST/104', 'Mr Victor Ayamba', 'v.ayamba@vua.edu.ng', 2),
('VUA/ST/105', 'Mr Bonaventure Anselm', 'b.anselm@vua.edu.ng', 3),
('VUA/ST/106', 'Mrs Ngozi Achebe', 'n.achebe@vua.edu.ng', 3),
('VUA/ST/107', 'Mr Tunde Bakare', 't.bakare@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Zainab Abubakar', 'z.abubakar@vua.edu.ng', 4),
('VUA/ST/109', 'Mr Emeka Obi', 'e.obi@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Halima Sani', 'h.sani@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('11303', 'Chimdiebube Chianumba', 'F', '2007-08-26', 1),
('20231002', 'Paula Opurum', 'F', '2007-11-3', 1),
('20231003', 'Nita Tile', 'F', '2007-09-25', 2),
('20231004', 'Grace Okon', 'F', '2007-01-20', 1),
('20231005', 'David Eluem', 'M', '2007-08-19', 2),
('20231006', 'Fatima Yusuf', 'F', '2007-07-30', 3),
('20231007', 'Samuel Kalu', 'M', '2007-04-11', 3),
('20231008', 'Blessing Uche', 'F', '2007-09-25', 4),
('20231009', 'Emmanuel Ojo', 'M', '2007-12-03', 4),
('20231010', 'Amina Garba', 'F', '2007-02-17', 5),
('20231011', 'Victor Nnamdi', 'M', '2003-10-08', 5),
('20231012', 'Chidinma Eke', 'F', '2006-06-15', 1),
('20231013', 'Ibrahim Lawal', 'M', '2005-01-29', 2),
('20231014', 'Esther Audu', 'F', '2007-03-04', 3),
('20231015', 'Daniel Balogun', 'M', '2004-09-12', 4),
('20231016', 'Maryam Idris', 'F', '2005-11-22', 5),
('20231017', 'Kelechi Ibe', 'M', '2006-04-18', 1),
('20231018', 'Hauwa Suleiman', 'F', '2004-07-07', 2),
('20231019', 'Peter Ogbonna', 'M', '2005-08-27', 3),
('20231020', 'Zainab Momoh', 'F', '2006-12-14', 4);

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 2), (2, 4),
(3, 1), (3, 3), (3, 4),
(4, 1), (4, 2),
(5, 1), (5, 3), (5, 10),
(6, 1), (6, 5), (6, 6),
(7, 1), (7, 5), (7, 7),
(8, 1), (8, 8), (8, 9),
(9, 8), (9, 9),
(10, 10), (10, 4),
(11, 10), (11, 3),
(12, 2), (12, 6),
(13, 3), (13, 7),
(14, 5), (14, 6), (14, 7),
(15, 8), (15, 9),
(16, 10), (16, 2);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 5),
(8, 7),
(9, 8),
(10, 9);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231002';
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231002';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231002';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

-- Step 1: reassign the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department
WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';
-- Step 2: now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;


