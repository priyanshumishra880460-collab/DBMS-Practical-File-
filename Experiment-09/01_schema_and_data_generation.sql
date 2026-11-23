-- ==============================================================================
-- DBMS Lab – Experiment 9: B-Tree Indexing, Composite Indexes & Query Optimization
-- File: 01_schema_and_data_generation.sql
-- Description: Create Railway_Booking table and populate 5,000 records via Stored Procedure
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS RailwayDB;
USE RailwayDB;

-- Drop previous artifacts if re-executing
DROP PROCEDURE IF EXISTS InsertBookings;
DROP TABLE IF EXISTS Railway_Booking;

-- 1. Create Railway Booking Table
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

-- 2. Stored Procedure for Bulk Generating 5,000 Records
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

-- 3. Execute Procedure to Populate Table
CALL InsertBookings();

-- Verify total row count
SELECT COUNT(*) AS Total_Bookings FROM Railway_Booking;

-- Display sample records from original table
SELECT * FROM Railway_Booking LIMIT 10;
