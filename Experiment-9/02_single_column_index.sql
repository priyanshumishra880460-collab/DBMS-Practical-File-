-- ==============================================================================
-- DBMS Lab – Experiment 9: B-Tree Indexing, Composite Indexes & Query Optimization
-- File: 02_single_column_index.sql
-- Description: Benchmark query performance before and after Single-Column Index
-- ==============================================================================

USE RailwayDB;

-- ==============================================================================
-- 1. Query Execution Plan BEFORE Indexing
-- Analyzes query without any index on Train_No.
-- Expected: type = ALL (Full Table Scan), rows = ~5000, key = NULL.
-- ==============================================================================
EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;


-- ==============================================================================
-- 2. Create Single-Column B-Tree Index on Train_No
-- ==============================================================================
-- Drop if already exists to ensure repeatable testing
DROP INDEX IF EXISTS idx_train ON Railway_Booking;

CREATE INDEX idx_train
ON Railway_Booking(Train_No);


-- ==============================================================================
-- 3. Query Execution Plan AFTER Single-Column Index
-- Expected: type = ref (Index Lookup), key = idx_train, key_len = 5, rows = ~250.
-- Performance improvement: Scans only matching B-Tree entries instead of full table.
-- ==============================================================================
EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;
