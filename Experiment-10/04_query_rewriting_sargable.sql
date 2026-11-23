-- ==============================================================================
-- DBMS Lab – Experiment 10: Query Optimization, Indexing & Query Rewriting
-- File: 04_query_rewriting_sargable.sql
-- Description: Query Rewriting: Transforming Non-SARGable functions to SARGable range predicates
-- ==============================================================================

USE EnterpriseDB;

-- ------------------------------------------------------------------------------
-- 1. Create Index on Date Column
-- ------------------------------------------------------------------------------
DROP INDEX IF EXISTS idx_joining_date ON Employees;

CREATE INDEX idx_joining_date ON Employees(Joining_Date);

-- ------------------------------------------------------------------------------
-- 2. Non-SARGable Query (Before Optimization)
-- Problem: Wrapping indexed column in function YEAR(Joining_Date) forces MySQL to
-- evaluate YEAR() on every row, disabling index range scan and causing full table scan!
-- ------------------------------------------------------------------------------
EXPLAIN SELECT * FROM Employees
WHERE YEAR(Joining_Date) = 2022;

SELECT * FROM Employees
WHERE YEAR(Joining_Date) = 2022
LIMIT 10;

-- ------------------------------------------------------------------------------
-- 3. SARGable Query (After Optimization / Query Rewriting)
-- Solution: Rewritten as an equivalent Half-Open Date Range on the raw column.
-- Enables the MySQL Optimizer to perform an efficient B-Tree Index Range Scan!
-- ------------------------------------------------------------------------------
EXPLAIN SELECT * FROM Employees
WHERE Joining_Date >= '2022-01-01'
AND Joining_Date < '2023-01-01';

SELECT * FROM Employees
WHERE Joining_Date >= '2022-01-01'
AND Joining_Date < '2023-01-01'
LIMIT 10;
