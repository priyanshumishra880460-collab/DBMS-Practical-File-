-- ==============================================================================
-- DBMS Lab – Experiment 8: Banking Transactions, Savepoints & Concurrency Control
-- File: 03_partial_failure_simulation.sql
-- Description: Simulating transfer failure to an invalid account and executing rollback
-- ==============================================================================

USE BankingDB;

-- ==============================================================================
-- Partial Failure Simulation (Atomicity & Consistency preservation)
-- Transfer Rs 500 from Amit (101) to non-existent account (999).
-- Because destination account does not exist, transaction is rolled back to
-- ensure money is not lost into a void.
-- ==============================================================================
START TRANSACTION;

-- Step 1: Debit Rs 500 from Amit
UPDATE Accounts
SET Balance = Balance - 500
WHERE Account_ID = 101;

-- Step 2: Simulated failure - attempting credit to non-existent Account 999
UPDATE Accounts
SET Balance = Balance + 500
WHERE Account_ID = 999;

-- Check rows affected / business validation detects destination does not exist; Rollback
ROLLBACK;

-- Verify that Amit's balance remains unchanged at 7000.00
SELECT * FROM Accounts;
