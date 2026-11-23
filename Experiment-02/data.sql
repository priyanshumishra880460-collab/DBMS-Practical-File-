-- ==============================================================================
-- DBMS Lab – Experiment 2: ER Diagram to Relational Schema & Integrity Constraints
-- File: data.sql
-- Description: Sample Data Insertion across all Relational Tables
-- ==============================================================================

USE ECOMMERCE;

-- 1. Insert Customer Record
INSERT INTO CUSTOMER (CustomerID, Name, Email, Password, DateOfBirth) VALUES
(1, 'Priyanshu', 'priyanshumishra880460@gmail.com', 'pass123', '2007-01-20');

-- 2. Insert Customer Phone Numbers
INSERT INTO CUSTOMER_PHONE (CustomerID, Phone) VALUES
(1, '6388046065');

INSERT INTO CUSTOMER_ALT_PHONE (CustomerID, AltPhone) VALUES
(1, '6388046065');

-- 3. Insert Seller Record
INSERT INTO SELLER (SellerID, SellerName, Email, GSTIN, AccountNo, IFSCCode, BankName) VALUES
(101, 'TechStore', 'tech@gmail.com', 'GST123', '123456', 'SBIN002', 'SBI');

-- 4. Insert Seller Phone
INSERT INTO SELLER_PHONE (SellerID, Phone) VALUES
(101, '7897897919');

-- 5. Insert Categories (Hierarchical parent and subcategory)
INSERT INTO CATEGORY (CategoryID, CategoryName, Description, ParentCategoryID) VALUES
(201, 'Electronics', 'Electronic Items', NULL),
(202, 'Mobiles', 'Mobile Phones', 201);

-- 6. Insert Product Record
INSERT INTO PRODUCT (ProductID, ProductName, Description, Price, StockQty, Weight, SellerID, CategoryID) VALUES
(301, 'Laptop', 'Gaming Laptop', 75000.00, 10, 2.50, 101, 201);

-- 7. Insert Product Specialization: Electronics Subclass
INSERT INTO ELECTRONICS (ProductID, Brand, Warranty, PowerRating) VALUES
(301, 'ASUS', '2 Years', '180W');

-- 8. Insert Product Image Record
INSERT INTO PRODUCT_IMAGE (ProductID, Image) VALUES
(301, 'laptop.jpg');

-- 9. Insert Delivery Address
INSERT INTO ADDRESS (AddressID, DoorNo, Street, Area, City, State, Pincode, AddressType, CustomerID) VALUES
(401, '121', 'Nawabganj', 'Unnao', 'Unnao', 'Uttar Pradesh', '209859', 'Work', 1);

-- 10. Insert Address Mobile Number
INSERT INTO ADDRESS_MOBILE (AddressID, MobileNo) VALUES
(401, '9192958085');

-- 11. Insert Order Record
INSERT INTO ORDERS (OrderID, OrderDate, OrderStatus, TotalAmount, CustomerID, AddressID) VALUES
(501, '2026-08-14', 'Placed', 75000.00, 1, 401);

-- 12. Insert Order Item (Weak entity record)
INSERT INTO ORDERITEM (OrderID, ItemNo, ProductID, ItemPrice, Quantity, Discount, TaxAmount) VALUES
(501, 1, 301, 75000.00, 1, 1000.00, 9000.00);

-- 13. Insert Order Coupon Record
INSERT INTO ORDER_COUPON (OrderID, CouponCode) VALUES
(501, 'WELCOME10');

-- 14. Insert Payment Record
INSERT INTO PAYMENT (PaymentID, PaymentDate, Amount, PaymentMethod, TransactionID, PaymentStatus, OrderID) VALUES
(601, '2026-08-14', 74000.00, 'UPI', 'TXN123', 'Paid', 501);

-- 15. Insert Delivery Fulfillment Record
INSERT INTO DELIVERY (DeliveryID, DeliveryDate, DeliveryStatus, TrackingID, DeliveryPartner, ShippingCharge, OrderID, AddressID) VALUES
(701, NULL, 'Processing', 'TRK123', 'Delhivery', 100.00, 501, 401);
