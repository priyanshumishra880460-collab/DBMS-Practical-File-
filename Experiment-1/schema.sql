-- ==============================================================================
-- DBMS Lab – Experiment 1: Design an ER Diagram for an Indian E-Commerce Platform
-- File: schema.sql
-- Description: Relational Schema DDL derived from the E-Commerce ER Diagram
-- ==============================================================================

-- 1. Create and Switch to Database
CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

-- 2. Clean Drop in Reverse Dependency Order
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Order_Item;
DROP TABLE IF EXISTS Order_Coupon;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Coupon;
DROP TABLE IF EXISTS Product_Review;
DROP TABLE IF EXISTS Wishlist;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Fashion_Product;
DROP TABLE IF EXISTS Electronics_Product;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Seller;
DROP TABLE IF EXISTS User_Phone;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Users;

-- ==============================================================================
-- 3. Entity Tables Definition
-- ==============================================================================

-- Customer / User Entity
-- Represents shoppers on the platform with authentication and personal profiles
CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password_Hash VARCHAR(255) NOT NULL,
    Date_Of_Birth DATE,
    Gender ENUM('Male', 'Female', 'Other', 'Prefer Not to Say'),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Multi-valued Attribute: User Phones
-- Normalizes the multi-valued phone attribute for a user
CREATE TABLE User_Phone (
    User_ID INT,
    Phone_Number VARCHAR(15) NOT NULL,
    Is_Primary BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (User_ID, Phone_Number),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Address Entity (Composite Attribute mapped into structured relation)
-- One user can have multiple delivery addresses (1 : N)
CREATE TABLE Address (
    Address_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Full_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address_Line1 VARCHAR(150) NOT NULL,
    Address_Line2 VARCHAR(150),
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Pincode VARCHAR(10) NOT NULL,
    Address_Type ENUM('Home', 'Work', 'Other') DEFAULT 'Home',
    Is_Default BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Seller Entity
-- Stores registered merchants with Indian statutory compliance (GSTIN, PAN)
CREATE TABLE Seller (
    Seller_ID INT AUTO_INCREMENT PRIMARY KEY,
    Seller_Name VARCHAR(120) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    GSTIN VARCHAR(15) NOT NULL UNIQUE,
    PAN_Number VARCHAR(10) NOT NULL,
    Bank_Account_No VARCHAR(20) NOT NULL,
    Bank_IFSC VARCHAR(11) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    Rating DECIMAL(3, 2) DEFAULT 0.00,
    Joined_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Category Entity (Self-Referencing Hierarchy)
-- Supports subcategories (e.g. Mobiles under Electronics)
CREATE TABLE Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Parent_Category_ID INT NULL,
    FOREIGN KEY (Parent_Category_ID) REFERENCES Category(Category_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Product Entity (General Superclass)
-- General attributes shared by all sellable merchandise
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(150) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Discount_Percent DECIMAL(5, 2) DEFAULT 0.00,
    Stock_Quantity INT NOT NULL DEFAULT 0,
    Brand VARCHAR(80),
    Image_URL VARCHAR(255),
    Category_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Specialization Subclass 1: Electronics Product
CREATE TABLE Electronics_Product (
    Product_ID INT PRIMARY KEY,
    Model_Number VARCHAR(50),
    Warranty_Months INT DEFAULT 12,
    RAM_Capacity VARCHAR(20),
    Storage_Capacity VARCHAR(20),
    Power_Consumption VARCHAR(20),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Specialization Subclass 2: Fashion Product
CREATE TABLE Fashion_Product (
    Product_ID INT PRIMARY KEY,
    Size VARCHAR(20) NOT NULL,
    Color VARCHAR(30) NOT NULL,
    Fabric_Material VARCHAR(50),
    Gender_Category ENUM('Men', 'Women', 'Kids', 'Unisex'),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Shopping Cart (User to Product M:N Relationship)
CREATE TABLE Cart (
    Cart_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Added_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_user_cart_product (User_ID, Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Wishlist (User to Product M:N Relationship)
CREATE TABLE Wishlist (
    Wishlist_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Added_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_user_wishlist_product (User_ID, Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Product Review & Ratings Entity
CREATE TABLE Product_Review (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    User_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Review_Text TEXT,
    Review_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Coupon Entity
CREATE TABLE Coupon (
    Coupon_ID INT AUTO_INCREMENT PRIMARY KEY,
    Coupon_Code VARCHAR(30) NOT NULL UNIQUE,
    Description VARCHAR(255),
    Discount_Type ENUM('Percentage', 'Flat') NOT NULL,
    Discount_Value DECIMAL(10, 2) NOT NULL,
    Min_Order_Value DECIMAL(10, 2) DEFAULT 0.00,
    Expiry_Date DATE NOT NULL,
    Is_Active BOOLEAN DEFAULT TRUE
);

-- Orders Entity
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Shipping_Address_ID INT NOT NULL,
    Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Order_Status ENUM('Placed', 'Confirmed', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Placed',
    Total_Amount DECIMAL(10, 2) NOT NULL,
    Discount_Amount DECIMAL(10, 2) DEFAULT 0.00,
    Final_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Shipping_Address_ID) REFERENCES Address(Address_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- M:N Junction: Orders and Coupons Applied
CREATE TABLE Order_Coupon (
    Order_ID INT,
    Coupon_ID INT,
    Applied_Discount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Order_ID, Coupon_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Coupon_ID) REFERENCES Coupon(Coupon_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Weak Entity: Order_Item
-- Depends on Orders (Owner Strong Entity) for existential identification
CREATE TABLE Order_Item (
    Order_Item_ID INT AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Seller_ID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Price_Per_Unit DECIMAL(10, 2) NOT NULL,
    Discount DECIMAL(10, 2) DEFAULT 0.00,
    Subtotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Order_Item_ID, Order_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Payment Entity (1 : 1 Mandatory Participation with Orders)
CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_Method ENUM('UPI', 'Credit_Card', 'Debit_Card', 'Net_Banking', 'COD', 'Wallet') NOT NULL,
    Payment_Status ENUM('Success', 'Failed', 'Pending', 'Refunded') DEFAULT 'Pending',
    Transaction_Reference VARCHAR(100),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Delivery Entity (Shipment & Indian Logistics Tracking)
CREATE TABLE Delivery (
    Delivery_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Delivery_Partner VARCHAR(80) NOT NULL, -- e.g. Delhivery, BlueDart, Shadowfax
    Tracking_Number VARCHAR(60) NOT NULL UNIQUE,
    Estimated_Delivery DATE,
    Actual_Delivery TIMESTAMP NULL,
    Delivery_Status ENUM('Order_Dispatched', 'In_Transit', 'Out_for_Delivery', 'Delivered', 'Returned') DEFAULT 'Order_Dispatched',
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
