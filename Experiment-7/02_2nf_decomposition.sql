-- ==============================================================================
-- DBMS Lab – Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)
-- File: 02_2nf_decomposition.sql
-- Description: Decompose 1NF into 2NF to eliminate Partial Functional Dependencies
-- ==============================================================================

USE UniversityDB;

-- Drop dependent tables in reverse FK order if re-executing
DROP TABLE IF EXISTS Registrations;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;

-- ------------------------------------------------------------------------------
-- 1. Create Students Table
-- Candidate Key: student_id
-- Eliminates Partial Dependency: student_id -> student_name
-- ------------------------------------------------------------------------------
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO Students
SELECT DISTINCT student_id, student_name
FROM Registration_UNF;

-- ------------------------------------------------------------------------------
-- 2. Create Courses Table (in 2NF)
-- Candidate Key: course_id
-- Eliminates Partial Dependency on (student_id, course_id) composite key
-- ------------------------------------------------------------------------------
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

-- ------------------------------------------------------------------------------
-- 3. Create Registrations Table (in 2NF)
-- Primary Key: registration_id
-- Foreign Keys: student_id -> Students, course_id -> Courses
-- Fully functionally dependent attributes: semester, grade
-- ------------------------------------------------------------------------------
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

-- Display 2NF Tables
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Registrations;
