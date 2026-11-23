-- ==============================================================================
-- DBMS Lab – Experiment 1: Design an ER Diagram for an Indian E-Commerce Platform
-- File: data.sql
-- Description: Realistic Sample Dataset for Indian E-Commerce Relational Model
-- ==============================================================================

USE EcommerceDB;

-- 1. Insert Customers / Users
INSERT INTO Users (User_ID, Full_Name, Email, Password_Hash, Date_Of_Birth, Gender) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.in', 'hash_aarav_998', '1998-05-14', 'Male'),
(2, 'Priya Patel', 'priya.patel@example.in', 'hash_priya_2001', '2001-08-22', 'Female'),
(3, 'Rahul Verma', 'rahul.verma@example.in', 'hash_rahul_1995', '1995-12-03', 'Male'),
(4, 'Ananya Iyer', 'ananya.iyer@example.in', 'hash_ananya_1999', '1999-03-30', 'Female'),
(5, 'Rohan Kapoor', 'rohan.kapoor@example.in', 'hash_rohan_1997', '1997-11-18', 'Male');

-- 2. Insert User Phones (Multi-valued Attribute)
INSERT INTO User_Phone (User_ID, Phone_Number, Is_Primary) VALUES
(1, '+91-9811023456', TRUE),
(1, '+91-9811099887', FALSE),
(2, '+91-9920145678', TRUE),
(3, '+91-9876543210', TRUE),
(4, '+91-9444123456', TRUE),
(4, '+91-8056123456', FALSE),
(5, '+91-9711223344', TRUE);

-- 3. Insert Delivery Addresses
INSERT INTO Address (Address_ID, User_ID, Full_Name, Phone, Address_Line1, Address_Line2, City, State, Pincode, Address_Type, Is_Default) VALUES
(1, 1, 'Aarav Sharma', '+91-9811023456', 'Flat 402, Royal Palms', 'Sector 62', 'Noida', 'Uttar Pradesh', '201301', 'Home', TRUE),
(2, 1, 'Aarav Sharma', '+91-9811023456', 'DLF Cyber City, Tower B, 5th Floor', 'DLF Phase 2', 'Gurugram', 'Haryana', '122002', 'Work', FALSE),
(3, 2, 'Priya Patel', '+91-9920145678', 'B-12, Shanti Kunj Apartments', 'Andheri West', 'Mumbai', 'Maharashtra', '400053', 'Home', TRUE),
(4, 3, 'Rahul Verma', '+91-9876543210', 'Plot 88, Gomti Nagar Extension', 'Near Shaheed Path', 'Lucknow', 'Uttar Pradesh', '226010', 'Home', TRUE),
(5, 4, 'Ananya Iyer', '+91-9444123456', '34, 4th Main Road, Indiranagar', 'Opp. Metro Station', 'Bengaluru', 'Karnataka', '560038', 'Home', TRUE),
(6, 5, 'Rohan Kapoor', '+91-9711223344', 'House 56, Model Town', 'Near Tagore Garden', 'Delhi', 'Delhi', '110009', 'Home', TRUE);

-- 4. Insert Verified Indian Sellers (with GSTIN & PAN)
INSERT INTO Seller (Seller_ID, Seller_Name, Email, Phone, GSTIN, PAN_Number, Bank_Account_No, Bank_IFSC, City, State, Rating) VALUES
(1, 'TechBazaar Retail India', 'seller@techbazaar.in', '+91-1145678901', '07AAACT1234A1Z5', 'AAACT1234A', '912010045678901', 'UTIB0000045', 'New Delhi', 'Delhi', 4.85),
(2, 'DesiTrends Fashion Hub', 'orders@desitrends.in', '+91-1412345678', '08AABCF4567B1Z2', 'AABCF4567B', '002305001234567', 'HDFC0000023', 'Jaipur', 'Rajasthan', 4.70),
(3, 'SmartGadgets India Ltd', 'contact@smartgadgets.in', '+91-8023456789', '29AABCS8901C1Z8', 'AABCS8901C', '502000123456789', 'ICIC0000011', 'Bengaluru', 'Karnataka', 4.90),
(4, 'Heritage Silk Weavers', 'info@heritagesilk.in', '+91-2612345678', '24AABCH3456D1Z1', 'AABCH3456D', '601201010004567', 'SBIN0000123', 'Surat', 'Gujarat', 4.65);

-- 5. Insert Hierarchical Product Categories
INSERT INTO Category (Category_ID, Category_Name, Parent_Category_ID) VALUES
(1, 'Electronics', NULL),
(2, 'Fashion', NULL),
(3, 'Smartphones & Accessories', 1),
(4, 'Laptops & Computing', 1),
(5, 'Ethnic Wear', 2),
(6, 'Western Wear', 2);

-- 6. Insert Base Products
INSERT INTO Product (Product_ID, Product_Name, Description, Price, Discount_Percent, Stock_Quantity, Brand, Image_URL, Category_ID, Seller_ID) VALUES
(1, 'OnePlus 12 5G (Flowy Emerald)', 'Snapdragon 8 Gen 3, Hasselblad Camera, 5400mAh Battery', 64999.00, 7.50, 45, 'OnePlus', 'https://img.ecommerce.in/p1.jpg', 3, 1),
(2, 'Apple MacBook Air M2', '13.6-inch Liquid Retina Display, 8GB Unified Memory, 256GB SSD', 89900.00, 10.00, 20, 'Apple', 'https://img.ecommerce.in/p2.jpg', 4, 3),
(3, 'Pure Banarasi Silk Saree', 'Handcrafted Zari Woven Traditional Festive Silk Saree with Blouse', 5499.00, 20.00, 35, 'Heritage Silk', 'https://img.ecommerce.in/p3.jpg', 5, 4),
(4, 'Men Cotton Straight Kurta', 'Premium breathable cotton mandarin collar kurta for festivities', 1299.00, 15.00, 80, 'DesiTrends', 'https://img.ecommerce.in/p4.jpg', 5, 2),
(5, 'boAt Airdopes 141 ANC', 'True Wireless Earbuds with Active Noise Cancellation, 42H Playback', 1799.00, 40.00, 150, 'boAt', 'https://img.ecommerce.in/p5.jpg', 3, 1);

