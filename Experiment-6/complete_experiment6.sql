-- ==============================================================================
-- DBMS Lab – Experiment 6: Stored Procedures, Triggers and Audit Logging
-- File: complete_experiment6.sql
-- Description: Unified Executable Script for Experiment 6 (All-In-One Execution)
-- ==============================================================================

-- ==============================================================================
-- PART 1: SCHEMA INITIALIZATION & DATA SEEDING
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- Drop existing tables to ensure clean re-run
DROP TABLE IF EXISTS Salary_Audit;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Create Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL
);

-- Create Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Populate Initial Department Records
INSERT INTO Department (Dept_ID, Dept_Name) VALUES
(1, 'Sales'),
(2, 'Engineering');

-- Populate Initial Employee Record
INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID) VALUES
(1, 'Alex', 60000.00, 1);

-- Create Salary Audit Table
CREATE TABLE Salary_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Emp_ID INT,
    Old_Salary DECIMAL(10, 2),
    New_Salary DECIMAL(10, 2),
    Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ==============================================================================
-- PART 2: STORED PROCEDURE WITH VALIDATION & ERROR HANDLING
-- ==============================================================================
DROP PROCEDURE IF EXISTS transfer_employee;

DELIMITER $$

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE dept_count INT DEFAULT 0;

    -- Check if employee exists
    SELECT COUNT(*) INTO emp_count
    FROM Employee
    WHERE Emp_ID = p_emp_id;

    -- Check if department exists
    SELECT COUNT(*) INTO dept_count
    FROM Department
    WHERE Dept_ID = p_new_dept_id;

    -- Validate existence and signal user-friendly errors
    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee does not exist';
    ELSEIF dept_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist';
    ELSE
        UPDATE Employee
        SET Dept_ID = p_new_dept_id
        WHERE Emp_ID = p_emp_id;
    END IF;
END$$

DELIMITER ;

-- Execute valid transfer: Transfer Alex (Emp_ID 1) to Engineering (Dept_ID 2)
CALL transfer_employee(1, 2);

-- Verify department change
SELECT * FROM Employee WHERE Emp_ID = 1;

-- Edge cases (uncomment individually to verify error signalling):
-- CALL transfer_employee(666, 2);  -- Error: Employee does not exist
-- CALL transfer_employee(1, 666);  -- Error: Department does not exist


-- ==============================================================================
-- PART 3: TRIGGERS (VALIDATION & AUDIT LOGGING)
-- ==============================================================================
DROP TRIGGER IF EXISTS before_employee_salary_update;
DROP TRIGGER IF EXISTS after_employee_salary_update;

-- Trigger 1: Validation Trigger (BEFORE UPDATE) - Rejects negative salary
DELIMITER $$

CREATE TRIGGER before_employee_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

-- Test validation trigger (uncomment to test negative salary rejection):
-- UPDATE Employee SET Salary = -5000 WHERE Emp_ID = 1;


-- Trigger 2: Audit Logging Trigger (AFTER UPDATE) - Logs salary modifications
DELIMITER $$

CREATE TRIGGER after_employee_salary_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO Salary_Audit (Emp_ID, Old_Salary, New_Salary)
        VALUES (OLD.Emp_ID, OLD.Salary, NEW.Salary);
    END IF;
END$$

DELIMITER ;


-- ==============================================================================
-- PART 4: TESTING SALARY UPDATE & AUDIT VERIFICATION
-- ==============================================================================
-- Perform valid salary revision
UPDATE Employee SET Salary = 65000 WHERE Emp_ID = 1;

-- Verification 1: Verify Audit Log captures old and new salary
SELECT * FROM Salary_Audit;

-- Verification 2: Verify Employee record reflects new salary
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 1;
