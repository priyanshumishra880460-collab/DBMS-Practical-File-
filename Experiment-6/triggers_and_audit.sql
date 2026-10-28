-- ==============================================================================
-- DBMS Lab – Experiment 6: Stored Procedures, Triggers and Audit Logging
-- File: triggers_and_audit.sql
-- Description: Business Rule Enforcement (BEFORE Trigger) & Audit Trail (AFTER Trigger)
-- ==============================================================================

USE CompanyDB;

-- Drop existing triggers if re-executing
DROP TRIGGER IF EXISTS before_employee_salary_update;
DROP TRIGGER IF EXISTS after_employee_salary_update;

-- ==============================================================================
-- Trigger 1: Validation Trigger (BEFORE UPDATE)
-- Enforces data integrity by preventing negative salary assignments.
-- If NEW.Salary < 0, execution is halted with SQLSTATE '45000'.
-- ==============================================================================
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

-- ==============================================================================
-- Edge Case: Negative Salary Test
-- This statement intentionally raises an error to prove constraint enforcement.
-- Uncomment to test the validation trigger.
-- ==============================================================================
-- UPDATE Employee SET Salary = -5000 WHERE Emp_ID = 1;


-- ==============================================================================
-- Trigger 2: Audit Logging Trigger (AFTER UPDATE)
-- Automatically captures history whenever an employee's salary changes.
-- Records Emp_ID, Old_Salary, New_Salary, and Changed_At timestamp.
-- ==============================================================================
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
-- Test Case: Update Salary
-- Update Alex's salary from ₹60,000 to ₹65,000
-- ==============================================================================
UPDATE Employee SET Salary = 65000 WHERE Emp_ID = 1;

-- ==============================================================================
-- Verification
-- ==============================================================================
-- 1. Inspect audit log to confirm automated entry
SELECT * FROM Salary_Audit;

-- 2. Inspect employee table to confirm updated salary
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 1;
