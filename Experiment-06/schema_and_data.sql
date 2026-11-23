-- ==============================================================================
-- DBMS Lab – Experiment 6: Stored Procedures, Triggers and Audit Logging
-- File: schema_and_data.sql
-- Description: Table schema, relational integrity constraints, and initial records
-- ==============================================================================

-- 1. Create / Switch to Database
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- 2. Drop existing tables in reverse dependency order to avoid conflicts
DROP TABLE IF EXISTS Salary_Audit;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- 3. Create Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL
);

-- 4. Create Employee Table with Foreign Key
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- 5. Create Salary Audit Table for Tracking Salary Revisions
CREATE TABLE Salary_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_ID INT,
    Old_Salary DECIMAL(10, 2),
    New_Salary DECIMAL(10, 2),
    Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Insert Initial Department Records
INSERT INTO Department (Dept_ID, Dept_Name) VALUES
(1, 'Sales'),
(2, 'Engineering');

-- 7. Insert Initial Employee Record
INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID) VALUES
(1, 'Alex', 60000.00, 1);

-- 8. Verify Initial State
SELECT * FROM Department;
SELECT * FROM Employee;
