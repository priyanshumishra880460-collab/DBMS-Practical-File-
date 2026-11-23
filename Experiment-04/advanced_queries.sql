-- ==============================================================================
-- DBMS Lab – Experiment 4: Advanced SQL Queries and Execution Plans
-- File: advanced_queries.sql
-- Description: Advanced Joins, Correlated Subqueries, EXISTS, and Set Operations
-- ==============================================================================

USE CompanyDB;

-- ==============================================================================
-- 1. INNER JOIN
-- Display employees along with the departments to which they belong.
-- Returns only those employees for whom a matching department exists.
-- ==============================================================================
SELECT e.Emp_ID,
       e.Emp_Name,
       e.Job_Title,
       d.Dept_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID;


-- ==============================================================================
-- 2. LEFT JOIN
-- Display all departments and their employees, including departments with no matching employee.
-- Preserves every row from the left table, Department.
-- ==============================================================================
SELECT d.Dept_ID,
       d.Dept_Name,
       e.Emp_Name
FROM Department d
LEFT JOIN Employee e
ON d.Dept_ID = e.Dept_ID;


-- ==============================================================================
-- 3. SELF JOIN
-- Find pairs of employees who work in the same department.
-- The condition e1.Emp_ID < e2.Emp_ID prevents duplicate pairs and self-pairing.
-- ==============================================================================
SELECT e1.Emp_Name AS Employee_1,
       e2.Emp_Name AS Employee_2,
       e1.Dept_ID
FROM Employee e1
INNER JOIN Employee e2
ON e1.Dept_ID = e2.Dept_ID
AND e1.Emp_ID < e2.Emp_ID;


-- ==============================================================================
-- 4. Multi-Table / 4-Way Join
-- Display employee name, department name, and project name.
-- Navigates Employee -> Department and Employee -> Employee_Project -> Project.
-- ==============================================================================
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


-- ==============================================================================
-- 5. Correlated Subquery
-- Find employees whose salary is greater than the average salary of their own department.
-- The inner query refers to e.Dept_ID from the outer query.
-- ==============================================================================
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


-- ==============================================================================
-- 6. EXISTS
-- Find departments that have at least one employee earning more than ₹100,000.
-- Evaluates to TRUE when the subquery returns at least one matching row.
-- ==============================================================================
SELECT d.Dept_ID,
       d.Dept_Name
FROM Department d
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.Dept_ID = d.Dept_ID
    AND e.Salary > 100000
);


-- ==============================================================================
-- 7. Simulated INTERSECT
-- Find employees who earn more than ₹80,000 AND belong to either AI (1) or Data Science (4).
-- Simulates INTERSECT of two result sets using INNER JOIN.
-- ==============================================================================
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


-- ==============================================================================
-- 8. Simulated EXCEPT
-- Find employees who earn more than ₹80,000 but are NOT in the Cyber Security (3) department.
-- NOT EXISTS removes matching rows, simulating an EXCEPT (MINUS) operation.
-- ==============================================================================
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
