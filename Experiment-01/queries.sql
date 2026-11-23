-- ==============================================================================
-- DBMS Lab – Experiment 1: Design an ER Diagram for an Indian E-Commerce Platform
-- File: queries.sql
-- Description: Relational Relationship Verification Queries based on the ER Model
-- ==============================================================================

USE EcommerceDB;

-- ==============================================================================
-- 1. Customer Order Summary with Shipping Address
-- Demonstrates 1:N relationship: User -> Orders and 1:N User -> Address
-- ==============================================================================
SELECT 
    o.Order_ID,
    u.Full_Name AS Customer_Name,
    u.Email,
    CONCAT(a.Address_Line1, ', ', a.City, ', ', a.State, ' - ', a.Pincode) AS Shipping_Address,
    a.Address_Type,
    o.Order_Date,
    o.Order_Status,
    o.Final_Amount
FROM Orders o
INNER JOIN Users u ON o.User_ID = u.User_ID
INNER JOIN Address a ON o.Shipping_Address_ID = a.Address_ID
ORDER BY o.Order_ID;


-- ==============================================================================
-- 2. Line-Item Level Order Breakdown (Weak Entity Order_Item Traversal)
-- Traverses Order -> Order_Item -> Product -> Seller -> Category
-- ==============================================================================
SELECT 
    oi.Order_ID,
    p.Product_Name,
    c.Category_Name,
    s.Seller_Name,
    s.GSTIN,
    oi.Quantity,
    oi.Price_Per_Unit,
    oi.Discount,
    oi.Subtotal
FROM Order_Item oi
INNER JOIN Product p ON oi.Product_ID = p.Product_ID
INNER JOIN Category c ON p.Category_ID = c.Category_ID
INNER JOIN Seller s ON oi.Seller_ID = s.Seller_ID
ORDER BY oi.Order_ID, oi.Order_Item_ID;


-- ==============================================================================
-- 3. Payment and Coupon Verification (1:1 Payment & M:N Order_Coupon)
-- Validates payment mode (UPI/Card/COD), transaction status, and coupon discount
-- ==============================================================================
SELECT 
    o.Order_ID,
    o.Total_Amount,
    COALESCE(cp.Coupon_Code, 'None') AS Coupon_Applied,
    o.Discount_Amount,
    o.Final_Amount,
    pm.Payment_Method,
    pm.Payment_Status,
    pm.Transaction_Reference
FROM Orders o
LEFT JOIN Payment pm ON o.Order_ID = pm.Order_ID
LEFT JOIN Order_Coupon oc ON o.Order_ID = oc.Order_ID
LEFT JOIN Coupon cp ON oc.Coupon_ID = cp.Coupon_ID
ORDER BY o.Order_ID;


-- ==============================================================================
-- 4. Order Logistics & Delivery Tracking
-- Demonstrates 1:1 Relationship between Order and Delivery Entity
-- ==============================================================================
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


-- ==============================================================================
-- 5. Specialization Hierarchy: Electronics vs Fashion Catalog
-- Retrieves specialized attributes depending on product subclass
-- ==============================================================================
-- A. Electronics Products Specs
SELECT 
    p.Product_ID,
    p.Product_Name,
    p.Brand,
    p.Price,
    e.Model_Number,
    e.RAM_Capacity,
    e.Storage_Capacity,
    e.Warranty_Months
FROM Product p
INNER JOIN Electronics_Product e ON p.Product_ID = e.Product_ID;

-- B. Fashion Products Specs
SELECT 
    p.Product_ID,
    p.Product_Name,
    p.Brand,
    p.Price,
    f.Size,
    f.Color,
    f.Fabric_Material,
    f.Gender_Category
FROM Product p
INNER JOIN Fashion_Product f ON p.Product_ID = f.Product_ID;


-- ==============================================================================
-- 6. Seller Performance & Revenue Aggregation
-- Aggregates orders fulfilled per seller, total gross revenue, and rating
-- ==============================================================================
SELECT 
    s.Seller_ID,
    s.Seller_Name,
    s.City,
    s.Rating,
    COUNT(oi.Order_Item_ID) AS Total_Items_Sold,
    SUM(oi.Subtotal) AS Total_Gross_Revenue
FROM Seller s
LEFT JOIN Order_Item oi ON s.Seller_ID = oi.Seller_ID
GROUP BY s.Seller_ID, s.Seller_Name, s.City, s.Rating
ORDER BY Total_Gross_Revenue DESC;


-- ==============================================================================
-- 7. Product Reviews and Average Rating Metrics
-- Validates customer feedback entity mapped to products
-- ==============================================================================
SELECT 
    p.Product_ID,
    p.Product_Name,
    COUNT(r.Review_ID) AS Total_Reviews,
    ROUND(AVG(r.Rating), 1) AS Average_Rating,
    GROUP_CONCAT(CONCAT(u.Full_Name, ': "', r.Review_Text, '"') SEPARATOR ' | ') AS Customer_Reviews
FROM Product p
LEFT JOIN Product_Review r ON p.Product_ID = r.Product_ID
LEFT JOIN Users u ON r.User_ID = u.User_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Average_Rating DESC;