-- 7. Insert Specialized Subclass Data
-- Electronics Specialization
INSERT INTO Electronics_Product (Product_ID, Model_Number, Warranty_Months, RAM_Capacity, Storage_Capacity, Power_Consumption) VALUES
(1, 'OP-12-GRN-256', 12, '16 GB', '256 GB', '100W SUPERVOOC'),
(2, 'MLXW3HN/A', 12, '8 GB', '256 GB SSD', '35W Dual USB-C'),
(5, 'AD-141-ANC-BLK', 12, 'N/A', 'N/A', '5W Type-C');

-- Fashion Specialization
INSERT INTO Fashion_Product (Product_ID, Size, Color, Fabric_Material, Gender_Category) VALUES
(3, 'Free Size (5.5m)', 'Royal Green & Gold', '100% Banarasi Katan Silk', 'Women'),
(4, 'L (42)', 'Mustard Yellow', '100% Combed Cotton', 'Men');

-- 8. Insert Coupons
INSERT INTO Coupon (Coupon_ID, Coupon_Code, Description, Discount_Type, Discount_Value, Min_Order_Value, Expiry_Date, Is_Active) VALUES
(1, 'DIWALI2026', 'Flat ₹2000 festival off on Electronics above ₹30,000', 'Flat', 2000.00, 30000.00, '2026-11-30', TRUE),
(2, 'FESTIVE500', 'Flat ₹500 off on festive ethnic wear orders above ₹3,000', 'Flat', 500.00, 3000.00, '2026-12-31', TRUE),
(3, 'WELCOME10', '10% instant discount for new shoppers up to ₹1,000', 'Percentage', 10.00, 1000.00, '2026-12-31', TRUE);

-- 9. Insert User Cart & Wishlist
INSERT INTO Cart (Cart_ID, User_ID, Product_ID, Quantity) VALUES
(1, 2, 4, 1),
(2, 3, 5, 2);

INSERT INTO Wishlist (Wishlist_ID, User_ID, Product_ID) VALUES
(1, 1, 2),
(2, 4, 3);

-- 10. Insert Orders
INSERT INTO Orders (Order_ID, User_ID, Shipping_Address_ID, Order_Date, Order_Status, Total_Amount, Discount_Amount, Final_Amount) VALUES
(1001, 1, 1, '2026-10-20 10:15:00', 'Delivered', 64999.00, 2000.00, 62999.00),
(1002, 2, 3, '2026-10-22 14:30:00', 'Shipped', 5499.00, 500.00, 4999.00),
(1003, 4, 5, '2026-10-24 16:45:00', 'Confirmed', 1299.00, 0.00, 1299.00);

-- 11. Insert Order Coupons Applied
INSERT INTO Order_Coupon (Order_ID, Coupon_ID, Applied_Discount) VALUES
(1001, 1, 2000.00),
(1002, 2, 500.00);

-- 12. Insert Order Items (Weak Entity records)
INSERT INTO Order_Item (Order_Item_ID, Order_ID, Product_ID, Seller_ID, Quantity, Price_Per_Unit, Discount, Subtotal) VALUES
(1, 1001, 1, 1, 1, 64999.00, 2000.00, 62999.00),
(2, 1002, 3, 4, 1, 5499.00, 500.00, 4999.00),
(3, 1003, 4, 2, 1, 1299.00, 0.00, 1299.00);

-- 13. Insert Payment Details
INSERT INTO Payment (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method, Payment_Status, Transaction_Reference) VALUES
(1, 1001, '2026-10-20 10:16:30', 62999.00, 'UPI', 'Success', 'UPI/20261020/AXIS/987654321'),
(2, 1002, '2026-10-22 14:32:10', 4999.00, 'Debit_Card', 'Success', 'TXN_DC_HDFC_88776655'),
(3, 1003, '2026-10-24 16:45:00', 1299.00, 'COD', 'Pending', 'COD_REQ_DEL_1003');

-- 14. Insert Logistics & Delivery Tracking
INSERT INTO Delivery (Delivery_ID, Order_ID, Delivery_Partner, Tracking_Number, Estimated_Delivery, Actual_Delivery, Delivery_Status) VALUES
(1, 1001, 'BlueDart Express', 'BLUEDART-IND-778899', '2026-10-23', '2026-10-23 15:40:00', 'Delivered'),
(2, 1002, 'Delhivery Logistics', 'DELHIVERY-DL-554433', '2026-10-26', NULL, 'In_Transit'),
(3, 1003, 'Shadowfax Express', 'SHADOW-EXP-112233', '2026-10-28', NULL, 'Order_Dispatched');

-- 15. Insert Customer Product Reviews
INSERT INTO Product_Review (Review_ID, Product_ID, User_ID, Rating, Review_Text) VALUES
(1, 1, 1, 5, 'Superb performance and camera clarity! Battery lasts over a day easily.'),
(2, 3, 2, 5, 'Authentic Banarasi weave, rich fabric and stunning green color. Loved it!'),
(3, 5, 3, 4, 'Great sound quality for the price point, battery backup is fantastic.');
