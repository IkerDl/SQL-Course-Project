USE university_db;

-- AV GRADE BY EACH PROFESSOR
SELECT p.professors_name, AVG(g.grades) AS "Average grade"
FROM professors p
JOIN grades g ON p.professors_id = g.grades_professors_id
GROUP BY p.professors_name;

-- THE TOP GRADES FOR EACH STUDENT
SELECT s.students_name, MAX(g.grades) AS top_grade
FROM students s
JOIN grades g ON s.students_id = g.grades_students_id
GROUP BY s.students_name;

-- SHORT STUDENTS BY THEIR COURSES
SELECT s.students_name, c.courses_title
FROM students s
JOIN courses c ON c.courses_students_id = s.students_id
ORDER BY s.students_name, c.courses_title;

-- Summary report of courses sorted by the most challenging course to the easiest course
SELECT c.courses_title, AVG(g.grades) AS avg_grade
FROM courses c
LEFT JOIN grades g ON c.courses_id = g.grades_courses_id
GROUP BY c.courses_title
ORDER BY avg_grade;

-- Finding which student and professor have the most courses in common
SELECT s.students_name AS student_name, p.professors_name AS professor_name, COUNT(*) AS common_courses
FROM Courses c
JOIN Students s ON c.courses_students_id = s.students_id
JOIN Professors p ON c.courses_professors_id = p.professors_id
GROUP BY s.students_name, p.professors_name
ORDER BY common_courses DESC
LIMIT 1;