-- ==============================================================================
-- DBMS Lab – Experiment 1: Design an ER Diagram for an Indian E-Commerce Platform
-- File: complete_experiment1.sql
-- Description: Unified Executable Script (Schema + Dataset + Relational Queries)
-- ==============================================================================

-- ==============================================================================
-- PART 1: RELATIONAL SCHEMA DEFINITION (DDL)
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

-- Drop in reverse dependency order
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

-- Users Entity
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
CREATE TABLE User_Phone (
    User_ID INT,
    Phone_Number VARCHAR(15) NOT NULL,
    Is_Primary BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (User_ID, Phone_Number),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Address Entity
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

-- Category Entity (Self-Referencing)
CREATE TABLE Category (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Parent_Category_ID INT NULL,
    FOREIGN KEY (Parent_Category_ID) REFERENCES Category(Category_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Product Entity (General Superclass)
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

-- Cart
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

-- Wishlist
CREATE TABLE Wishlist (
    Wishlist_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Added_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uq_user_wishlist_product (User_ID, Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Product Review
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

-- Coupon
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

-- Orders
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

-- Order Coupons
CREATE TABLE Order_Coupon (
    Order_ID INT,
    Coupon_ID INT,
    Applied_Discount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Order_ID, Coupon_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Coupon_ID) REFERENCES Coupon(Coupon_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Weak Entity: Order_Item
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

-- Payment (1 : 1 Mandatory)
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

-- Delivery (1 : 1 Logistics)
CREATE TABLE Delivery (
    Delivery_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Delivery_Partner VARCHAR(80) NOT NULL,
    Tracking_Number VARCHAR(60) NOT NULL UNIQUE,
    Estimated_Delivery DATE,
    Actual_Delivery TIMESTAMP NULL,
    Delivery_Status ENUM('Order_Dispatched', 'In_Transit', 'Out_for_Delivery', 'Delivered', 'Returned') DEFAULT 'Order_Dispatched',
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- ==============================================================================
-- PART 2: DATASET POPULATION
-- ==============================================================================

-- Users
INSERT INTO Users (User_ID, Full_Name, Email, Password_Hash, Date_Of_Birth, Gender) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.in', 'hash_aarav_998', '1998-05-14', 'Male'),
(2, 'Priya Patel', 'priya.patel@example.in', 'hash_priya_2001', '2001-08-22', 'Female'),
(3, 'Rahul Verma', 'rahul.verma@example.in', 'hash_rahul_1995', '1995-12-03', 'Male'),
(4, 'Ananya Iyer', 'ananya.iyer@example.in', 'hash_ananya_1999', '1999-03-30', 'Female'),
(5, 'Rohan Kapoor', 'rohan.kapoor@example.in', 'hash_rohan_1997', '1997-11-18', 'Male');

-- User Phones
INSERT INTO User_Phone (User_ID, Phone_Number, Is_Primary) VALUES
(1, '+91-9811023456', TRUE),
(1, '+91-9811099887', FALSE),
(2, '+91-9920145678', TRUE),
(3, '+91-9876543210', TRUE),
(4, '+91-9444123456', TRUE),
(4, '+91-8056123456', FALSE),
(5, '+91-9711223344', TRUE);

-- Addresses
INSERT INTO Address (Address_ID, User_ID, Full_Name, Phone, Address_Line1, Address_Line2, City, State, Pincode, Address_Type, Is_Default) VALUES
(1, 1, 'Aarav Sharma', '+91-9811023456', 'Flat 402, Royal Palms', 'Sector 62', 'Noida', 'Uttar Pradesh', '201301', 'Home', TRUE),
(2, 1, 'Aarav Sharma', '+91-9811023456', 'DLF Cyber City, Tower B, 5th Floor', 'DLF Phase 2', 'Gurugram', 'Haryana', '122002', 'Work', FALSE),
(3, 2, 'Priya Patel', '+91-9920145678', 'B-12, Shanti Kunj Apartments', 'Andheri West', 'Mumbai', 'Maharashtra', '400053', 'Home', TRUE),
(4, 3, 'Rahul Verma', '+91-9876543210', 'Plot 88, Gomti Nagar Extension', 'Near Shaheed Path', 'Lucknow', 'Uttar Pradesh', '226010', 'Home', TRUE),
(5, 4, 'Ananya Iyer', '+91-9444123456', '34, 4th Main Road, Indiranagar', 'Opp. Metro Station', 'Bengaluru', 'Karnataka', '560038', 'Home', TRUE),
(6, 5, 'Rohan Kapoor', '+91-9711223344', 'House 56, Model Town', 'Near Tagore Garden', 'Delhi', 'Delhi', '110009', 'Home', TRUE);

-- Sellers
INSERT INTO Seller (Seller_ID, Seller_Name, Email, Phone, GSTIN, PAN_Number, Bank_Account_No, Bank_IFSC, City, State, Rating) VALUES
(1, 'TechBazaar Retail India', 'seller@techbazaar.in', '+91-1145678901', '07AAACT1234A1Z5', 'AAACT1234A', '912010045678901', 'UTIB0000045', 'New Delhi', 'Delhi', 4.85),
(2, 'DesiTrends Fashion Hub', 'orders@desitrends.in', '+91-1412345678', '08AABCF4567B1Z2', 'AABCF4567B', '002305001234567', 'HDFC0000023', 'Jaipur', 'Rajasthan', 4.70),
(3, 'SmartGadgets India Ltd', 'contact@smartgadgets.in', '+91-8023456789', '29AABCS8901C1Z8', 'AABCS8901C', '502000123456789', 'ICIC0000011', 'Bengaluru', 'Karnataka', 4.90),
(4, 'Heritage Silk Weavers', 'info@heritagesilk.in', '+91-2612345678', '24AABCH3456D1Z1', 'AABCH3456D', '601201010004567', 'SBIN0000123', 'Surat', 'Gujarat', 4.65);

-- Categories
INSERT INTO Category (Category_ID, Category_Name, Parent_Category_ID) VALUES
(1, 'Electronics', NULL),
(2, 'Fashion', NULL),
(3, 'Smartphones & Accessories', 1),
(4, 'Laptops & Computing', 1),
(5, 'Ethnic Wear', 2),
(6, 'Western Wear', 2);

-- Products
INSERT INTO Product (Product_ID, Product_Name, Description, Price, Discount_Percent, Stock_Quantity, Brand, Image_URL, Category_ID, Seller_ID) VALUES
(1, 'OnePlus 12 5G (Flowy Emerald)', 'Snapdragon 8 Gen 3, Hasselblad Camera, 5400mAh Battery', 64999.00, 7.50, 45, 'OnePlus', 'https://img.ecommerce.in/p1.jpg', 3, 1),
(2, 'Apple MacBook Air M2', '13.6-inch Liquid Retina Display, 8GB Unified Memory, 256GB SSD', 89900.00, 10.00, 20, 'Apple', 'https://img.ecommerce.in/p2.jpg', 4, 3),
(3, 'Pure Banarasi Silk Saree', 'Handcrafted Zari Woven Traditional Festive Silk Saree with Blouse', 5499.00, 20.00, 35, 'Heritage Silk', 'https://img.ecommerce.in/p3.jpg', 5, 4),
(4, 'Men Cotton Straight Kurta', 'Premium breathable cotton mandarin collar kurta for festivities', 1299.00, 15.00, 80, 'DesiTrends', 'https://img.ecommerce.in/p4.jpg', 5, 2),
(5, 'boAt Airdopes 141 ANC', 'True Wireless Earbuds with Active Noise Cancellation, 42H Playback', 1799.00, 40.00, 150, 'boAt', 'https://img.ecommerce.in/p5.jpg', 3, 1);

-- Subclass Specializations
INSERT INTO Electronics_Product (Product_ID, Model_Number, Warranty_Months, RAM_Capacity, Storage_Capacity, Power_Consumption) VALUES
(1, 'OP-12-GRN-256', 12, '16 GB', '256 GB', '100W SUPERVOOC'),
(2, 'MLXW3HN/A', 12, '8 GB', '256 GB SSD', '35W Dual USB-C'),
(5, 'AD-141-ANC-BLK', 12, 'N/A', 'N/A', '5W Type-C');

INSERT INTO Fashion_Product (Product_ID, Size, Color, Fabric_Material, Gender_Category) VALUES
(3, 'Free Size (5.5m)', 'Royal Green & Gold', '100% Banarasi Katan Silk', 'Women'),
(4, 'L (42)', 'Mustard Yellow', '100% Combed Cotton', 'Men');

-- Coupons
INSERT INTO Coupon (Coupon_ID, Coupon_Code, Description, Discount_Type, Discount_Value, Min_Order_Value, Expiry_Date, Is_Active) VALUES
(1, 'DIWALI2026', 'Flat ₹2000 festival off on Electronics above ₹30,000', 'Flat', 2000.00, 30000.00, '2026-11-30', TRUE),
(2, 'FESTIVE500', 'Flat ₹500 off on festive ethnic wear orders above ₹3,000', 'Flat', 500.00, 3000.00, '2026-12-31', TRUE),
(3, 'WELCOME10', '10% instant discount for new shoppers up to ₹1,000', 'Percentage', 10.00, 1000.00, '2026-12-31', TRUE);

-- Cart & Wishlist
INSERT INTO Cart (Cart_ID, User_ID, Product_ID, Quantity) VALUES
(1, 2, 4, 1),
(2, 3, 5, 2);

INSERT INTO Wishlist (Wishlist_ID, User_ID, Product_ID) VALUES
(1, 1, 2),
(2, 4, 3);

-- Orders
INSERT INTO Orders (Order_ID, User_ID, Shipping_Address_ID, Order_Date, Order_Status, Total_Amount, Discount_Amount, Final_Amount) VALUES
(1001, 1, 1, '2026-10-20 10:15:00', 'Delivered', 64999.00, 2000.00, 62999.00),
(1002, 2, 3, '2026-10-22 14:30:00', 'Shipped', 5499.00, 500.00, 4999.00),
(1003, 4, 5, '2026-10-24 16:45:00', 'Confirmed', 1299.00, 0.00, 1299.00);

-- Order Coupons
INSERT INTO Order_Coupon (Order_ID, Coupon_ID, Applied_Discount) VALUES
(1001, 1, 2000.00),
(1002, 2, 500.00);

-- Order Items
INSERT INTO Order_Item (Order_Item_ID, Order_ID, Product_ID, Seller_ID, Quantity, Price_Per_Unit, Discount, Subtotal) VALUES
(1, 1001, 1, 1, 1, 64999.00, 2000.00, 62999.00),
(2, 1002, 3, 4, 1, 5499.00, 500.00, 4999.00),
(3, 1003, 4, 2, 1, 1299.00, 0.00, 1299.00);

-- Payment
INSERT INTO Payment (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method, Payment_Status, Transaction_Reference) VALUES
(1, 1001, '2026-10-20 10:16:30', 62999.00, 'UPI', 'Success', 'UPI/20261020/AXIS/987654321'),
(2, 1002, '2026-10-22 14:32:10', 4999.00, 'Debit_Card', 'Success', 'TXN_DC_HDFC_88776655'),
(3, 1003, '2026-10-24 16:45:00', 1299.00, 'COD', 'Pending', 'COD_REQ_DEL_1003');

-- Delivery
INSERT INTO Delivery (Delivery_ID, Order_ID, Delivery_Partner, Tracking_Number, Estimated_Delivery, Actual_Delivery, Delivery_Status) VALUES
(1, 1001, 'BlueDart Express', 'BLUEDART-IND-778899', '2026-10-23', '2026-10-23 15:40:00', 'Delivered'),
(2, 1002, 'Delhivery Logistics', 'DELHIVERY-DL-554433', '2026-10-26', NULL, 'In_Transit'),
(3, 1003, 'Shadowfax Express', 'SHADOW-EXP-112233', '2026-10-28', NULL, 'Order_Dispatched');

-- Reviews
INSERT INTO Product_Review (Review_ID, Product_ID, User_ID, Rating, Review_Text) VALUES
(1, 1, 1, 5, 'Superb performance and camera clarity! Battery lasts over a day easily.'),
(2, 3, 2, 5, 'Authentic Banarasi weave, rich fabric and stunning green color. Loved it!'),
(3, 5, 3, 4, 'Great sound quality for the price point, battery backup is fantastic.');


-- ==============================================================================
-- PART 3: RELATIONSHIP VERIFICATION QUERIES
-- ==============================================================================

-- 1. Customer Order Summary with Shipping Address
SELECT 
    o.Order_ID,
    u.Full_Name AS Customer_Name,
    CONCAT(a.Address_Line1, ', ', a.City, ', ', a.State, ' - ', a.Pincode) AS Shipping_Address,
    a.Address_Type,
    o.Order_Date,
    o.Order_Status,
    o.Final_Amount
FROM Orders o
INNER JOIN Users u ON o.User_ID = u.User_ID
INNER JOIN Address a ON o.Shipping_Address_ID = a.Address_ID
ORDER BY o.Order_ID;

-- 2. Line-Item Order Breakdown (Traversing Weak Entity Order_Item)
SELECT 
    oi.Order_ID,
    p.Product_Name,
    c.Category_Name,
    s.Seller_Name,
    s.GSTIN,
    oi.Quantity,
    oi.Price_Per_Unit,
    oi.Subtotal
FROM Order_Item oi
INNER JOIN Product p ON oi.Product_ID = p.Product_ID
INNER JOIN Category c ON p.Category_ID = c.Category_ID
INNER JOIN Seller s ON oi.Seller_ID = s.Seller_ID
ORDER BY oi.Order_ID;

-- 3. Payment and Coupon Verification
SELECT 
    o.Order_ID,
    o.Total_Amount,
    COALESCE(cp.Coupon_Code, 'None') AS Coupon_Applied,
    o.Discount_Amount,
    o.Final_Amount,
    pm.Payment_Method,
    pm.Payment_Status
FROM Orders o
LEFT JOIN Payment pm ON o.Order_ID = pm.Order_ID
LEFT JOIN Order_Coupon oc ON o.Order_ID = oc.Order_ID
LEFT JOIN Coupon cp ON oc.Coupon_ID = cp.Coupon_ID
ORDER BY o.Order_ID;

-- 4. Order Logistics & Delivery Tracking
SELECT 
    o.Order_ID,
    u.Full_Name AS Customer,
    d.Delivery_Partner,
    d.Tracking_Number,
    d.Delivery_Status,
    d.Estimated_Delivery,
    d.Actual_Delivery
FROM Delivery d
INNER JOIN Orders o ON d.Order_ID = o.Order_ID
INNER JOIN Users u ON o.User_ID = u.User_ID
ORDER BY o.Order_ID;
