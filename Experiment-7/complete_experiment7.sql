-- ==============================================================================
-- DBMS Lab – Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)
-- File: complete_experiment7.sql
-- Description: Unified Executable Script for Experiment 7 (UNF -> 1NF -> 2NF -> 3NF/BCNF -> Lossless Join & Dependency Verification)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. DATABASE INITIALIZATION
-- ------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- Clean up existing tables in reverse dependency order
DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Courses_3NF;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Registration_1NF;
DROP TABLE IF EXISTS Registration_UNF;

-- ------------------------------------------------------------------------------
-- 2. CREATE AND POPULATE DENORMALIZED TABLE (UNF)
-- ------------------------------------------------------------------------------
CREATE TABLE Registration_UNF (
    registration_id INT,
    student_id INT,
    student_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100),
    department VARCHAR(100),
    semester VARCHAR(20),
    grade CHAR(2)
);

INSERT INTO Registration_UNF VALUES
(501, 101, 'Ankan Bhattacharjee', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'A'),
(502, 102, 'Unnati Mishra', 202, 'Operating Systems', 302, 'Dr Rao', 'CSE', 'Semester 3', 'B'),
(503, 103, 'Riya Patel', 203, 'Computer Networks', 303, 'Dr Sen', 'IT', 'Semester 4', 'A'),
(504, 104, 'Isha Gupta', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'B'),
(505, 105, 'Arjun Das', 204, 'Artificial Intelligence', 304, 'Dr Nair', 'AIML', 'Semester 5', 'A');

SELECT * FROM Registration_UNF;

-- ------------------------------------------------------------------------------
-- 3. CONVERT TO 1NF (FIRST NORMAL FORM)
-- ------------------------------------------------------------------------------
CREATE TABLE Registration_1NF AS
SELECT * FROM Registration_UNF;

SELECT * FROM Registration_1NF;

-- ------------------------------------------------------------------------------
-- 4. CONVERT TO 2NF (SECOND NORMAL FORM)
-- Eliminates partial dependencies on candidate keys
-- ------------------------------------------------------------------------------

-- Students Table (student_id -> student_name)
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO Students
SELECT DISTINCT student_id, student_name
FROM Registration_UNF;

-- Courses Table (2NF)
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    instructor_name VARCHAR(100),
    department VARCHAR(100)
);

INSERT INTO Courses
SELECT DISTINCT
    course_id,
    course_name,
    instructor_id,
    instructor_name,
    department
FROM Registration_UNF;

-- Registrations Table (2NF)
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Registrations
SELECT DISTINCT
    registration_id,
    student_id,
    course_id,
    semester,
    grade
FROM Registration_UNF;

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Registrations;

-- ------------------------------------------------------------------------------
-- 5. CONVERT TO 3NF & BCNF (THIRD NORMAL FORM / BOYCE-CODD NORMAL FORM)
-- Eliminates transitive dependency: course_id -> instructor_id -> (instructor_name, department)
-- ------------------------------------------------------------------------------

-- Instructors Table (instructor_id -> instructor_name, department)
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

INSERT INTO Instructors
SELECT DISTINCT
    instructor_id,
    instructor_name,
    department
FROM Registration_UNF;

-- Courses_3NF Table (course_id -> course_name, instructor_id)
CREATE TABLE Courses_3NF (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

INSERT INTO Courses_3NF
SELECT DISTINCT
    course_id,
    course_name,
    instructor_id
FROM Registration_UNF;

SELECT * FROM Instructors;
SELECT * FROM Courses_3NF;

-- ------------------------------------------------------------------------------
-- 6. VERIFICATION: NORMALIZED TABLES
-- ------------------------------------------------------------------------------
SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Courses_3NF;
SELECT * FROM Registrations;

-- ------------------------------------------------------------------------------
-- 7. VERIFICATION: LOSSLESS JOIN DECOMPOSITION
-- ------------------------------------------------------------------------------
SELECT
    r.registration_id,
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name,
    i.instructor_id,
    i.instructor_name,
    i.department,
    r.semester,
    r.grade
FROM Registrations r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses_3NF c ON r.course_id = c.course_id
JOIN Instructors i ON c.instructor_id = i.instructor_id
ORDER BY r.registration_id;

-- ------------------------------------------------------------------------------
-- 8. VERIFICATION: DEPENDENCY PRESERVATION
-- (Each query returns 0 rows, confirming no FD violation exists)
-- ------------------------------------------------------------------------------
-- Verifying student dependency
SELECT student_id
FROM Students
GROUP BY student_id
HAVING COUNT(DISTINCT student_name) > 1;

-- Verifying instructor dependency
SELECT instructor_id
FROM Instructors
GROUP BY instructor_id
HAVING COUNT(DISTINCT instructor_name) > 1
    OR COUNT(DISTINCT department) > 1;

-- Verifying course dependency
SELECT course_id
FROM Courses_3NF
GROUP BY course_id
HAVING COUNT(DISTINCT course_name) > 1
    OR COUNT(DISTINCT instructor_id) > 1;

-- Verifying registration uniqueness
SELECT registration_id
FROM Registrations
GROUP BY registration_id
HAVING COUNT(*) > 1;

-- ------------------------------------------------------------------------------
-- 9. FINAL RECONSTRUCTED CANONICAL TABLE
-- ------------------------------------------------------------------------------
SELECT
    r.registration_id,
    s.student_name,
    c.course_name,
    i.instructor_name,
    i.department,
    r.semester,
    r.grade
FROM Registrations r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses_3NF c ON r.course_id = c.course_id
JOIN Instructors i ON c.instructor_id = i.instructor_id
ORDER BY r.registration_id;
