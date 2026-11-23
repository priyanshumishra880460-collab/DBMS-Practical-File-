-- ==============================================================================
-- DBMS Lab – Experiment 10: Query Optimization, Indexing & Query Rewriting
-- File: complete_experiment10.sql
-- Description: Unified Executable Script for Experiment 10 (10K Rows, 5 Slow Queries, Indexes & SARGable Rewriting)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. DATABASE & TABLE SETUP
-- ------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS EnterpriseDB;
USE EnterpriseDB;

DROP PROCEDURE IF EXISTS GenerateEmployees;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10, 2),
    Joining_Date DATE
);

-- ------------------------------------------------------------------------------
-- 2. GENERATE 10,000 EMPLOYEE RECORDS
-- ------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE GenerateEmployees()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO Employees VALUES (
            i,
            CONCAT('Employee_', i),
            ELT((i % 5) + 1, 'IT', 'HR', 'Sales', 'Finance', 'Marketing'),
            ELT((i % 4) + 1, 'Delhi', 'Mumbai', 'Lucknow', 'Pune'),
            20000 + (i % 50000),
            DATE_ADD('2020-01-01', INTERVAL (i % 2000) DAY)
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL GenerateEmployees();

-- Display sample records
SELECT * FROM Employees LIMIT 10;

-- ------------------------------------------------------------------------------
-- 3. FIVE SLOW QUERIES (BEFORE OPTIMIZATION - UNINDEXED)
-- ------------------------------------------------------------------------------
-- Query 1: Search by Department
EXPLAIN SELECT * FROM Employees WHERE Department = 'IT';

-- Query 2: Search by City
EXPLAIN SELECT * FROM Employees WHERE City = 'Delhi';

-- Query 3: Salary Filtering
EXPLAIN SELECT * FROM Employees WHERE Salary > 50000;

-- Query 4: Multiple Conditions
EXPLAIN SELECT * FROM Employees WHERE Department = 'Sales' AND City = 'Mumbai';

-- Query 5: Sorting and Filtering (Filesort)
EXPLAIN SELECT * FROM Employees WHERE Department = 'HR' ORDER BY Salary DESC;

-- ------------------------------------------------------------------------------
-- 4. OPTIMIZATION USING INDEXING
-- ------------------------------------------------------------------------------
CREATE INDEX idx_department ON Employees(Department);
CREATE INDEX idx_city ON Employees(City);
CREATE INDEX idx_salary ON Employees(Salary);
CREATE INDEX idx_dept_city ON Employees(Department, City);
CREATE INDEX idx_dept_salary ON Employees(Department, Salary);

-- ------------------------------------------------------------------------------
-- 5. FIVE OPTIMIZED QUERIES (AFTER INDEXING)
-- ------------------------------------------------------------------------------
-- Optimized Query 1: Department Index Lookup
EXPLAIN SELECT * FROM Employees WHERE Department = 'IT';

-- Optimized Query 2: City Index Lookup
EXPLAIN SELECT * FROM Employees WHERE City = 'Delhi';

-- Optimized Query 3: Salary Range Scan
EXPLAIN SELECT * FROM Employees WHERE Salary > 50000;

-- Optimized Query 4: Composite Dept+City Lookup
EXPLAIN SELECT * FROM Employees WHERE Department = 'Sales' AND City = 'Mumbai';

-- Optimized Query 5: Composite Dept+Salary (Filesort Eliminated)
EXPLAIN SELECT * FROM Employees WHERE Department = 'HR' ORDER BY Salary DESC;

-- ------------------------------------------------------------------------------
-- 6. QUERY REWRITING (NON-SARGABLE VS SARGABLE)
-- ------------------------------------------------------------------------------
CREATE INDEX idx_joining_date ON Employees(Joining_Date);

-- Before Optimization (Non-SARGable: Function on column causes Full Scan)
EXPLAIN SELECT * FROM Employees WHERE YEAR(Joining_Date) = 2022;

-- After Optimization (SARGable: Half-open date range enables Index Range Scan)
EXPLAIN SELECT * FROM Employees
WHERE Joining_Date >= '2022-01-01' AND Joining_Date < '2023-01-01';

-- ------------------------------------------------------------------------------
-- 7. CHECK FINAL DATASET & SAMPLES
-- ------------------------------------------------------------------------------
SELECT COUNT(*) AS Total_Records FROM Employees;
SELECT * FROM Employees LIMIT 10;
