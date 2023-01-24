-- CREATE DATABASE student_school;

USE student_school;

CREATE TABLE students(
id INT AUTO_INCREMENT,
first_name VARCHAR(50),
PRIMARY KEY (id));

CREATE TABLE papers(
student_id INT,
title VARCHAR(50),
grade INT,
FOREIGN KEY(student_id) REFERENCES students(id));

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT 
    first_name, title, grade
FROM
    students
        INNER JOIN
    papers ON papers.student_id = students.id
ORDER BY grade DESC;


SELECT 
    first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id
ORDER BY first_name;


SELECT 
    first_name, ROUND(AVG(IFNULL(grade, 0)), 2) AS average
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;

SELECT 
    first_name,
    ROUND(AVG(IFNULL(grade, 0)), 2) AS average,
    CASE
        WHEN average > 70 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
        LEFT JOIN
    papers ON papers.student_id = students.id
GROUP BY first_name
ORDER BY average DESC;

