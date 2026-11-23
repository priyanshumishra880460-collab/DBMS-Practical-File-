-- ==============================================================================
-- DBMS Lab – Experiment 10: Query Optimization, Indexing & Query Rewriting
-- File: 03_indexing_and_optimized_explain.sql
-- Description: Create single-column & composite indexes and benchmark optimized execution plans
-- ==============================================================================

USE EnterpriseDB;

-- ==============================================================================
-- PART 1: OPTIMIZATION USING INDEXING
-- ==============================================================================

-- Drop previous indexes if re-executing
DROP INDEX IF EXISTS idx_department ON Employees;
DROP INDEX IF EXISTS idx_city ON Employees;
DROP INDEX IF EXISTS idx_salary ON Employees;
DROP INDEX IF EXISTS idx_dept_city ON Employees;
DROP INDEX IF EXISTS idx_dept_salary ON Employees;

-- 1. Single Column Indexes
CREATE INDEX idx_department ON Employees(Department);
CREATE INDEX idx_city ON Employees(City);
CREATE INDEX idx_salary ON Employees(Salary);

-- 2. Composite Indexes
-- Optimized for simultaneous Department & City filtering
CREATE INDEX idx_dept_city ON Employees(Department, City);

-- Optimized for Department filtering + Salary ordering (Eliminates filesort!)
CREATE INDEX idx_dept_salary ON Employees(Department, Salary);

-- Inspect all created indexes
SHOW INDEX FROM Employees;


-- ==============================================================================
-- PART 2: OPTIMIZED QUERY EXECUTION PLANS (EXPLAIN)
-- ==============================================================================

-- Optimized Query 1: Search by Department
-- Expected: type = ref, key = idx_department, rows = ~2000 (Reduced from 10000)
EXPLAIN SELECT * FROM Employees
WHERE Department = 'IT';

-- Optimized Query 2: Search by City
-- Expected: type = ref, key = idx_city, rows = ~2500 (Reduced from 10000)
EXPLAIN SELECT * FROM Employees
WHERE City = 'Delhi';

-- Optimized Query 3: Salary Filtering (Range Query)
-- Expected: type = range, key = idx_salary, key_len = 6, Extra = Using index condition
EXPLAIN SELECT * FROM Employees
WHERE Salary > 50000;

-- Optimized Query 4: Multiple Conditions
-- Expected: type = ref, key = idx_dept_city, key_len = 246, ref = const,const, rows = ~500
EXPLAIN SELECT * FROM Employees
WHERE Department = 'Sales'
AND City = 'Mumbai';

-- Optimized Query 5: Sorting and Filtering
-- Expected: type = ref, key = idx_dept_salary, ref = const, filesort eliminated!
EXPLAIN SELECT * FROM Employees
WHERE Department = 'HR'
ORDER BY Salary DESC;
