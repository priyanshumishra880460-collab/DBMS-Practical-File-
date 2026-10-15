-- ==============================================================================
-- DBMS Lab – Experiment 4: Advanced SQL Queries and Execution Plans
-- File: complete_experiment4.sql
-- Description: Unified Executable Script for Experiment 4 (Advanced Queries + EXPLAIN)
-- ==============================================================================

USE CompanyDB;

-- ==============================================================================
-- PART 1: ADVANCED SQL QUERIES
-- ==============================================================================

-- 1. INNER JOIN: Display employees along with their departments
SELECT e.Emp_ID,
       e.Emp_Name,
       e.Job_Title,
       d.Dept_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID;

-- 2. LEFT JOIN: Display all departments and their employees
SELECT d.Dept_ID,
       d.Dept_Name,
       e.Emp_Name
FROM Department d
LEFT JOIN Employee e
ON d.Dept_ID = e.Dept_ID;

-- 3. SELF JOIN: Pairs of employees in the same department
SELECT e1.Emp_Name AS Employee_1,
       e2.Emp_Name AS Employee_2,
       e1.Dept_ID
FROM Employee e1
INNER JOIN Employee e2
ON e1.Dept_ID = e2.Dept_ID
AND e1.Emp_ID < e2.Emp_ID;

-- 4. Multi-Table / 4-Way Join: Employee, Department, Project through Employee_Project
SELECT e.Emp_Name,
       d.Dept_Name,
       p.Project_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID
INNER JOIN Employee_Project ep
ON e.Emp_ID = ep.Emp_ID
INNER JOIN Project p
ON ep.Project_ID = p.Project_ID;

-- 5. Correlated Subquery: Employees earning more than their department's average
SELECT e.Emp_ID,
       e.Emp_Name,
       e.Salary,
       e.Dept_ID
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- 6. EXISTS: Departments having at least one employee earning > 100,000
SELECT d.Dept_ID,
       d.Dept_Name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.Dept_ID = d.Dept_ID
    AND e.Salary > 100000
);

-- 7. Simulated INTERSECT: Employees earning > 80k AND in Dept 1 or 4
SELECT a.Emp_ID,
       a.Emp_Name
FROM
(
    SELECT Emp_ID, Emp_Name
    FROM Employee
    WHERE Salary > 80000
) a
INNER JOIN
(
    SELECT Emp_ID, Emp_Name
    FROM Employee
    WHERE Dept_ID IN (1, 4)
) b
ON a.Emp_ID = b.Emp_ID;

-- 8. Simulated EXCEPT: Employees earning > 80k EXCEPT Cyber Security (Dept 3)
SELECT e.Emp_ID,
       e.Emp_Name
FROM Employee e
WHERE e.Salary > 80000
AND NOT EXISTS (
    SELECT 1
    FROM Employee e2
    WHERE e2.Emp_ID = e.Emp_ID
    AND e2.Dept_ID = 3
);

-- ==============================================================================
-- PART 2: QUERY EXECUTION PLANS (EXPLAIN)
-- ==============================================================================

-- Query 1: EXPLAIN for simple selection
EXPLAIN
SELECT *
FROM Employee
WHERE Salary > 90000;

-- Query 2: EXPLAIN for INNER JOIN
EXPLAIN
SELECT e.Emp_Name,
       d.Dept_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID;

-- Query 3: EXPLAIN for Correlated Subquery
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

-- Query 4: EXPLAIN for EXISTS
EXPLAIN
SELECT d.Dept_Name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.Dept_ID = d.Dept_ID
    AND e.Salary > 100000
);
