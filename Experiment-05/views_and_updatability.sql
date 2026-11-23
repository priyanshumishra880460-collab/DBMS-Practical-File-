-- ==============================================================================
-- DBMS Lab – Experiment 5: SQL Views, View Updatability and Recursive CTE
-- File: views_and_updatability.sql
-- Description: Create SQL Views, test view updatability rules, and inspect definitions
-- ==============================================================================

USE CompanyDB;

-- ==============================================================================
-- 1. Create Department Salary Summary View (Aggregate View)
-- ==============================================================================
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

-- Display the Department Salary Summary View
SELECT * FROM Department_Salary_Summary;


-- ==============================================================================
-- 2. Create Employee Hierarchy View (Multi-Table Join View)
-- ==============================================================================
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

-- Display the Employee Hierarchy View
SELECT *
FROM Employee_Hierarchy
ORDER BY Dept_ID, Manager_ID, Emp_ID;


-- ==============================================================================
-- 3. Test Updatability of a Simple View (Employee_Basic)
-- ==============================================================================
CREATE OR REPLACE VIEW Employee_Basic AS
SELECT Emp_ID, Emp_Name, Job_Title, Salary, Dept_ID
FROM Employee;

-- Test an update through the simple view:
UPDATE Employee_Basic
SET Salary = 86000.00
WHERE Emp_ID = 101;

-- Verify base table modification:
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 101;
-- Observation: Update succeeds because Employee_Basic is a 1:1 projection of one base table.


-- ==============================================================================
-- 4. Test Updatability of the Aggregate View (Department_Salary_Summary)
-- ==============================================================================
-- Attempting to update a grouped/aggregated column:
-- UPDATE Department_Salary_Summary
-- SET Average_Salary = 90000
-- WHERE Dept_ID = 1;
-- Expected Observation: Rejected!
-- MySQL Error: ERROR 1288 (HY000): The target table Department_Salary_Summary of the UPDATE is not updatable.


-- ==============================================================================
-- 5. Test Updatability of the Employee Hierarchy View (Multi-Table Join View)
-- ==============================================================================
-- Attempting to update a joined table attribute:
-- UPDATE Employee_Hierarchy
-- SET Manager_Name = 'Priya Verma'
-- WHERE Emp_ID = 103;
-- Expected Observation: Rejected! Manager_Name is derived from a joined table.


-- ==============================================================================
-- 6. Inspect View Definitions
-- ==============================================================================
SHOW CREATE VIEW Department_Salary_Summary;
SHOW CREATE VIEW Employee_Hierarchy;
SHOW CREATE VIEW Employee_Basic;
