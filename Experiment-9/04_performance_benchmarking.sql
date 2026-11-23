-- ==============================================================================
-- DBMS Lab – Experiment 9: B-Tree Indexing, Composite Indexes & Query Optimization
-- File: 04_performance_benchmarking.sql
-- Description: Inspect indexes and execute data retrieval performance queries
-- ==============================================================================

USE RailwayDB;

-- ==============================================================================
-- 1. Inspect All Created Indexes on Railway_Booking Table
-- Shows Primary Key, idx_train, and idx_train_date metadata
-- ==============================================================================
SHOW INDEX FROM Railway_Booking;


-- ==============================================================================
-- 2. Performance Query 1: Single-Column Filter (Train_No = 12005)
-- Evaluates fast indexed lookup returning all passengers on train 12005
-- ==============================================================================
SELECT * FROM Railway_Booking
WHERE Train_No = 12005;


-- ==============================================================================
-- 3. Performance Query 2: Composite Filter (Train_No = 12005 AND Journey_Date = '2026-03-15')
-- Evaluates composite indexed lookup pin-pointing the exact booking
-- ==============================================================================
SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';


-- ==============================================================================
-- 4. Final Display of Booking Records (Sample verification)
-- ==============================================================================
SELECT * FROM Railway_Booking LIMIT 10;
