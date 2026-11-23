-- ==============================================================================
-- DBMS Lab – Experiment 10: Query Optimization, Indexing & Query Rewriting
-- File: 01_dataset_generation_10k.sql
-- Description: Create Employees table and generate 10,000 synthetic records via procedure
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS EnterpriseDB;
USE EnterpriseDB;

-- Drop previous artifacts if re-executing
DROP PROCEDURE IF EXISTS GenerateEmployees;
DROP TABLE IF EXISTS Employees;

-- 1. Create Employees Table
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10, 2),
    Joining_Date DATE
);

-- 2. Stored Procedure for Generating 10,000 Realistic Employee Records
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

-- 3. Execute Procedure
CALL GenerateEmployees();

-- 4. Verify Total Row Count
SELECT COUNT(*) AS Total_Records FROM Employees;

-- Display sample records from original table
SELECT * FROM Employees LIMIT 10;
