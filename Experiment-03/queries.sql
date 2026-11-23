-- ==============================================================================
-- DBMS Lab – Experiment 3: Employee–Department–Project Schema
-- File: queries.sql
-- Description: 18 SQL Queries categorized into Selection, Projection,
--              Aggregate Functions, GROUP BY, HAVING, CASE Expressions, ORDER BY
-- ==============================================================================

USE CompanyDB;

-- ==============================================================================
-- Section A: Selection
-- Selection retrieves rows that satisfy a specified condition.
-- ==============================================================================

-- Query 1: Retrieve all employees earning more than ₹90,000
SELECT *
FROM Employee
WHERE Salary > 90000;

-- Query 2: Retrieve all employees belonging to Department 1 (Artificial Intelligence)
SELECT *
FROM Employee
WHERE Dept_ID = 1;


-- ==============================================================================
-- Section B: Projection
-- Projection retrieves selected columns from a table.
-- ==============================================================================

-- Query 3: Display employee names and their salaries
SELECT Emp_Name, Salary
FROM Employee;

-- Query 4: Display employee names and their job titles
SELECT Emp_Name, Job_Title
FROM Employee;


-- ==============================================================================
-- Section C: Aggregate Functions
-- Aggregate functions perform calculations over multiple rows.
-- ==============================================================================

-- Query 5: Calculate the average salary of employees
SELECT AVG(Salary) AS Average_Salary
FROM Employee;

-- Query 6: Find the highest salary among employees
SELECT MAX(Salary) AS Highest_Salary
FROM Employee;

-- Query 7: Find the lowest salary among employees
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;

-- Query 8: Calculate total salary expenditure
SELECT SUM(Salary) AS Total_Salary
FROM Employee;

-- Query 9: Count the total number of employees
SELECT COUNT(*) AS Total_Employees
FROM Employee;


-- ==============================================================================
-- Section D: GROUP BY
-- GROUP BY groups rows having the same value in specified columns.
-- ==============================================================================

-- Query 10: Count the number of employees in each department
SELECT d.Dept_Name, COUNT(e.Emp_ID) AS Employee_Count
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- Query 11: Calculate the average salary of each department
SELECT d.Dept_Name, AVG(e.Salary) AS Average_Salary
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;


-- ==============================================================================
-- Section E: HAVING
-- HAVING filters groups after GROUP BY has been applied.
-- ==============================================================================

-- Query 12: Find departments having more than 5 employees
SELECT Dept_ID, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_ID
HAVING COUNT(*) > 5;

-- Query 13: Find departments with an average salary above ₹80,000
SELECT d.Dept_Name, AVG(e.Salary) AS Average_Salary
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING AVG(e.Salary) > 80000;


-- ==============================================================================
-- Section F: CASE Expression
-- CASE provides conditional logic within a SQL expression.
-- ==============================================================================

-- Query 14: Categorize employees by salary level (High, Medium, Low)
SELECT Emp_Name,
       Salary,
       CASE
           WHEN Salary >= 90000 THEN 'High Salary'
           WHEN Salary >= 70000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS Salary_Category
FROM Employee;

-- Query 15: Categorize and map employees to department names using CASE
SELECT Emp_Name,
       Dept_ID,
       CASE
           WHEN Dept_ID = 1 THEN 'AI'
           WHEN Dept_ID = 2 THEN 'Software'
           WHEN Dept_ID = 3 THEN 'Cyber Security'
           WHEN Dept_ID = 4 THEN 'Data Science'
           WHEN Dept_ID = 5 THEN 'HR'
           ELSE 'Other'
       END AS Department_Name
FROM Employee;


-- ==============================================================================
-- Section G: ORDER BY
-- ORDER BY sorts the result set in ascending or descending order.
-- ==============================================================================

-- Query 16: Retrieve employee name and salary ordered by salary in ascending order
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary ASC;

-- Query 17: Retrieve employee name and salary ordered by salary in descending order
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;

-- Query 18: Retrieve employee records ordered by department (ascending) and salary (descending)
SELECT Emp_Name, Dept_ID, Salary
FROM Employee
ORDER BY Dept_ID ASC, Salary DESC;
