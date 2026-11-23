-- ==============================================================================
-- DBMS Lab – Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)
-- File: 01_unf_and_1nf.sql
-- Description: Create denormalized UNF table, insert data, and convert to 1NF
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

-- Drop previous tables if re-executing
DROP TABLE IF EXISTS Registration_1NF;
DROP TABLE IF EXISTS Registration_UNF;

-- 1. Create Denormalized Table (UNF - Unnormalized Form)
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

-- 2. Insert Sample Data into Denormalized Table
INSERT INTO Registration_UNF VALUES
(501, 101, 'Ankan Bhattacharjee', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'A'),
(502, 102, 'Unnati Mishra', 202, 'Operating Systems', 302, 'Dr Rao', 'CSE', 'Semester 3', 'B'),
(503, 103, 'Riya Patel', 203, 'Computer Networks', 303, 'Dr Sen', 'IT', 'Semester 4', 'A'),
(504, 104, 'Isha Gupta', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'B'),
(505, 105, 'Arjun Das', 204, 'Artificial Intelligence', 304, 'Dr Nair', 'AIML', 'Semester 5', 'A');

-- Note: In some lab test cases, row 506 is included with valid student name:
-- (506, 101, 'Ankan Bhattacharjee', 202, 'Operating Systems', 302, 'Dr Rao', 'CSE', 'Semester 3', 'A');

-- 3. Display Denormalized Table
SELECT * FROM Registration_UNF;

-- 4. Converting to 1NF (First Normal Form)
-- In 1NF, each attribute contains only atomic (indivisible) values and no repeating groups.
CREATE TABLE Registration_1NF AS
SELECT * FROM Registration_UNF;

-- Display 1NF Table
SELECT * FROM Registration_1NF;
