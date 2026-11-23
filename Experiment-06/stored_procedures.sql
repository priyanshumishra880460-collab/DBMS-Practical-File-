-- ==============================================================================
-- DBMS Lab – Experiment 6: Stored Procedures, Triggers and Audit Logging
-- File: stored_procedures.sql
-- Description: Parameterized Stored Procedure with Input Validation & Error Handling
-- ==============================================================================

USE CompanyDB;

-- Drop existing procedure if exists
DROP PROCEDURE IF EXISTS transfer_employee;

-- ==============================================================================
-- Stored Procedure: transfer_employee
-- Parameters:
--   - IN p_emp_id INT       : Target Employee ID
--   - IN p_new_dept_id INT  : Target Department ID to transfer to
-- Validation:
--   - Checks if the employee exists; raises SQLSTATE 45000 if not found.
--   - Checks if the destination department exists; raises SQLSTATE 45000 if not found.
--   - If both validations pass, updates the employee's department.
-- ==============================================================================
DELIMITER $$

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE dept_count INT DEFAULT 0;

    -- Validate employee existence
    SELECT COUNT(*) INTO emp_count
    FROM Employee
    WHERE Emp_ID = p_emp_id;

    -- Validate target department existence
    SELECT COUNT(*) INTO dept_count
    FROM Department
    WHERE Dept_ID = p_new_dept_id;

    -- Conditional error handling
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

-- ==============================================================================
-- Test Case 1: Valid Transfer
-- Transfer Employee 1 (Alex) from Department 1 (Sales) to Department 2 (Engineering)
-- ==============================================================================
CALL transfer_employee(1, 2);

-- Verification: Verify that Alex's Dept_ID is updated to 2
SELECT * FROM Employee WHERE Emp_ID = 1;

-- ==============================================================================
-- Edge Cases & Exception Testing:
-- Uncomment and test these calls individually; each intentionally raises an error.
-- ==============================================================================
-- Edge Case 2: Transfer non-existent employee (Emp_ID: 666) -> Throws 'Employee does not exist'
-- CALL transfer_employee(666, 2);

-- Edge Case 3: Transfer to non-existent department (Dept_ID: 666) -> Throws 'Department does not exist'
-- CALL transfer_employee(1, 666);
