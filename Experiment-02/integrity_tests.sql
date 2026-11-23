-- ==============================================================================
-- DBMS Lab – Experiment 2: ER Diagram to Relational Schema & Integrity Constraints
-- File: integrity_tests.sql
-- Description: Referential Integrity Demonstrations (Violations, SET NULL, CASCADE)
-- ==============================================================================

USE ECOMMERCE;

-- ==============================================================================
-- OUTPUT 1: Schema Verification (18 Relational Tables)
-- ==============================================================================
SHOW TABLES;


-- ==============================================================================
-- OUTPUT 2: Sample Data Verification
-- ==============================================================================
SELECT * FROM CUSTOMER;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERS;


-- ==============================================================================
-- OUTPUT 3: Referential Integrity Violation Demonstration
-- Attempting to insert a child order referencing non-existent CustomerID = 999.
-- MySQL blocks this insertion and raises ERROR 1452 (23000):
-- "Cannot add or update a child row: a foreign key constraint fails"
-- ==============================================================================
-- Uncomment to execute the intentional violation test:
-- INSERT INTO ORDERS VALUES (502, '2026-08-14', 'Placed', 50000.00, 999, 401);


-- ==============================================================================
-- OUTPUT 4: ON DELETE SET NULL Demonstration
-- When parent Category 201 is deleted, the foreign key CategoryID in PRODUCT
-- automatically updates to NULL rather than being deleted or causing an error.
-- ==============================================================================

-- A. Inspect state before deletion
SELECT ProductID, ProductName, CategoryID FROM PRODUCT;

-- B. Delete parent category record
DELETE FROM CATEGORY WHERE CategoryID = 201;

-- C. Inspect state after deletion to verify CategoryID is set to NULL
SELECT ProductID, ProductName, CategoryID FROM PRODUCT;


-- ==============================================================================
-- OUTPUT 5: ON DELETE CASCADE Demonstration
-- When parent Customer 1 is deleted, all dependent child records across ORDERS,
-- ORDERITEM, PAYMENT, DELIVERY, and CUSTOMER_PHONE are automatically deleted.
-- ==============================================================================

-- A. Inspect orders before deleting parent customer
SELECT * FROM ORDERS;

-- B. Delete parent customer record
DELETE FROM CUSTOMER WHERE CustomerID = 1;

-- C. Verify that child orders were automatically deleted (Returns Empty set)
SELECT * FROM ORDERS;

-- D. Verify that multi-valued child phone numbers were also cascaded (Returns Empty set)
SELECT * FROM CUSTOMER_PHONE;
