-- ==============================================================================
-- DBMS Lab – Experiment 10: Query Optimization, Indexing & Query Rewriting
-- File: 02_five_slow_queries_unindexed.sql
-- Description: Execution plan analysis of 5 slow queries before indexing (Full Table Scans)
-- ==============================================================================

USE EnterpriseDB;

-- ==============================================================================
-- Query 1: Search by Department (Unindexed)
-- Evaluates full table scan on Department = 'IT'
-- Expected: type = ALL, key = NULL, rows = ~10000, Extra = Using where
-- ==============================================================================
EXPLAIN SELECT * FROM Employees
WHERE Department = 'IT';


-- ==============================================================================
-- Query 2: Search by City (Unindexed)
-- Evaluates full table scan on City = 'Delhi'
-- Expected: type = ALL, key = NULL, rows = ~10000, Extra = Using where
-- ==============================================================================
EXPLAIN SELECT * FROM Employees
WHERE City = 'Delhi';


-- ==============================================================================
-- Query 3: Salary Filtering (Unindexed Range Query)
-- Evaluates full table scan on Salary > 50000
-- Expected: type = ALL, key = NULL, rows = ~10000, Extra = Using where
-- ==============================================================================
EXPLAIN SELECT * FROM Employees
WHERE Salary > 50000;


-- ==============================================================================
-- Query 4: Multiple Conditions (Unindexed Multi-Attribute Filter)
-- Evaluates full table scan on Department = 'Sales' AND City = 'Mumbai'
-- Expected: type = ALL, key = NULL, rows = ~10000, Extra = Using where
-- ==============================================================================
EXPLAIN SELECT * FROM Employees
WHERE Department = 'Sales'
AND City = 'Mumbai';


-- ==============================================================================
-- Query 5: Sorting and Filtering (Unindexed Sort Overhead)
-- Evaluates full table scan on Department = 'HR' with ORDER BY Salary DESC
-- Expected: type = ALL, rows = ~10000, Extra = Using where; Using filesort
-- (Note: 'Using filesort' indicates expensive in-memory / temporary file sort buffer overhead)
-- ==============================================================================
EXPLAIN SELECT * FROM Employees
WHERE Department = 'HR'
ORDER BY Salary DESC;
