-- ==============================================================================
-- DBMS Lab – Experiment 5: SQL Views, View Updatability and Recursive CTE
-- File: schema_update.sql
-- Description: Extend Employee schema for reporting hierarchy and assign managers
-- ==============================================================================

USE CompanyDB;

-- 1. Extend the Employee Schema for Reporting Hierarchy
-- Add Manager_ID column referencing Emp_ID in the same Employee table (Self-referencing Foreign Key)
ALTER TABLE Employee
ADD COLUMN Manager_ID INT NULL;

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID) ON DELETE SET NULL ON UPDATE CASCADE;

-- 2. Assign Sample Reporting Relationships across Departments

-- Artificial Intelligence (Head: Aarav Sharma - 101)
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 101;
UPDATE Employee SET Manager_ID = 101 WHERE Emp_ID IN (102, 103);
UPDATE Employee SET Manager_ID = 102 WHERE Emp_ID IN (104, 105);
UPDATE Employee SET Manager_ID = 103 WHERE Emp_ID = 106;

-- Software Development (Head: Simran Kaur - 110)
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 110;
UPDATE Employee SET Manager_ID = 110 WHERE Emp_ID IN (107, 108);
UPDATE Employee SET Manager_ID = 107 WHERE Emp_ID IN (109, 111);
UPDATE Employee SET Manager_ID = 108 WHERE Emp_ID = 112;

-- Cyber Security (Head: Yash Thakur - 115)
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 115;
UPDATE Employee SET Manager_ID = 115 WHERE Emp_ID IN (113, 114);
UPDATE Employee SET Manager_ID = 113 WHERE Emp_ID IN (117, 118);
UPDATE Employee SET Manager_ID = 114 WHERE Emp_ID = 116;

-- Data Science (Head: Akash Singh - 119)
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 119;
UPDATE Employee SET Manager_ID = 119 WHERE Emp_ID IN (120, 121);
UPDATE Employee SET Manager_ID = 120 WHERE Emp_ID IN (122, 123);
UPDATE Employee SET Manager_ID = 121 WHERE Emp_ID = 124;

-- Human Resources (Head: Manish Verma - 125)
UPDATE Employee SET Manager_ID = NULL WHERE Emp_ID = 125;
UPDATE Employee SET Manager_ID = 125 WHERE Emp_ID IN (126, 129);
UPDATE Employee SET Manager_ID = 126 WHERE Emp_ID IN (127, 128, 130);
