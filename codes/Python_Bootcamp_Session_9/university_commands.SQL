CREATE TABLE student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NULL DEFAULT NULL
);

CREATE TABLE course (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NULL DEFAULT NULL,
    student_id INTEGER,
    FOREIGN KEY(student_id) REFERENCES student(id)
);

INSERT INTO student(name) VALUES('John');
INSERT INTO student(name) VALUES('Jane');
INSERT INTO student(name) VALUES('Bob');
INSERT INTO student(name) VALUES('Alice');

INSERT INTO course(name, student_id) VALUES('Math', 1);
INSERT INTO course(name, student_id) VALUES('English', 2);
INSERT INTO course(name, student_id) VALUES('Science', 3);
INSERT INTO course(name, student_id) VALUES('History', 1);
INSERT INTO course(name, student_id) VALUES('Math', 2);
INSERT INTO course(name, student_id) VALUES('English', 4);

SELECT student.name AS student_name, student.id AS student_id FROM student;

SELECT student.name as student_name, course.name as course_name FROM
	student INNER JOIN course ON student.id = course.student_id;