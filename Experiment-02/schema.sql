-- ==============================================================================
-- DBMS Lab – Experiment 2: ER Diagram to Relational Schema & Integrity Constraints
-- File: schema.sql
-- Description: Complete 18-Table Relational Schema with Foreign Keys & Cascade Actions
-- ==============================================================================

-- 1. Create and Switch to Database
CREATE DATABASE IF NOT EXISTS ECOMMERCE;
USE ECOMMERCE;

-- 2. Drop existing tables in reverse dependency order
DROP TABLE IF EXISTS DELIVERY;
DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS ORDERITEM;
DROP TABLE IF EXISTS ORDER_COUPON;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS ADDRESS_MOBILE;
DROP TABLE IF EXISTS ADDRESS;
DROP TABLE IF EXISTS BOOKS;
DROP TABLE IF EXISTS CLOTHING;
DROP TABLE IF EXISTS ELECTRONICS;
DROP TABLE IF EXISTS PRODUCT_IMAGE;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS SELLER_PHONE;
DROP TABLE IF EXISTS SELLER;
DROP TABLE IF EXISTS CUSTOMER_ALT_PHONE;
DROP TABLE IF EXISTS CUSTOMER_PHONE;
DROP TABLE IF EXISTS CUSTOMER;

-- ==============================================================================
-- 3. Table Definitions (18 Normalized Relational Tables)
-- ==============================================================================

-- 1. Customer Base Table
CREATE TABLE CUSTOMER (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- 2. Customer Phone (Multi-valued attribute normalized)
CREATE TABLE CUSTOMER_PHONE (
    CustomerID INT,
    Phone VARCHAR(15),
    PRIMARY KEY (CustomerID, Phone),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
    ON DELETE CASCADE
);

-- 3. Customer Alternate Phone
CREATE TABLE CUSTOMER_ALT_PHONE (
    CustomerID INT,
    AltPhone VARCHAR(15),
    PRIMARY KEY (CustomerID, AltPhone),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
    ON DELETE CASCADE
);

-- 4. Seller Base Table
CREATE TABLE SELLER (
    SellerID INT PRIMARY KEY,
    SellerName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    GSTIN VARCHAR(20) UNIQUE NOT NULL,
    AccountNo VARCHAR(20),
    IFSCCode VARCHAR(20),
    BankName VARCHAR(50)
);

-- 5. Seller Phone (Multi-valued attribute normalized)
CREATE TABLE SELLER_PHONE (
    SellerID INT,
    Phone VARCHAR(15),
    PRIMARY KEY (SellerID, Phone),
    FOREIGN KEY (SellerID) REFERENCES SELLER (SellerID)
    ON DELETE CASCADE
);

-- 6. Category Table (Self-referencing unary relationship)
CREATE TABLE CATEGORY (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    Description VARCHAR(100),
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES CATEGORY (CategoryID)
    ON DELETE SET NULL
);

-- 7. Product Base Table
CREATE TABLE PRODUCT (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Description VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    StockQty INT NOT NULL,
    Weight DECIMAL(8, 2),
    SellerID INT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (SellerID) REFERENCES SELLER (SellerID)
    ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES CATEGORY (CategoryID)
    ON DELETE SET NULL
);

-- 8. Product Image (Multi-valued attribute)
CREATE TABLE PRODUCT_IMAGE (
    ProductID INT,
    Image VARCHAR(200),
    PRIMARY KEY (ProductID, Image),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
    ON DELETE CASCADE
);

-- 9. Electronics Specialization Subclass
CREATE TABLE ELECTRONICS (
    ProductID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Warranty VARCHAR(30),
    PowerRating VARCHAR(30),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
    ON DELETE CASCADE
);

-- 10. Clothing Specialization Subclass
CREATE TABLE CLOTHING (
    ProductID INT PRIMARY KEY,
    Size VARCHAR(20),
    Colour VARCHAR(20),
    Material VARCHAR(30),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
    ON DELETE CASCADE
);

-- 11. Books Specialization Subclass
CREATE TABLE BOOKS (
    ProductID INT PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE,
    Author VARCHAR(50),
    Publisher VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
    ON DELETE CASCADE
);

-- 12. Address Table (Flattened composite attribute)
CREATE TABLE ADDRESS (
    AddressID INT PRIMARY KEY,
    DoorNo VARCHAR(10),
    Street VARCHAR(50),
    Area VARCHAR(50),
    City VARCHAR(30),
    State VARCHAR(30),
    Pincode VARCHAR(10) NOT NULL,
    AddressType VARCHAR(20),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
    ON DELETE CASCADE
);

-- 13. Address Mobile (Multi-valued attribute)
CREATE TABLE ADDRESS_MOBILE (
    AddressID INT,
    MobileNo VARCHAR(15),
    PRIMARY KEY (AddressID, MobileNo),
    FOREIGN KEY (AddressID) REFERENCES ADDRESS (AddressID)
    ON DELETE CASCADE
);

-- 14. Orders Table
CREATE TABLE ORDERS (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CustomerID INT NOT NULL,
    AddressID INT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
    ON DELETE CASCADE,
    FOREIGN KEY (AddressID) REFERENCES ADDRESS (AddressID)
    ON DELETE SET NULL
);

-- 15. Order Coupon (M:N relationship between Orders and Coupons)
CREATE TABLE ORDER_COUPON (
    OrderID INT,
    CouponCode VARCHAR(30),
    PRIMARY KEY (OrderID, CouponCode),
    FOREIGN KEY (OrderID) REFERENCES ORDERS (OrderID)
    ON DELETE CASCADE
);

-- 16. Order Item (Weak Entity identified by composite primary key)
CREATE TABLE ORDERITEM (
    OrderID INT,
    ItemNo INT,
    ProductID INT NOT NULL,
    ItemPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(10, 2),
    TaxAmount DECIMAL(10, 2),
    PRIMARY KEY (OrderID, ItemNo),
    FOREIGN KEY (OrderID) REFERENCES ORDERS (OrderID)
    ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT (ProductID)
    ON DELETE CASCADE
);

-- 17. Payment Table (1:1 Mandatory relationship with Orders)
CREATE TABLE PAYMENT (
    PaymentID INT PRIMARY KEY,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(30) NOT NULL,
    TransactionID VARCHAR(30) UNIQUE,
    PaymentStatus VARCHAR(20) NOT NULL,
    OrderID INT UNIQUE NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES ORDERS (OrderID)
    ON DELETE CASCADE
);

-- 18. Delivery Table (1:1 Logistics fulfillment)
CREATE TABLE DELIVERY (
    DeliveryID INT PRIMARY KEY,
    DeliveryDate DATE,
    DeliveryStatus VARCHAR(20) NOT NULL,
    TrackingID VARCHAR(30) UNIQUE,
    DeliveryPartner VARCHAR(50),
    ShippingCharge DECIMAL(8, 2),
    OrderID INT UNIQUE NOT NULL,
    AddressID INT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS (OrderID)
    ON DELETE CASCADE,
    FOREIGN KEY (AddressID) REFERENCES ADDRESS (AddressID)
    ON DELETE CASCADE
);
