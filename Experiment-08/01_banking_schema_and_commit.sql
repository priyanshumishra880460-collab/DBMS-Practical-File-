-- ==============================================================================
-- DBMS Lab – Experiment 8: Banking Transactions, Savepoints & Concurrency Control
-- File: 01_banking_schema_and_commit.sql
-- Description: Create Accounts table, insert initial records, and execute BEGIN & COMMIT
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

-- Drop previous table if re-executing
DROP TABLE IF EXISTS Accounts;

-- 1. Create Banking Accounts Table
CREATE TABLE Accounts (
    Account_ID INT PRIMARY KEY,
    Holder_Name VARCHAR(50) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

-- 2. Insert Initial Account Records
INSERT INTO Accounts (Account_ID, Holder_Name, Balance) VALUES
(101, 'Amit', 10000.00),
(102, 'Rahul', 8000.00);

-- Display Initial State
SELECT * FROM Accounts;

-- 3. Transaction Execution: BEGIN (START TRANSACTION) and COMMIT
-- Simulates atomic fund transfer of Rs 2000 from Amit (101) to Rahul (102)
START TRANSACTION;

-- Debit from Amit
UPDATE Accounts
SET Balance = Balance - 2000
WHERE Account_ID = 101;

-- Credit to Rahul
UPDATE Accounts
SET Balance = Balance + 2000
WHERE Account_ID = 102;

-- Permanently persist changes
COMMIT;

-- Verify updated balances post-commit
SELECT * FROM Accounts;
