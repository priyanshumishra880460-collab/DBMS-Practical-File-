-- ==============================================================================
-- DBMS Lab – Experiment 8: Banking Transactions, Savepoints & Concurrency Control
-- File: complete_experiment8.sql
-- Description: Unified Executable Script for Experiment 8 (TCL, Savepoints, Failures & Isolation)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. DATABASE AND TABLE SETUP
-- ------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

DROP TABLE IF EXISTS Accounts;

CREATE TABLE Accounts (
    Account_ID INT PRIMARY KEY,
    Holder_Name VARCHAR(50) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO Accounts VALUES
(101, 'Amit', 10000.00),
(102, 'Rahul', 8000.00);

-- Initial State Output
SELECT * FROM Accounts;

-- ------------------------------------------------------------------------------
-- 2. BEGIN AND COMMIT (Successful Fund Transfer)
-- ------------------------------------------------------------------------------
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 2000
WHERE Account_ID = 101;

UPDATE Accounts
SET Balance = Balance + 2000
WHERE Account_ID = 102;

COMMIT;

-- State after COMMIT (Amit: 8000.00, Rahul: 10000.00)
SELECT * FROM Accounts;

-- ------------------------------------------------------------------------------
-- 3. ROLLBACK (Discarding Uncommitted Work)
-- ------------------------------------------------------------------------------
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 5000
WHERE Account_ID = 101;

ROLLBACK;

-- State after ROLLBACK (Amit remains 8000.00, Rahul: 10000.00)
SELECT * FROM Accounts;

-- ------------------------------------------------------------------------------
-- 4. SAVEPOINT AND PARTIAL ROLLBACK
-- ------------------------------------------------------------------------------
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE Account_ID = 101;

SAVEPOINT sp1;

UPDATE Accounts
SET Balance = Balance - 20000
WHERE Account_ID = 102;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

-- State after SAVEPOINT rollback & commit (Amit: 7000.00, Rahul: 10000.00)
SELECT * FROM Accounts;

-- ------------------------------------------------------------------------------
-- 5. PARTIAL FAILURE SIMULATION
-- ------------------------------------------------------------------------------
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE Account_ID = 101;

-- Simulated failure: transfer to invalid non-existent account
UPDATE Accounts
SET Balance = Balance + 500
WHERE Account_ID = 999;

ROLLBACK;

-- State after Partial Failure rollback (Amit remains 7000.00, Rahul: 10000.00)
SELECT * FROM Accounts;

-- ------------------------------------------------------------------------------
-- 6. TRANSACTION ISOLATION LEVELS
-- ------------------------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

-- ------------------------------------------------------------------------------
-- 7. CONCURRENCY ANOMALY SIMULATION (SESSION 1 & SESSION 2)
-- ------------------------------------------------------------------------------
-- Simulate update from concurrent Session 2
START TRANSACTION;
UPDATE Accounts
SET Balance = Balance - 500
WHERE Account_ID = 101;
COMMIT;

-- ------------------------------------------------------------------------------
-- 8. FINAL TABLE STATE
-- ------------------------------------------------------------------------------
SELECT * FROM Accounts;
