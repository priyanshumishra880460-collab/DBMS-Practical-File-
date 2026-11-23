-- ==============================================================================
-- DBMS Lab – Experiment 8: Banking Transactions, Savepoints & Concurrency Control
-- File: 04_isolation_levels_and_concurrency.sql
-- Description: Transaction Isolation Levels configuration and Multi-Session Concurrency
-- ==============================================================================

USE BankingDB;

-- ==============================================================================
-- 1. Testing Transaction Isolation Levels Syntax
-- ==============================================================================

-- A. READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

-- B. REPEATABLE READ (Default in MySQL InnoDB)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

-- C. SERIALIZABLE (Highest isolation; strict locking / range locks)
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;


-- ==============================================================================
-- 2. Concurrency Anomaly Demonstration across Two Concurrent Sessions
-- Demonstrates Non-Repeatable Read under READ COMMITTED vs REPEATABLE READ
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- SESSION 1 (Client Connection 1):
-- ------------------------------------------------------------------------------
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- Initial Read: Sees Balance = 7000.00
SELECT Balance FROM Accounts WHERE Account_ID = 101;


-- ------------------------------------------------------------------------------
-- SESSION 2 (Client Connection 2 - Concurrent Writer):
-- ------------------------------------------------------------------------------
-- Concurrently updates and commits Amit's balance while Session 1 is still open
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE Account_ID = 101;

COMMIT;


-- ------------------------------------------------------------------------------
-- SESSION 1 (Resuming Client Connection 1):
-- ------------------------------------------------------------------------------
-- In READ COMMITTED: Second read sees newly committed balance 6500.00 (Non-repeatable read).
-- In REPEATABLE READ: MVCC snapshot read continues to see 7000.00 until committed.
SELECT Balance FROM Accounts WHERE Account_ID = 101;

COMMIT;

-- Final Verification of Account State
SELECT * FROM Accounts;
