-- ==============================================================================
-- DBMS Lab – Experiment 5: SQL Views, View Updatability and Recursive CTE
-- File: complete_experiment5.sql
-- Description: Unified Executable Script for Experiment 5 (Schema + Views + CTEs)
-- ==============================================================================

USE CompanyDB;

-- ------------------------------------------------------------------------------
-- PART 1: EXTEND SCHEMA FOR REPORTING HIERARCHY
-- ------------------------------------------------------------------------------

-- Safely add Manager_ID column if it doesn't already exist
SET @col_exists = 0;
SELECT COUNT(*) INTO @col_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'CompanyDB'
  AND TABLE_NAME = 'Employee'
  AND COLUMN_NAME = 'Manager_ID';

SET @stmt = IF(@col_exists = 0,
    'ALTER TABLE Employee ADD COLUMN Manager_ID INT NULL, ADD CONSTRAINT fk_employee_manager FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID)',
    'SELECT "Manager_ID column already exists"'
);
PREPARE exec_sql FROM @stmt;
EXECUTE exec_sql;
DEALLOCATE PREPARE exec_sql;

-- Assign Reporting Relationships:
-- Artificial Intelligence
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 101;
UPDATE Employee SET Manager_ID = 101 WHERE Emp_ID IN (102, 103);
UPDATE Employee SET Manager_ID = 102 WHERE Emp_ID IN (104, 105);
UPDATE Employee SET Manager_ID = 103 WHERE Emp_ID = 106;

-- Software Development
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 110;
UPDATE Employee SET Manager_ID = 110 WHERE Emp_ID IN (107, 108);
UPDATE Employee SET Manager_ID = 107 WHERE Emp_ID IN (109, 111);
UPDATE Employee SET Manager_ID = 108 WHERE Emp_ID = 112;

-- Cyber Security
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 115;
UPDATE Employee SET Manager_ID = 115 WHERE Emp_ID IN (113, 114);
UPDATE Employee SET Manager_ID = 113 WHERE Emp_ID IN (117, 118);
UPDATE Employee SET Manager_ID = 114 WHERE Emp_ID = 116;

-- Data Science
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 119;
UPDATE Employee SET Manager_ID = 119 WHERE Emp_ID IN (120, 121);
UPDATE Employee SET Manager_ID = 120 WHERE Emp_ID IN (122, 123);
UPDATE Employee SET Manager_ID = 121 WHERE Emp_ID = 124;

-- Human Resources
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 125;
UPDATE Employee SET Manager_ID = 125 WHERE Emp_ID IN (126, 129);
UPDATE Employee SET Manager_ID = 126 WHERE Emp_ID IN (127, 128, 130);

-- ------------------------------------------------------------------------------
-- PART 2: CREATE VIEWS
-- ------------------------------------------------------------------------------

-- Department Salary Summary View
CREATE OR REPLACE VIEW Department_Salary_Summary AS
SELECT d.Dept_ID,
       d.Dept_Name,
       COUNT(e.Emp_ID) AS Employee_Count,
       SUM(e.Salary) AS Total_Salary,
       AVG(e.Salary) AS Average_Salary,
       MIN(e.Salary) AS Minimum_Salary,
       MAX(e.Salary) AS Maximum_Salary
FROM Department d
LEFT JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

SELECT * FROM Department_Salary_Summary;

-- Employee Hierarchy View
CREATE OR REPLACE VIEW Employee_Hierarchy AS
SELECT e.Emp_ID,
       e.Emp_Name AS Employee_Name,
       e.Job_Title,
       e.Dept_ID,
       d.Dept_Name,
       e.Manager_ID,
       m.Emp_Name AS Manager_Name
FROM Employee e
LEFT JOIN Department d ON e.Dept_ID = d.Dept_ID
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

SELECT *
FROM Employee_Hierarchy
ORDER BY Dept_ID, Manager_ID, Emp_ID;

-- ------------------------------------------------------------------------------
-- PART 3: TEST VIEW UPDATABILITY
-- ------------------------------------------------------------------------------

-- Simple View: Employee_Basic
CREATE OR REPLACE VIEW Employee_Basic AS
SELECT Emp_ID, Emp_Name, Job_Title, Salary, Dept_ID
FROM Employee;

UPDATE Employee_Basic
SET Salary = 86000.00
WHERE Emp_ID = 101;

SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 101;

-- ------------------------------------------------------------------------------
-- PART 4: RECURSIVE COMMON TABLE EXPRESSIONS (CTE)
-- ------------------------------------------------------------------------------

-- 1. Full Reporting Chains
WITH RECURSIVE EmployeeChain AS (
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, 0 AS Level,
           CAST(e.Emp_Name AS CHAR(1000)) AS Reporting_Chain
    FROM Employee e
    WHERE e.Manager_ID IS NULL
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, ec.Level + 1,
           CONCAT(ec.Reporting_Chain, ' -> ', e.Emp_Name)
    FROM Employee e
    INNER JOIN EmployeeChain ec ON e.Manager_ID = ec.Emp_ID
)
SELECT Emp_ID, Emp_Name, Manager_ID, Level, Reporting_Chain
FROM EmployeeChain
ORDER BY Reporting_Chain;

-- 2. Single Reporting Tree for Emp_ID = 101
WITH RECURSIVE ReportingTree AS (
    SELECT Emp_ID, Emp_Name, Manager_ID, 0 AS Level
    FROM Employee WHERE Emp_ID = 101
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, rt.Level + 1
    FROM Employee e
    INNER JOIN ReportingTree rt ON e.Manager_ID = rt.Emp_ID
)
SELECT Emp_ID, Emp_Name, Manager_ID, Level
FROM ReportingTree
ORDER BY Level, Emp_ID;

-- 3. Visual Indentation Tree
WITH RECURSIVE EmployeeTree AS (
    SELECT Emp_ID, Emp_Name, Manager_ID, 0 AS Level
    FROM Employee WHERE Manager_ID IS NULL
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, et.Level + 1
    FROM Employee e
    INNER JOIN EmployeeTree et ON e.Manager_ID = et.Emp_ID
)
SELECT Emp_ID,
       CONCAT(REPEAT('    ', Level), Emp_Name) AS Employee_Hierarchy,
       Level
FROM EmployeeTree
ORDER BY Level, Emp_ID;

-- 4. Direct Manager Mapping
SELECT e.Emp_Name AS Employee,
       m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID
ORDER BY e.Emp_ID;
