-- ==============================================================================
-- DBMS Lab – Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)
-- File: 03_3nf_and_bcnf.sql
-- Description: Decompose 2NF Courses table into 3NF & BCNF to eliminate Transitive Dependencies
-- ==============================================================================

USE UniversityDB;

-- Drop previous 3NF tables if re-executing
DROP TABLE IF EXISTS Courses_3NF;
DROP TABLE IF EXISTS Instructors;

-- ------------------------------------------------------------------------------
-- 1. Create Instructors Table (3NF & BCNF)
-- Functional Dependency: instructor_id -> instructor_name, department
-- Primary Key: instructor_id
-- ------------------------------------------------------------------------------
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

-- ------------------------------------------------------------------------------
-- 2. Create Courses_3NF Table (3NF & BCNF)
-- Eliminates Transitive Dependency: course_id -> instructor_id -> (instructor_name, department)
-- Primary Key: course_id
-- Foreign Key: instructor_id -> Instructors(instructor_id)
-- ------------------------------------------------------------------------------
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

-- Display 3NF / BCNF Tables
SELECT * FROM Instructors;
SELECT * FROM Courses_3NF;
