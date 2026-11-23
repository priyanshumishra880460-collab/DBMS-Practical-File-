-- ==============================================================================
-- DBMS Lab – Experiment 9: B-Tree Indexing, Composite Indexes & Query Optimization
-- File: 03_composite_index.sql
-- Description: Create Composite (Multi-Column) Index and evaluate query plan
-- ==============================================================================

USE RailwayDB;

-- ==============================================================================
-- 1. Create Composite B-Tree Index on (Train_No, Journey_Date)
-- Leverages the Leftmost Prefix Rule for multi-column predicates.
-- ==============================================================================
DROP INDEX IF EXISTS idx_train_date ON Railway_Booking;

CREATE INDEX idx_train_date
ON Railway_Booking(Train_No, Journey_Date);


-- ==============================================================================
-- 2. Query Execution Plan with Composite Index
-- Query filters on BOTH Train_No AND Journey_Date.
-- Expected: type = ref, key = idx_train_date, key_len = 9 (4 bytes INT + 3 bytes DATE + 2 null bytes),
-- rows examined = 1 (Exact pin-point retrieval down to a single row!).
-- ==============================================================================
EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';
