-- ==============================================================================
-- DBMS Lab – Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)
-- File: 04_verification_lossless_and_fd.sql
-- Description: Verifying Normalized Tables, Lossless Join Decomposition, and Dependency Preservation
-- ==============================================================================

USE UniversityDB;

-- ==============================================================================
-- 1. Verifying All Normalized Tables
-- ==============================================================================
SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Courses_3NF;
SELECT * FROM Registrations;

-- ==============================================================================
-- 2. Verifying Lossless Join Decomposition
-- Demonstrates that joining the normalized tables reconstructs the original
-- relation exactly with no spurious tuples and no data loss.
-- ==============================================================================
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

-- ==============================================================================
-- 3. Verifying Dependency Preservation
-- Evaluates whether every original functional dependency X -> Y holds in the
-- decomposed relations. An empty result set (0 rows) confirms full preservation.
-- ==============================================================================

-- Test 1: Verifying student dependency (student_id -> student_name)
SELECT student_id
FROM Students
GROUP BY student_id
HAVING COUNT(DISTINCT student_name) > 1;

-- Test 2: Verifying instructor dependency (instructor_id -> instructor_name, department)
SELECT instructor_id
FROM Instructors
GROUP BY instructor_id
HAVING COUNT(DISTINCT instructor_name) > 1
    OR COUNT(DISTINCT department) > 1;

-- Test 3: Verifying course dependency (course_id -> course_name, instructor_id)
SELECT course_id
FROM Courses_3NF
GROUP BY course_id
HAVING COUNT(DISTINCT course_name) > 1
    OR COUNT(DISTINCT instructor_id) > 1;

-- Test 4: Verifying registration uniqueness (registration_id PK constraint)
SELECT registration_id
FROM Registrations
GROUP BY registration_id
HAVING COUNT(*) > 1;

-- ==============================================================================
-- 4. Final Table (Reconstructed Canonical View)
-- ==============================================================================
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
