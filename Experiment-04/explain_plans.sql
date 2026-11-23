-- ==============================================================================
-- DBMS Lab – Experiment 4: Advanced SQL Queries and Execution Plans
-- File: explain_plans.sql
-- Description: EXPLAIN Query Execution Plan Analysis
-- ==============================================================================

USE CompanyDB;

-- ------------------------------------------------------------------------------
-- Query 1: EXPLAIN for a Simple Selection
-- Inspects index usage and row estimation on a filtered scan
-- ------------------------------------------------------------------------------
EXPLAIN
SELECT *
FROM Employee
WHERE Salary > 90000;


-- ------------------------------------------------------------------------------
-- Query 2: EXPLAIN for INNER JOIN
-- Analyzes table join ordering, join types (ref, eq_ref, ALL), and key lookups
-- ------------------------------------------------------------------------------
EXPLAIN
SELECT e.Emp_Name,
       d.Dept_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID;


-- ------------------------------------------------------------------------------
-- Query 3: EXPLAIN for Correlated Subquery
-- Demonstrates DEPENDENT SUBQUERY execution per outer row evaluation
-- ------------------------------------------------------------------------------
EXPLAIN
SELECT e.Emp_ID,
       e.Emp_Name,
       e.Salary
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.Dept_ID = e.Dept_ID
);


-- ------------------------------------------------------------------------------
-- Query 4: EXPLAIN for EXISTS Clause
-- Analyzes semi-join optimization and subquery short-circuiting
-- ------------------------------------------------------------------------------
EXPLAIN
SELECT d.Dept_Name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.Dept_ID = d.Dept_ID
    AND e.Salary > 100000
);
