-- ==============================================================================
-- DBMS Lab – Experiment 9: B-Tree Indexing, Composite Indexes & Query Optimization
-- File: complete_experiment9.sql
-- Description: Unified Executable Script for Experiment 9 (Schema, Procedure, 5K Rows, Indexes & EXPLAIN)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. DATABASE & TABLE SETUP
-- ------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS RailwayDB;
USE RailwayDB;

DROP PROCEDURE IF EXISTS InsertBookings;
DROP TABLE IF EXISTS Railway_Booking;

CREATE TABLE Railway_Booking (
    Booking_ID INT PRIMARY KEY,
    Passenger_Name VARCHAR(50),
    Train_No INT,
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Journey_Date DATE,
    Seat_No INT,
    Fare DECIMAL(10, 2)
);

-- ------------------------------------------------------------------------------
-- 2. BULK POPULATING 5,000 BOOKINGS VIA STORED PROCEDURE
-- ------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE InsertBookings()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 5000 DO
        INSERT INTO Railway_Booking VALUES (
            i,
            CONCAT('Passenger_', i),
            12000 + (i % 20),
            'Delhi',
            'Lucknow',
            DATE_ADD('2026-01-01', INTERVAL (i % 365) DAY),
            i % 100,
            500 + (i % 1500)
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL InsertBookings();

-- Sample from original table
SELECT * FROM Railway_Booking LIMIT 10;

-- ------------------------------------------------------------------------------
-- 3. QUERY BEFORE INDEXING (FULL TABLE SCAN)
-- ------------------------------------------------------------------------------
EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;

-- ------------------------------------------------------------------------------
-- 4. SINGLE-COLUMN INDEX CREATION & EXPLAIN
-- ------------------------------------------------------------------------------
CREATE INDEX idx_train
ON Railway_Booking(Train_No);

EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;

-- ------------------------------------------------------------------------------
-- 5. COMPOSITE INDEX CREATION & EXPLAIN
-- ------------------------------------------------------------------------------
CREATE INDEX idx_train_date
ON Railway_Booking(Train_No, Journey_Date);

EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';

-- ------------------------------------------------------------------------------
-- 6. PERFORMANCE COMPARISON QUERIES
-- ------------------------------------------------------------------------------
SELECT * FROM Railway_Booking
WHERE Train_No = 12005;

SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';

-- ------------------------------------------------------------------------------
-- 7. FINAL TABLE STATE (SAMPLE DISPLAY)
-- ------------------------------------------------------------------------------
SELECT * FROM Railway_Booking LIMIT 10;
