CREATE TABLE student(
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    major TEXT NULL DEFAULT 'unspecified_majority'
);

DROP TABLE student;

INSERT INTO student(name, major) VALUES ('Jack', 'Biology');
INSERT INTO student(name, major) VALUES ('Kate', 'Sociology');
INSERT INTO student(name, major) VALUES ('Claire', 'English');
INSERT INTO student(name, major) VALUES ('Jack', 'Biology');
INSERT INTO student(name) VALUES ('Mike');

UPDATE student
SET major = 'Comp. Sci'
WHERE student_id = 5;

UPDATE student
SET major = 'Chem. Eng.'
WHERE student_id = 4;

UPDATE student
SET name = 'Maria', major = 'French'
WHERE student_id = 3;

DELETE FROM student
WHERE student_id = 2;

INSERT INTO student (name, major) VALUES ('Harry', 'Mathematics');

ALTER TABLE student ADD COLUMN gpa REAL NULL DEFAULT NULL;

UPDATE student
SET gpa = 3.8
WHERE student_id = 1;

SELECT * FROM student;

SELECT name, major FROM student;
SELECT student.name, student.major FROM student;

SELECT name, major FROM student WHERE student_id < 4;
SELECT name, major FROM student WHERE student_id <= 4 AND name = 'Jake';

SELECT name, major FROM student WHERE student_id BETWEEN 1 AND 5 ORDER BY name ASC;


SELECT name, major FROM student WHERE major IN ('Chem. Eng.', 'Comp. Sci.');


------------------------------------------------------------------------------- 

DROP TABLE student;

PRAGMA foreign_keys = ON;

CREATE TABLE student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    major TEXT NULL DEFAULT NULL,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE SET NULL
);

CREATE TABLE department (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

INSERT INTO department (name) VALUES ('Engineering');
INSERT INTO department (name) VALUES ('Science');

INSERT INTO student(name, major, department_id) VALUES ('Jack', 'Biology', 2);
INSERT INTO student(name, major, department_id) VALUES ('Kate', 'Sociology', 2);
INSERT INTO student(name, major, department_id) VALUES ('Claire', 'Comp. Eng.', 1);
INSERT INTO student(name, major, department_id) VALUES ('Jack', 'Chem. Eng.', 1);

SELECT student.name AS student_name,
       student.major AS student_majority,
       department.name AS department_name
FROM student JOIN department
    ON student.department_id = department.id
ORDER BY student_name ASC, department_name DESC;