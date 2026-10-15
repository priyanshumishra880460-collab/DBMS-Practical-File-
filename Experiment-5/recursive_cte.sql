-- ==============================================================================
-- DBMS Lab – Experiment 5: SQL Views, View Updatability and Recursive CTE
-- File: recursive_cte.sql
-- Description: Recursive Common Table Expressions (CTE) for Hierarchical Traversal
-- ==============================================================================

USE CompanyDB;

-- ==============================================================================
-- 1. Recursive CTE to Display Full Reporting Chains
-- The anchor member selects top-level employees (Manager_ID IS NULL).
-- The recursive member repeatedly finds employees reporting to previous level.
-- ==============================================================================
WITH RECURSIVE EmployeeChain AS (
    -- Anchor Member: Root managers / Department heads
    SELECT
        e.Emp_ID,
        e.Emp_Name,
        e.Manager_ID,
        0 AS Level,
        CAST(e.Emp_Name AS CHAR(1000)) AS Reporting_Chain
    FROM Employee e
    WHERE e.Manager_ID IS NULL

    UNION ALL

    -- Recursive Member: Subordinates at subsequent hierarchy levels
    SELECT
        e.Emp_ID,
        e.Emp_Name,
        e.Manager_ID,
        ec.Level + 1,
        CONCAT(ec.Reporting_Chain, ' -> ', e.Emp_Name)
    FROM Employee e
    INNER JOIN EmployeeChain ec
    ON e.Manager_ID = ec.Emp_ID
)
SELECT Emp_ID,
       Emp_Name,
       Manager_ID,
       Level,
       Reporting_Chain
FROM EmployeeChain
ORDER BY Reporting_Chain;


-- ==============================================================================
-- 2. Recursive CTE for a Single Reporting Tree (Rooted at Emp_ID = 101)
-- Traces hierarchy subtree specifically starting from Aarav Sharma (101)
-- ==============================================================================
WITH RECURSIVE ReportingTree AS (
    -- Anchor Member
    SELECT Emp_ID,
           Emp_Name,
           Manager_ID,
           0 AS Level
    FROM Employee
    WHERE Emp_ID = 101

    UNION ALL

    -- Recursive Member
    SELECT e.Emp_ID,
           e.Emp_Name,
           e.Manager_ID,
           rt.Level + 1
    FROM Employee e
    INNER JOIN ReportingTree rt
    ON e.Manager_ID = rt.Emp_ID
)
SELECT Emp_ID,
       Emp_Name,
       Manager_ID,
       Level
FROM ReportingTree
ORDER BY Level, Emp_ID;


-- ==============================================================================
-- 3. Recursive CTE with Visual Hierarchy Indentation
-- Uses REPEAT(' ', Level) to format an organization tree structure visually
-- ==============================================================================
WITH RECURSIVE EmployeeTree AS (
    -- Anchor Member
    SELECT Emp_ID,
           Emp_Name,
           Manager_ID,
           0 AS Level
    FROM Employee
    WHERE Manager_ID IS NULL

    UNION ALL

    -- Recursive Member
    SELECT e.Emp_ID,
           e.Emp_Name,
           e.Manager_ID,
           et.Level + 1
    FROM Employee e
    INNER JOIN EmployeeTree et
    ON e.Manager_ID = et.Emp_ID
)
SELECT Emp_ID,
       CONCAT(REPEAT('    ', Level), Emp_Name) AS Employee_Hierarchy,
       Level
FROM EmployeeTree
ORDER BY Level, Emp_ID;


-- ==============================================================================
-- 4. Verify Reporting Relationships (Direct Manager-Employee Mapping)
-- ==============================================================================
SELECT e.Emp_Name AS Employee,
       m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID
ORDER BY e.Emp_ID;
