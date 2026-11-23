-- ==============================================================================
-- DBMS Lab – Experiment 8: Banking Transactions, Savepoints & Concurrency Control
-- File: 02_rollback_and_savepoint.sql
-- Description: Demonstrate full ROLLBACK and partial rollback using SAVEPOINT
-- ==============================================================================

USE BankingDB;

-- ==============================================================================
-- 1. Full Transaction ROLLBACK
-- Simulates an aborted transaction where debited funds must be discarded
-- ==============================================================================
START TRANSACTION;

-- Attempt deduction of Rs 5000 from Amit
UPDATE Accounts
SET Balance = Balance - 5000
WHERE Account_ID = 101;

-- Abort transaction: changes are reverted completely
ROLLBACK;

-- Verify that Amit's balance remains 8000.00
SELECT * FROM Accounts;


-- ==============================================================================
-- 2. Partial Rollback using SAVEPOINT
-- Allows rolling back work done after a checkpoint while preserving prior updates
-- ==============================================================================
START TRANSACTION;

-- Step A: Valid deduction of Rs 1000 from Amit
UPDATE Accounts
SET Balance = Balance - 1000
WHERE Account_ID = 101;

-- Set a savepoint checkpoint
SAVEPOINT sp1;

-- Step B: Erroneous deduction of Rs 20000 from Rahul (e.g. overdraft limit exceeded)
UPDATE Accounts
SET Balance = Balance - 20000
WHERE Account_ID = 102;

-- Rollback only the erroneous operation back to checkpoint sp1
ROLLBACK TO SAVEPOINT sp1;

-- Commit the valid transaction portion (Amit's Rs 1000 deduction)
COMMIT;

-- Verify: Amit = 7000.00, Rahul = 10000.00
SELECT * FROM Accounts;
