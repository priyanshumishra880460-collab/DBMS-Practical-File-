# DBMS Practical File

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

A structured laboratory repository containing practical experiments, relational schema designs, datasets, and SQL query suites for **Database Management Systems (DBMS) Lab**.

---

## 📑 Index of Practical Experiments

| Exp No. | Experiment Title | Folder / Code | Status |
| :---: | :--- | :---: | :---: |
| **01** | **Indian E-Commerce Platform ER Modeling** | [`📁 Experiment-01`](./Experiment-01) | ✅ Completed |
| **02** | **ER Diagram to Relational Schema & Integrity Constraints** | [`📁 Experiment-02`](./Experiment-02) | ✅ Completed |
| **03** | **Employee–Department–Project Schema** | [`📁 Experiment-03`](./Experiment-03) | ✅ Completed |
| **04** | **Advanced SQL Queries & Execution Plans** | [`📁 Experiment-04`](./Experiment-04) | ✅ Completed |
| **05** | **SQL Views, View Updatability & Recursive CTE** | [`📁 Experiment-05`](./Experiment-05) | ✅ Completed |
| **06** | **Stored Procedures, Triggers & Audit Logging** | [`📁 Experiment-06`](./Experiment-06) | ✅ Completed |
| **07** | **Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF)** | [`📁 Experiment-07`](./Experiment-07) | ✅ Completed |
| **08** | **Banking Transactions, Savepoints & Concurrency Control** | [`📁 Experiment-08`](./Experiment-08) | ✅ Completed |
| **09** | **B-Tree Indexing, Composite Indexes & Query Optimization** | [`📁 Experiment-09`](./Experiment-09) | ✅ Completed |
| **10** | **Query Optimization, Indexing Strategies & Query Rewriting** | [`📁 Experiment-10`](./Experiment-10) | ✅ Completed |

---

## 📁 Repository Structure

```tree
DBMS-Practical-File-/
├── README.md                   # Master practical documentation & experiment index
├── .gitignore
├── Experiment-01/              # Experiment 1: Indian E-Commerce Platform ER Modeling
│   ├── schema.sql              # Relational DDL schema with constraints & specializations
│   ├── data.sql                # Realistic Indian e-commerce dataset
│   ├── queries.sql             # Relational queries validating ER relationships
│   ├── er_diagram.mermaid      # Standalone Mermaid ER diagram definition
│   └── complete_experiment1.sql# Unified executable all-in-one script
├── Experiment-02/              # Experiment 2: Relational Schema & Integrity Constraints
│   ├── schema.sql              # 18-Table DDL schema with ON DELETE CASCADE / SET NULL
│   ├── data.sql                # Sample data insertion across all relations
│   ├── integrity_tests.sql     # Referential integrity violations, SET NULL & CASCADE tests
│   └── complete_experiment2.sql# Unified executable all-in-one script
├── Experiment-03/              # Experiment 3: Employee-Department-Project Schema
│   ├── schema.sql              # Database creation and table definitions
│   ├── data.sql                # Dataset insertion (5 depts, 30 employees, 8 projects)
│   ├── queries.sql             # 18 Categorized SQL queries (A to G)
│   └── database_complete.sql   # Unified all-in-one executable script
├── Experiment-04/              # Experiment 4: Advanced SQL Queries & EXPLAIN Plans
│   ├── advanced_queries.sql    # 8 Advanced queries (Joins, Subqueries, Sets)
│   ├── explain_plans.sql       # EXPLAIN execution plan analysis
│   └── complete_experiment4.sql# Unified executable script for Experiment 4
├── Experiment-05/              # Experiment 5: SQL Views & Recursive CTE
│   ├── schema_update.sql       # Hierarchy alteration & manager assignments
│   ├── views_and_updatability.sql # Views creation & updatability tests
│   ├── recursive_cte.sql       # Hierarchical recursive CTE queries
│   └── complete_experiment5.sql# Unified executable script for Experiment 5
├── Experiment-06/              # Experiment 6: Stored Procedures, Triggers & Audit Logging
│   ├── schema_and_data.sql     # Base tables, constraints, audit table & sample records
│   ├── stored_procedures.sql   # transfer_employee procedure with exception handling
│   ├── triggers_and_audit.sql  # Salary validation & automated audit logging triggers
│   └── complete_experiment6.sql# Unified executable script for Experiment 6
├── Experiment-07/              # Experiment 7: Database Normalization (UNF to BCNF)
│   ├── 01_unf_and_1nf.sql      # Denormalized table creation & 1NF conversion
│   ├── 02_2nf_decomposition.sql# 2NF decomposition eliminating partial dependencies
│   ├── 03_3nf_and_bcnf.sql     # 3NF/BCNF decomposition eliminating transitive dependencies
│   ├── 04_verification_lossless_and_fd.sql # Lossless join & dependency preservation tests
│   └── complete_experiment7.sql# Unified executable all-in-one script
├── Experiment-08/              # Experiment 8: Transactions, Savepoints & Concurrency
│   ├── 01_banking_schema_and_commit.sql # Accounts schema & BEGIN/COMMIT transfer
│   ├── 02_rollback_and_savepoint.sql    # Full ROLLBACK & SAVEPOINT partial rollback
│   ├── 03_partial_failure_simulation.sql# Simulated invalid transfer & atomicity rollback
│   ├── 04_isolation_levels_and_concurrency.sql # Isolation levels & 2-session anomaly
│   └── complete_experiment8.sql         # Unified executable all-in-one script
├── Experiment-09/              # Experiment 9: B-Tree Indexing & Query Optimization
│   ├── 01_schema_and_data_generation.sql # 5K records procedural generation
│   ├── 02_single_column_index.sql        # Single-column index & EXPLAIN comparison
│   ├── 03_composite_index.sql            # Composite index & EXPLAIN comparison
│   ├── 04_performance_benchmarking.sql   # Index inspection & benchmark queries
│   └── complete_experiment9.sql          # Unified executable all-in-one script
└── Experiment-10/              # Experiment 10: Query Optimization & Indexing Strategies
    ├── 01_dataset_generation_10k.sql     # 10K records procedural generation
    ├── 02_five_slow_queries_unindexed.sql# 5 slow queries before optimization (EXPLAIN)
    ├── 03_indexing_and_optimized_explain.sql # Single & composite indexes + optimized EXPLAIN
    ├── 04_query_rewriting_sargable.sql   # SARGable query rewriting (Year vs Date range)
    └── complete_experiment10.sql         # Unified executable all-in-one script
```

---

# 🔬 Experiment 1: Design an ER Diagram for an Indian E-Commerce Platform

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-EcommerceDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)
[![Diagram](https://img.shields.io/badge/Diagram-Mermaid_ER-ff69b4?style=for-the-badge&logo=mermaid&logoColor=white)](./Experiment-01/er_diagram.mermaid)

---

## 📌 Aim & Objectives

To design a comprehensive **Entity-Relationship (ER) Diagram** and implement its corresponding relational database schema for an **Indian E-Commerce Platform**, incorporating:
- Core entities: **Customer / User**, **Address**, **Seller** (with GSTIN), **Category**, **Product**, **Order**, **Order_Item**, **Payment**, **Delivery**, **Coupon**, **Cart**, **Wishlist**, and **Product_Review**.
- Key relational modeling concepts:
  - **Primary Keys** and candidate keys
  - **Composite Attributes** (e.g., Address flattened into structured attributes)
  - **Multi-valued Attributes** (e.g., User Phone numbers normalized into a dedicated table)
  - **Weak Entities** (`Order_Item` dependent on `Orders`)
  - **Specialization / Generalization** (Subclassing `Product` into `Electronics_Product` and `Fashion_Product`)
  - **Participation Constraints** (Total/mandatory vs Partial/optional participation)
  - **Self-Referencing Unary Relationship** (Hierarchical categories & subcategories)

---

## 📖 Theory & Core Concepts

An **Entity-Relationship (ER) Model** is a conceptual blueprint used in database engineering to represent the logical structure of an application domain before physical database creation.

### Key ER Components & Notations

1. **Entity:** A distinguishable real-world object or concept represented by a rectangle.
   - *Strong Entity:* Possesses an intrinsic primary key attribute (`Users`, `Seller`, `Product`, `Orders`).
   - *Weak Entity:* Lacks sufficient key attributes and depends existentially on an identifying owner entity via an identifying relationship (`Order_Item` identified through `Orders`).
2. **Attribute:** A descriptive property of an entity represented by an oval.
   - *Key Attribute:* Uniquely identifies an entity occurrence (underlined, e.g., `User_ID`, `Seller_ID`).
   - *Composite Attribute:* Composed of multiple constituent sub-attributes (e.g., Address broken down into `Address_Line1`, `City`, `State`, `Pincode`).
   - *Multi-valued Attribute:* May contain multiple values for a single entity instance (double oval, e.g., customer phone numbers `Phone_Number`).
3. **Relationship:** An association among two or more entities represented by a diamond.
   - *Cardinality Ratios:* 1 : 1 (Order to Payment), 1 : N (User to Orders, Seller to Products), N : M (Users to Products via Cart / Wishlist, Orders to Coupons).
4. **Specialization & Generalization:**
   - Top-down modeling where higher-level general superclass entities are divided into specialized subclasses sharing the superclass identity.
   - Superclass `Product` specializes into `Electronics_Product` (attributes: `Model_Number`, `RAM_Capacity`, `Storage_Capacity`, `Warranty_Months`) and `Fashion_Product` (attributes: `Size`, `Color`, `Fabric_Material`, `Gender_Category`).
5. **Participation Constraints:**
   - *Total (Mandatory) Participation:* Every entity in the set must participate in the relationship (represented by double lines, e.g., an `Orders` entity must have a `Payment` and an assigned `Users`).
   - *Partial (Optional) Participation:* Entities may exist without participating in the relationship (represented by single lines, e.g., a registered `Users` who has never placed an `Orders`).

---

## 🗺️ Entity-Relationship (ER) Diagram

```mermaid
erDiagram
    USERS ||--o{ USER_PHONE : "has (Multi-valued)"
    USERS ||--o{ ADDRESS : "has (1:N)"
    USERS ||--o{ ORDERS : "places (1:N)"
    USERS ||--o{ CART : "adds_to"
    USERS ||--o{ WISHLIST : "saves_to"
    USERS ||--o{ PRODUCT_REVIEW : "writes"

    SELLER ||--o{ PRODUCT : "lists (1:N)"
    CATEGORY ||--o{ CATEGORY : "parent_of (Self-Ref)"
    CATEGORY ||--o{ PRODUCT : "classifies"

    PRODUCT ||--o| ELECTRONICS_PRODUCT : "specializes_to (Subclass)"
    PRODUCT ||--o| FASHION_PRODUCT : "specializes_to (Subclass)"
    PRODUCT ||--o{ ORDER_ITEM : "included_in"
    PRODUCT ||--o{ CART : "held_in"
    PRODUCT ||--o{ WISHLIST : "saved_in"
    PRODUCT ||--o{ PRODUCT_REVIEW : "receives"

    ADDRESS ||--o{ ORDERS : "ships_to"
    ORDERS ||--|{ ORDER_ITEM : "contains (Weak Entity)"
    ORDERS ||--|| PAYMENT : "paid_via (1:1 Mandatory)"
    ORDERS ||--|| DELIVERY : "tracked_via (1:1 Mandatory)"
    ORDERS }o--o{ COUPON : "applied_via ORDER_COUPON"
    SELLER ||--o{ ORDER_ITEM : "fulfills"

    USERS {
        int User_ID PK
        string Full_Name
        string Email UK
        string Password_Hash
        date Date_Of_Birth
        string Gender
    }

    USER_PHONE {
        int User_ID PK,FK
        string Phone_Number PK
        boolean Is_Primary
    }

    ADDRESS {
        int Address_ID PK
        int User_ID FK
        string Full_Name
        string Phone
        string Address_Line1
        string Address_Line2
        string City
        string State
        string Pincode
        string Address_Type
    }

    SELLER {
        int Seller_ID PK
        string Seller_Name
        string Email UK
        string Phone
        string GSTIN UK
        string PAN_Number
        string Bank_Account_No
        string Bank_IFSC
        string City
        string State
        decimal Rating
    }

    CATEGORY {
        int Category_ID PK
        string Category_Name
        int Parent_Category_ID FK
    }

    PRODUCT {
        int Product_ID PK
        string Product_Name
        string Description
        decimal Price
        decimal Discount_Percent
        int Stock_Quantity
        string Brand
        int Category_ID FK
        int Seller_ID FK
    }

    ELECTRONICS_PRODUCT {
        int Product_ID PK,FK
        string Model_Number
        int Warranty_Months
        string RAM_Capacity
        string Storage_Capacity
        string Power_Consumption
    }

    FASHION_PRODUCT {
        int Product_ID PK,FK
        string Size
        string Color
        string Fabric_Material
        string Gender_Category
    }

    ORDERS {
        int Order_ID PK
        int User_ID FK
        int Shipping_Address_ID FK
        timestamp Order_Date
        string Order_Status
        decimal Total_Amount
        decimal Discount_Amount
        decimal Final_Amount
    }

    ORDER_ITEM {
        int Order_Item_ID PK
        int Order_ID PK,FK
        int Product_ID FK
        int Seller_ID FK
        int Quantity
        decimal Price_Per_Unit
        decimal Discount
        decimal Subtotal
    }

    PAYMENT {
        int Payment_ID PK
        int Order_ID UK,FK
        timestamp Payment_Date
        decimal Amount
        string Payment_Method
        string Payment_Status
        string Transaction_Reference
    }

    DELIVERY {
        int Delivery_ID PK
        int Order_ID UK,FK
        string Delivery_Partner
        string Tracking_Number UK
        date Estimated_Delivery
        timestamp Actual_Delivery
        string Delivery_Status
    }

    COUPON {
        int Coupon_ID PK
        string Coupon_Code UK
        string Description
        string Discount_Type
        decimal Discount_Value
        decimal Min_Order_Value
        date Expiry_Date
    }

    PRODUCT_REVIEW {
        int Review_ID PK
        int Product_ID FK
        int User_ID FK
        int Rating
        string Review_Text
        timestamp Review_Date
    }
```

---

## 🗄️ Relational Schema Architecture & Table Specifications

The conceptual ER model maps directly to 15 relational tables in MySQL adhering to Third Normal Form (3NF):

| Relational Table | Primary Key | Foreign Key(s) | Architectural Concept / Purpose |
| :--- | :--- | :--- | :--- |
| **`Users`** | `User_ID` | *None* | Strong customer entity profile and authentication credentials |
| **`User_Phone`** | `(User_ID, Phone_Number)` | `User_ID` → `Users` | First normal form resolution of multi-valued phone numbers |
| **`Address`** | `Address_ID` | `User_ID` → `Users` | Decomposition of composite address attribute (1 : N per user) |
| **`Seller`** | `Seller_ID` | *None* | Indian merchant registry holding statutory GSTIN and bank details |
| **`Category`** | `Category_ID` | `Parent_Category_ID` → `Category` | Self-referencing unary tree for product taxonomy |
| **`Product`** | `Product_ID` | `Category_ID`, `Seller_ID` | General merchandise superclass |
| **`Electronics_Product`** | `Product_ID` | `Product_ID` → `Product` | Specialization subclass with RAM, Storage, and Warranty attributes |
| **`Fashion_Product`** | `Product_ID` | `Product_ID` → `Product` | Specialization subclass with Size, Fabric, and Color attributes |
| **`Orders`** | `Order_ID` | `User_ID`, `Shipping_Address_ID` | Central commercial order record |
| **`Order_Item`** | `(Order_Item_ID, Order_ID)`| `Order_ID`, `Product_ID`, `Seller_ID` | Weak entity identified through composite relation with owner `Orders` |
| **`Payment`** | `Payment_ID` | `Order_ID` → `Orders` (UNIQUE) | 1:1 Mandatory payment transaction tracking |
| **`Delivery`** | `Delivery_ID` | `Order_ID` → `Orders` (UNIQUE) | 1:1 Indian logistics fulfillment tracking (BlueDart, Delhivery) |
| **`Coupon`** | `Coupon_ID` | *None* | Promotional campaign discounts |
| **`Order_Coupon`** | `(Order_ID, Coupon_ID)` | `Order_ID`, `Coupon_ID` | Junction table resolving M:N relationship between Orders and Coupons |
| **`Cart` / `Wishlist`** | `Cart_ID` / `Wishlist_ID`| `User_ID`, `Product_ID` | Junction tables capturing shopping cart and saved merchandise |
| **`Product_Review`** | `Review_ID` | `Product_ID`, `User_ID` | Customer feedback ratings and verified buyer reviews |

---

## 📁 Experiment 1 Files

```tree
Experiment-01/
├── schema.sql              # Relational DDL schema with constraints & specializations
├── data.sql                # Realistic Indian e-commerce dataset
├── queries.sql             # Relational queries validating ER relationships
├── er_diagram.mermaid      # Standalone Mermaid ER diagram definition
└── complete_experiment1.sql# Unified executable all-in-one script
```

---

## 🚀 Getting Started / Execution Guide (Experiment 1)

### Method 1: Using MySQL Command Line Client

1. Open your terminal inside the repository folder.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the unified SQL script:
   ```sql
   SOURCE Experiment-01/complete_experiment1.sql;
   ```
   *Or execute modularly:*
   ```sql
   SOURCE Experiment-01/schema.sql;
   SOURCE Experiment-01/data.sql;
   SOURCE Experiment-01/queries.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your local database server.
2. Open `Experiment-01/complete_experiment1.sql`.
3. Click the ⚡ **Execute (All Queries)** button.
4. Review the created schema, seeded Indian e-commerce datasets, and query verification grids.

---

## 📊 Relational Queries & Verification Output Catalog

### 1. Customer Order Summary with Shipping Address
Validates 1:N relationship from `Users` to `Orders` and composite `Address` dereferencing:

```sql
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
```

**Output:**
```
+----------+---------------+------------------------------------------------------+--------------+---------------------+--------------+--------------+
| Order_ID | Customer_Name | Shipping_Address                                     | Address_Type | Order_Date          | Order_Status | Final_Amount |
+----------+---------------+------------------------------------------------------+--------------+---------------------+--------------+--------------+
|     1001 | Aarav Sharma  | Flat 402, Royal Palms, Noida, Uttar Pradesh - 201301 | Home         | 2026-10-20 10:15:00 | Delivered    |     62999.00 |
|     1002 | Priya Patel   | B-12, Shanti Kunj Apartments, Mumbai, Maharashtra... | Home         | 2026-10-22 14:30:00 | Shipped      |      4999.00 |
|     1003 | Ananya Iyer   | 34, 4th Main Road, Indiranagar, Bengaluru, Karnat... | Home         | 2026-10-24 16:45:00 | Confirmed    |      1299.00 |
+----------+---------------+------------------------------------------------------+--------------+---------------------+--------------+--------------+
```

---

### 2. Line-Item Order Breakdown (Weak Entity `Order_Item` Traversal)
Traverses the multi-table path `Orders` ↔ `Order_Item` ↔ `Product` ↔ `Seller` ↔ `Category`:

```sql
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
```

**Output:**
```
+----------+--------------------------------+---------------------------+-------------------------+-----------------+----------+----------------+----------+
| Order_ID | Product_Name                   | Category_Name             | Seller_Name             | GSTIN           | Quantity | Price_Per_Unit | Subtotal |
+----------+--------------------------------+---------------------------+-------------------------+-----------------+----------+----------------+----------+
|     1001 | OnePlus 12 5G (Flowy Emerald)  | Smartphones & Accessories | TechBazaar Retail India | 07AAACT1234A1Z5 |        1 |       64999.00 | 62999.00 |
|     1002 | Pure Banarasi Silk Saree       | Ethnic Wear               | Heritage Silk Weavers   | 24AABCH3456D1Z1 |        1 |        5499.00 |  4999.00 |
|     1003 | Men Cotton Straight Kurta      | Ethnic Wear               | DesiTrends Fashion Hub  | 08AABCF4567B1Z2 |        1 |        1299.00 |  1299.00 |
+----------+--------------------------------+---------------------------+-------------------------+-----------------+----------+----------------+----------+
```

---

### 3. Payment and Coupon Verification (1:1 Payment & M:N Coupon)
Verifies payment channel (`UPI`, `Debit_Card`, `COD`), transaction status, and promotional savings:

```sql
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
```

**Output:**
```
+----------+--------------+----------------+-----------------+--------------+----------------+----------------+
| Order_ID | Total_Amount | Coupon_Applied | Discount_Amount | Final_Amount | Payment_Method | Payment_Status |
+----------+--------------+----------------+-----------------+--------------+----------------+----------------+
|     1001 |     64999.00 | DIWALI2026     |         2000.00 |     62999.00 | UPI            | Success        |
|     1002 |      5499.00 | FESTIVE500     |          500.00 |      4999.00 | Debit_Card     | Success        |
|     1003 |      1299.00 | None           |            0.00 |      1299.00 | COD            | Pending        |
+----------+--------------+----------------+-----------------+--------------+----------------+----------------+
```

---

### 4. Order Logistics & Delivery Tracking
Verifies Indian logistics fulfillment tracking (`BlueDart Express`, `Delhivery Logistics`, `Shadowfax`):

```sql
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
```

**Output:**
```
+----------+--------------+---------------------+---------------------+------------------+--------------------+---------------------+
| Order_ID | Customer     | Delivery_Partner    | Tracking_Number     | Delivery_Status  | Estimated_Delivery | Actual_Delivery     |
+----------+--------------+---------------------+---------------------+------------------+--------------------+---------------------+
|     1001 | Aarav Sharma | BlueDart Express    | BLUEDART-IND-778899 | Delivered        | 2026-10-23         | 2026-10-23 15:40:00 |
|     1002 | Priya Patel  | Delhivery Logistics | DELHIVERY-DL-554433 | In_Transit       | 2026-10-26         | NULL                |
|     1003 | Ananya Iyer  | Shadowfax Express   | SHADOW-EXP-112233   | Order_Dispatched | 2026-10-28         | NULL                |
+----------+--------------+---------------------+---------------------+------------------+--------------------+---------------------+
```

---

### 5. Product Specialization: Subclass Queries

#### A. Electronics Catalog (`Electronics_Product`)
```sql
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
```

**Output:**
```
+------------+-------------------------------+---------+----------+---------------+--------------+------------------+-----------------+
| Product_ID | Product_Name                  | Brand   | Price    | Model_Number  | RAM_Capacity | Storage_Capacity | Warranty_Months |
+------------+-------------------------------+---------+----------+---------------+--------------+------------------+-----------------+
|          1 | OnePlus 12 5G (Flowy Emerald) | OnePlus | 64999.00 | OP-12-GRN-256 | 16 GB        | 256 GB           |              12 |
|          2 | Apple MacBook Air M2          | Apple   | 89900.00 | MLXW3HN/A     | 8 GB         | 256 GB SSD       |              12 |
|          5 | boAt Airdopes 141 ANC         | boAt    |  1799.00 | AD-141-ANC-BLK| N/A          | N/A              |              12 |
+------------+-------------------------------+---------+----------+---------------+--------------+------------------+-----------------+
```

#### B. Fashion Catalog (`Fashion_Product`)
```sql
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
```

**Output:**
```
+------------+---------------------------+---------------+---------+------------------+--------------------+-------------------------+-----------------+
| Product_ID | Product_Name              | Brand         | Price   | Size             | Color              | Fabric_Material         | Gender_Category |
+------------+---------------------------+---------------+---------+------------------+--------------------+-------------------------+-----------------+
|          3 | Pure Banarasi Silk Saree  | Heritage Silk | 5499.00 | Free Size (5.5m) | Royal Green & Gold | 100% Banarasi Katan Silk| Women           |
|          4 | Men Cotton Straight Kurta | DesiTrends    | 1299.00 | L (42)           | Mustard Yellow     | 100% Combed Cotton      | Men             |
+------------+---------------------------+---------------+---------+------------------+--------------------+-------------------------+-----------------+
```

---

### 6. Seller Performance & Revenue Aggregation
```sql
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
```

**Output:**
```
+-----------+-------------------------+-----------+--------+------------------+---------------------+
| Seller_ID | Seller_Name             | City      | Rating | Total_Items_Sold | Total_Gross_Revenue |
+-----------+-------------------------+-----------+--------+------------------+---------------------+
|         1 | TechBazaar Retail India | New Delhi |   4.85 |                1 |            62999.00 |
|         4 | Heritage Silk Weavers   | Surat     |   4.65 |                1 |             4999.00 |
|         2 | DesiTrends Fashion Hub  | Jaipur    |   4.70 |                1 |             1299.00 |
|         3 | SmartGadgets India Ltd  | Bengaluru |   4.90 |                0 |                NULL |
+-----------+-------------------------+-----------+--------+------------------+---------------------+
```

---

### 7. Product Customer Feedback & Review Metrics
```sql
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
```

**Output:**
```
+------------+-------------------------------+---------------+----------------+---------------------------------------------------------------------------------+
| Product_ID | Product_Name                  | Total_Reviews | Average_Rating | Customer_Reviews                                                                |
+------------+-------------------------------+---------------+----------------+---------------------------------------------------------------------------------+
|          1 | OnePlus 12 5G (Flowy Emerald) |             1 |            5.0 | Aarav Sharma: "Superb performance and camera clarity! Battery lasts over a day" |
|          3 | Pure Banarasi Silk Saree      |             1 |            5.0 | Priya Patel: "Authentic Banarasi weave, rich fabric and stunning green color"   |
|          5 | boAt Airdopes 141 ANC         |             1 |            4.0 | Rahul Verma: "Great sound quality for the price point, battery backup is good"  |
+------------+-------------------------------+---------------+----------------+---------------------------------------------------------------------------------+
```

---

## 💡 Important Design Decisions

- **Weak Entity Modeling:** `Order_Item` cannot exist independently of its parent `Orders`. Its primary key is defined as a composite key `(Order_Item_ID, Order_ID)` enforcing strong existential dependency.
- **Relational Specialization Strategy:** We adopted the **Table-Per-Subclass (TPS)** mapping strategy where common attributes reside in `Product` while specialized attributes reside in `Electronics_Product` and `Fashion_Product`, linked via Foreign Key Primary Keys (`Product_ID`).
- **Indian Statutory Compliance:** Included `GSTIN` (15-character alphanumeric format) and `PAN_Number` in the `Seller` entity along with IFSC banking details, reflecting real-world Indian commercial workflows.
- **Logistics Integration:** The `Delivery` entity captures Indian logistics fulfillment (`BlueDart`, `Delhivery`, `Shadowfax`) with distinct status progressions.

---

## 📈 Experiment 1 Results & Conclusion

The conceptual **Entity-Relationship (ER) Model** for the Indian E-Commerce platform was designed and translated into a Third Normal Form (3NF) relational database schema on MySQL. The design incorporated all foundational ER constructs: strong and weak entities, composite attributes, multi-valued phone attributes, subclass specialization, unary category hierarchies, and participation constraints. The schema was validated using representative datasets, and multi-table queries verified referential integrity across users, sellers, products, orders, payments, logistics, and feedback.

---

# 🔬 Experiment 2: ER Diagram to Relational Schema and Referential Integrity Constraints

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-ECOMMERCE-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To map an **Entity-Relationship (ER) Diagram** of an E-Commerce Platform into a **Normalized Relational Database Schema (18 Tables)** in MySQL, enforce relational integrity constraints (Primary Keys, Foreign Keys, Unique Keys), implement deletion behaviors (**`ON DELETE CASCADE`** and **`ON DELETE SET NULL`**), populate sample datasets, and evaluate:
1. Schema instantiation verified via `SHOW TABLES;`.
2. Referential integrity violation interception (`ERROR 1452` when inserting orphaned foreign keys).
3. Preservation of child rows via `ON DELETE SET NULL` when parent categories are deleted.
4. Automated cascading cleanup via `ON DELETE CASCADE` when parent customers are deleted.

---

## 📖 Theory & Core Concepts

### 1. ER-to-Relational Mapping Rules
- **Strong Entities:** Mapped into independent relations where the entity's key attribute becomes the primary key (`CUSTOMER`, `SELLER`, `PRODUCT`, `ORDERS`, `CATEGORY`, `PAYMENT`, `DELIVERY`).
- **Composite Attributes:** Flattened into individual atomic columns within the base table (`ADDRESS` decomposed into `DoorNo`, `Street`, `Area`, `City`, `State`, `Pincode`).
- **Multi-Valued Attributes:** Normalized into separate child tables comprising the parent entity's primary key and the multi-valued attribute forming a composite primary key (`CUSTOMER_PHONE`, `CUSTOMER_ALT_PHONE`, `SELLER_PHONE`, `ADDRESS_MOBILE`, `PRODUCT_IMAGE`).
- **Weak Entities:** Identified by combining the identifying owner entity's primary key with a partial discriminator attribute (`ORDERITEM` with composite PK `(OrderID, ItemNo)`).
- **Subclass Specialization:** Modeled using Table-Per-Subclass (TPS) where specialized attributes reside in distinct tables (`ELECTRONICS`, `CLOTHING`, `BOOKS`) referencing the base `PRODUCT(ProductID)`.
- **Unary Self-Referencing Hierarchy:** Modeled within the same relation using a foreign key pointing back to its own primary key (`CATEGORY.ParentCategoryID` → `CATEGORY.CategoryID`).
- **1:1 Relationships:** Enforced using unique foreign keys (`PAYMENT.OrderID` and `DELIVERY.OrderID` referencing `ORDERS.OrderID UNIQUE`).
- **M:N Relationships:** Bridge relations holding foreign keys from both related tables (`ORDER_COUPON(OrderID, CouponCode)`).

### 2. Referential Integrity & Referential Actions
Referential integrity dictates that a foreign key value in a child table must reference a valid, existing primary key in the parent table or be `NULL`.
- **`ON DELETE CASCADE`:** When a parent record is removed, MySQL automatically traverses foreign key constraints and deletes all corresponding dependent child rows across all cascading levels.
- **`ON DELETE SET NULL`:** When a referenced parent row is deleted, MySQL updates the child foreign key column to `NULL`, maintaining existence of child records while severing the defunct parent reference (requires the foreign key column to be nullable).
- **Integrity Violation (`ERROR 1452`):** When DML statements attempt to insert or update child records with non-existent foreign keys, MySQL actively halts execution to prevent orphaned records.

---

## 🗄️ Relational Schema Specification (18 Tables)

| Table Name | Primary Key | Foreign Key(s) | Referenced Table & Action |
| :--- | :--- | :--- | :--- |
| **`CUSTOMER`** | `CustomerID` | *None* | Root customer account entity |
| **`CUSTOMER_PHONE`** | `(CustomerID, Phone)` | `CustomerID` | → `CUSTOMER(CustomerID)` `ON DELETE CASCADE` |
| **`CUSTOMER_ALT_PHONE`** | `(CustomerID, AltPhone)` | `CustomerID` | → `CUSTOMER(CustomerID)` `ON DELETE CASCADE` |
| **`SELLER`** | `SellerID` | *None* | Merchant entity with GSTIN and banking details |
| **`SELLER_PHONE`** | `(SellerID, Phone)` | `SellerID` | → `SELLER(SellerID)` `ON DELETE CASCADE` |
| **`CATEGORY`** | `CategoryID` | `ParentCategoryID` | → `CATEGORY(CategoryID)` `ON DELETE SET NULL` |
| **`PRODUCT`** | `ProductID` | `SellerID`<br>`CategoryID` | → `SELLER(SellerID)` `ON DELETE CASCADE`<br>→ `CATEGORY(CategoryID)` `ON DELETE SET NULL` |
| **`PRODUCT_IMAGE`** | `(ProductID, Image)` | `ProductID` | → `PRODUCT(ProductID)` `ON DELETE CASCADE` |
| **`ELECTRONICS`** | `ProductID` | `ProductID` | → `PRODUCT(ProductID)` `ON DELETE CASCADE` |
| **`CLOTHING`** | `ProductID` | `ProductID` | → `PRODUCT(ProductID)` `ON DELETE CASCADE` |
| **`BOOKS`** | `ProductID` | `ProductID` | → `PRODUCT(ProductID)` `ON DELETE CASCADE` |
| **`ADDRESS`** | `AddressID` | `CustomerID` | → `CUSTOMER(CustomerID)` `ON DELETE CASCADE` |
| **`ADDRESS_MOBILE`** | `(AddressID, MobileNo)` | `AddressID` | → `ADDRESS(AddressID)` `ON DELETE CASCADE` |
| **`ORDERS`** | `OrderID` | `CustomerID`<br>`AddressID` | → `CUSTOMER(CustomerID)` `ON DELETE CASCADE`<br>→ `ADDRESS(AddressID)` `ON DELETE SET NULL` |
| **`ORDER_COUPON`** | `(OrderID, CouponCode)` | `OrderID` | → `ORDERS(OrderID)` `ON DELETE CASCADE` |
| **`ORDERITEM`** | `(OrderID, ItemNo)` | `OrderID`<br>`ProductID` | → `ORDERS(OrderID)` `ON DELETE CASCADE`<br>→ `PRODUCT(ProductID)` `ON DELETE CASCADE` |
| **`PAYMENT`** | `PaymentID` | `OrderID` | → `ORDERS(OrderID)` `ON DELETE CASCADE` |
| **`DELIVERY`** | `DeliveryID` | `OrderID`<br>`AddressID` | → `ORDERS(OrderID)` `ON DELETE CASCADE`<br>→ `ADDRESS(AddressID)` `ON DELETE CASCADE` |

---

## 📁 Experiment 2 Files

```tree
Experiment-02/
├── schema.sql              # 18-Table DDL schema with ON DELETE CASCADE / SET NULL
├── data.sql                # Sample data insertion across all relations
├── integrity_tests.sql     # Referential integrity violations, SET NULL & CASCADE tests
└── complete_experiment2.sql# Unified executable all-in-one script
```

---

## 🚀 Getting Started / Execution Guide (Experiment 2)

### Method 1: Using MySQL Command Line Client

1. Open your terminal inside the repository folder.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the unified SQL script:
   ```sql
   SOURCE Experiment-02/complete_experiment2.sql;
   ```
   *Or run modularly:*
   ```sql
   SOURCE Experiment-02/schema.sql;
   SOURCE Experiment-02/data.sql;
   SOURCE Experiment-02/integrity_tests.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your database instance.
2. Open `Experiment-02/complete_experiment2.sql`.
3. Click the ⚡ **Execute (All Queries)** button.
4. View the table inventory, seeded data grids, and integrity verification outputs.

---

## 📊 Output Catalog & Integrity Demonstrations

### OUTPUT 1: Schema Verification (`SHOW TABLES;`)

Verifies that all 18 normalized relational tables are successfully registered in the database catalog:

```sql
SHOW TABLES;
```

**Output:**
```
+-----------------------+
| Tables_in_ecommerce   |
+-----------------------+
| ADDRESS               |
| ADDRESS_MOBILE        |
| BOOKS                 |
| CATEGORY              |
| CLOTHING              |
| CUSTOMER              |
| CUSTOMER_ALT_PHONE    |
| CUSTOMER_PHONE        |
| DELIVERY              |
| ELECTRONICS           |
| ORDERS                |
| ORDERITEM             |
| ORDER_COUPON          |
| PAYMENT               |
| PRODUCT               |
| PRODUCT_IMAGE         |
| SELLER                |
| SELLER_PHONE          |
+-----------------------+
18 rows in set
```
*Conclusion: Proves complete relational schema instantiation.*

---

### OUTPUT 2: Sample Data Verification

#### Customer Table:
```sql
SELECT * FROM CUSTOMER;
```
**Output:**
```
+------------+-----------+---------------------------------+----------+---------------+
| CustomerID | Name      | Email                           | Password | DateOfBirth   |
+------------+-----------+---------------------------------+----------+---------------+
|          1 | Priyanshu | priyanshumishra880460@gmail.com | pass123  | 2007-01-20    |
+------------+-----------+---------------------------------+----------+---------------+
```

#### Product Table:
```sql
SELECT * FROM PRODUCT;
```
**Output:**
```
+-----------+-------------+---------------+----------+----------+--------+----------+------------+
| ProductID | ProductName | Description   | Price    | StockQty | Weight | SellerID | CategoryID |
+-----------+-------------+---------------+----------+----------+--------+----------+------------+
|       301 | Laptop      | Gaming Laptop | 75000.00 |       10 |   2.50 |      101 |        201 |
+-----------+-------------+---------------+----------+----------+--------+----------+------------+
```

#### Orders Table:
```sql
SELECT * FROM ORDERS;
```
**Output:**
```
+---------+------------+-------------+-------------+------------+-----------+
| OrderID | OrderDate  | OrderStatus | TotalAmount | CustomerID | AddressID |
+---------+------------+-------------+-------------+------------+-----------+
|     501 | 2026-08-14 | Placed      |    75000.00 |          1 |       401 |
+---------+------------+-------------+-------------+------------+-----------+
```
*Conclusion: Proves successful sample data insertion across parent and child relations.*

---

### OUTPUT 3: Referential Integrity Violation Demonstration

Attempting to insert a child order record referencing a non-existent parent `CustomerID = 999`:

```sql
INSERT INTO ORDERS VALUES (502, '2026-08-14', 'Placed', 50000.00, 999, 401);
```

**Output / Error:**
```
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ecommerce`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE)
```
- **Reason:** `CustomerID = 999` does not exist in the parent `CUSTOMER` table.
- **Result:** Successfully satisfies *"demonstrate referential integrity violations"*.

---

### OUTPUT 4: `ON DELETE SET NULL` Demonstration

Validating that deleting a referenced parent record preserves the child tuple while nullifying its foreign key link.

#### Step A: Inspect state before deletion
```sql
SELECT ProductID, ProductName, CategoryID FROM PRODUCT;
```
**Output:**
```
+-----------+-------------+------------+
| ProductID | ProductName | CategoryID |
+-----------+-------------+------------+
|       301 | Laptop      |        201 |
+-----------+-------------+------------+
```

#### Step B: Delete parent category record
```sql
DELETE FROM CATEGORY WHERE CategoryID = 201;
```

#### Step C: Inspect state after deletion
```sql
SELECT ProductID, ProductName, CategoryID FROM PRODUCT;
```
**Output:**
```
+-----------+-------------+------------+
| ProductID | ProductName | CategoryID |
+-----------+-------------+------------+
|       301 | Laptop      |       NULL |
+-----------+-------------+------------+
```
*Conclusion: `ON DELETE SET NULL` demonstrated successfully — the product remains in the catalog without being purged, and its `CategoryID` gracefully defaults to `NULL`.*

---

### OUTPUT 5: `ON DELETE CASCADE` Demonstration

Validating that deleting a parent record triggers an automated cascade that cleans up all dependent child tuples.

#### Step A: Inspect orders before deleting customer
```sql
SELECT * FROM ORDERS;
```
**Output:**
```
+---------+------------+-------------+-------------+------------+-----------+
| OrderID | OrderDate  | OrderStatus | TotalAmount | CustomerID | AddressID |
+---------+------------+-------------+-------------+------------+-----------+
|     501 | 2026-08-14 | Placed      |    75000.00 |          1 |       401 |
+---------+------------+-------------+-------------+------------+-----------+
```

#### Step B: Delete parent customer record
```sql
DELETE FROM CUSTOMER WHERE CustomerID = 1;
```
**Output:**
```
Query OK, 1 row affected
```

#### Step C: Verify automated cascading deletion in Orders
```sql
SELECT * FROM ORDERS;
```
**Output:**
```
Empty set
```

#### Step D: Verify cascading deletion in child phone records
```sql
SELECT * FROM CUSTOMER_PHONE;
```
**Output:**
```
Empty set
```
*Conclusion: This demonstrates that deleting the parent customer automatically deleted all related child records across `ORDERS`, `CUSTOMER_PHONE`, and downstream dependencies. `ON DELETE CASCADE` demonstrated successfully.*

---

## 💡 Important Observations

- **18 Normalized Relational Tables:** Eliminates redundancy and update anomalies by decomposing entities into Third Normal Form (3NF).
- **Multi-Valued Phone Normalization:** Separating `CUSTOMER_PHONE`, `CUSTOMER_ALT_PHONE`, `SELLER_PHONE`, and `ADDRESS_MOBILE` avoids repeating groups and conforms to First Normal Form (1NF).
- **Preservation vs Propagation:**
  - `ON DELETE SET NULL` is ideal when child entities should survive parent deletion (e.g. Products should not be destroyed if their category classification is removed).
  - `ON DELETE CASCADE` is essential for life-cycle dependent relations (e.g. Deleting a user account must delete their private contact numbers, orders, and addresses).
- **Defensive Integrity:** Foreign key checks actively prevent corrupt or orphaned records from being committed to the database storage engine.

---

## 📈 Experiment 2 Results & Conclusion

The conceptual E-Commerce ER Diagram was successfully translated into an 18-table normalized relational schema on MySQL. Foreign key constraints were established with `ON DELETE CASCADE` and `ON DELETE SET NULL` referential actions. Referential integrity was rigorously verified: insertion of non-existent parent foreign keys was blocked with `ERROR 1452`, deleting parent category records set dependent foreign keys to `NULL`, and deleting parent customer records cascaded clean removals across all dependent tables (`ORDERS`, `CUSTOMER_PHONE`).

---

# 🔬 Experiment 3: Employee–Department–Project Schema

A complete relational database implementation and SQL query suite based on the **Employee–Department–Project** schema. This module contains end-to-end SQL scripts covering database design, relational integrity constraints (Primary Keys & Foreign Keys), multi-table insertions, and advanced SQL querying.

---

## 📌 Aim & Objectives

To design and implement an **Employee–Department–Project** database schema, populate it with:
- **5 Departments**
- **30 Employees**
- **8 Projects**
- **30 Employee-Project assignments**

and execute SQL queries demonstrating:
- **Selection** & **Projection**
- **Aggregate Functions** (`AVG`, `MAX`, `MIN`, `SUM`, `COUNT`)
- **Grouping & Filtering** (`GROUP BY`, `HAVING`)
- **Conditional Logic** (`CASE` expressions)
- **Sorting** (`ORDER BY`)

---

## 🛠️ Software / System Requirements

- **Database Server:** MySQL 8.0+ / MariaDB / SQL Database Server
- **Client Tools:** MySQL Workbench, phpMyAdmin, or MySQL CLI
- **Operating System:** Windows / Linux / macOS

---

## 🗄️ Database Design & Schema Architecture

The database `CompanyDB` models organizational entities and their operational assignments using four relational tables:

```
+------------------+         1 : N         +-------------------+
|    Department    | <-------------------- |     Employee      |
+------------------+                       +-------------------+
        ^                                            ^
        | 1 : N                                      | 1 : N
        |                                            |
+------------------+         N : M         +-------------------+
|     Project      | <-------------------- | Employee_Project  |
+------------------+                       +-------------------+
```

### Table Specifications

| Table | Primary Key | Foreign Key(s) | Description |
| :--- | :--- | :--- | :--- |
| **`Department`** | `Dept_ID` | *None* | Stores department metadata and regional offices |
| **`Employee`** | `Emp_ID` | `Dept_ID` → `Department(Dept_ID)` | Stores employee personal profiles, titles, and salaries |
| **`Project`** | `Project_ID` | `Dept_ID` → `Department(Dept_ID)` | Stores project portfolio and allocated budget |
| **`Employee_Project`**| `(Emp_ID, Project_ID)` | `Emp_ID` → `Employee(Emp_ID)`<br>`Project_ID` → `Project(Project_ID)` | Junction table mapping many-to-many employee hours on projects |

---

## 🚀 Getting Started / Execution Guide (Experiment 3)

### Method 1: Using MySQL Command Line Client

1. Open your terminal or command prompt inside the repository folder.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the unified SQL script:
   ```sql
   SOURCE Experiment-03/database_complete.sql;
   ```
   *Or run modularly:*
   ```sql
   SOURCE Experiment-03/schema.sql;
   SOURCE Experiment-03/data.sql;
   SOURCE Experiment-03/queries.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your local instance.
2. Go to **File -> Open SQL Script...** and select `database_complete.sql`.
3. Click the ⚡ **Execute (All Queries)** button.
4. View query result grids in the bottom panel.

---

## 📊 SQL Queries & Expected Output Catalog

### A. Selection
Retrieves rows that satisfy a specified predicate condition.

#### Query 1: Employees earning more than ₹90,000
```sql
SELECT *
FROM Employee
WHERE Salary > 90000;
```
**Output:**
```
+--------+---------------+--------------------+-----------+------------+---------+
| Emp_ID | Emp_Name      | Job_Title          | Salary    | Hire_Date  | Dept_ID |
+--------+---------------+--------------------+-----------+------------+---------+
|    102 | Priya Verma   | ML Engineer        |  92000.00 | 2021-06-20 |       1 |
|    104 | Ananya Singh  | Research Engineer  | 105000.00 | 2020-08-12 |       1 |
|    110 | Simran Kaur   | Full Stack Develop |  95000.00 | 2020-11-10 |       2 |
|    115 | Yash Thakur   | Security Consultan |  98000.00 | 2020-06-13 |       3 |
|    118 | Tanvi Shah    | Ethical Hacker     |  91000.00 | 2021-03-22 |       3 |
|    119 | Akash Singh   | Data Scientist     | 100000.00 | 2020-09-15 |       4 |
|    121 | Mohit Agarwal | Data Scientist     |  95000.00 | 2021-11-18 |       4 |
+--------+---------------+--------------------+-----------+------------+---------+
```

#### Query 2: Employees belonging to Department 1 (AI)
```sql
SELECT *
FROM Employee
WHERE Dept_ID = 1;
```
**Output:**
```
+--------+--------------+-------------------+-----------+------------+---------+
| Emp_ID | Emp_Name     | Job_Title         | Salary    | Hire_Date  | Dept_ID |
+--------+--------------+-------------------+-----------+------------+---------+
|    101 | Aarav Sharma | AI Engineer       |  85000.00 | 2022-01-15 |       1 |
|    102 | Priya Verma  | ML Engineer       |  92000.00 | 2021-06-20 |       1 |
|    103 | Rohan Gupta  | AI Developer      |  78000.00 | 2023-03-10 |       1 |
|    104 | Ananya Singh | Research Engineer | 105000.00 | 2020-08-12 |       1 |
|    105 | Karan Mehta  | ML Engineer       |  88000.00 | 2022-11-05 |       1 |
|    106 | Neha Kapoor  | AI Analyst        |  72000.00 | 2024-01-18 |       1 |
+--------+--------------+-------------------+-----------+------------+---------+
```

---

### B. Projection
Retrieves specific designated columns from a table.

#### Query 3: Display employee names and salaries
```sql
SELECT Emp_Name, Salary
FROM Employee;
```

#### Query 4: Display employee names and job titles
```sql
SELECT Emp_Name, Job_Title
FROM Employee;
```

---

### C. Aggregate Functions
Performs statistical calculations over multiple records.

#### Query 5: Average salary
```sql
SELECT AVG(Salary) AS Average_Salary
FROM Employee;
```
**Output:** `80333.333333`

#### Query 6: Highest salary
```sql
SELECT MAX(Salary) AS Highest_Salary
FROM Employee;
```
**Output:** `105000.00`

#### Query 7: Lowest salary
```sql
SELECT MIN(Salary) AS Lowest_Salary
FROM Employee;
```
**Output:** `58000.00`

#### Query 8: Total salary expenditure
```sql
SELECT SUM(Salary) AS Total_Salary
FROM Employee;
```
**Output:** `2410000.00`

#### Query 9: Total number of employees
```sql
SELECT COUNT(*) AS Total_Employees
FROM Employee;
```
**Output:** `30`

---

### D. GROUP BY
Groups rows sharing identical values into summary rows.

#### Query 10: Count employees in each department
```sql
SELECT d.Dept_Name, COUNT(e.Emp_ID) AS Employee_Count
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;
```
**Output:**
```
+-------------------------+----------------+
| Dept_Name               | Employee_Count |
+-------------------------+----------------+
| Artificial Intelligence |              6 |
| Software Development    |              6 |
| Cyber Security          |              6 |
| Data Science            |              6 |
| Human Resources         |              6 |
+-------------------------+----------------+
```

#### Query 11: Average salary of each department
```sql
SELECT d.Dept_Name, AVG(e.Salary) AS Average_Salary
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;
```
**Output:**
```
+-------------------------+----------------+
| Dept_Name               | Average_Salary |
+-------------------------+----------------+
| Artificial Intelligence |   86666.666667 |
| Software Development    |   77500.000000 |
| Cyber Security          |   86000.000000 |
| Data Science            |   84333.333333 |
| Human Resources         |   67166.666667 |
+-------------------------+----------------+
```

---

### E. HAVING
Filters aggregated grouped records post-grouping.

#### Query 12: Departments having more than 5 employees
```sql
SELECT Dept_ID, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_ID
HAVING COUNT(*) > 5;
```

#### Query 13: Departments with average salary above ₹80,000
```sql
SELECT d.Dept_Name, AVG(e.Salary) AS Average_Salary
FROM Department d
JOIN Employee e ON d.Dept_ID = e.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING AVG(e.Salary) > 80000;
```
**Output:**
```
+-------------------------+----------------+
| Dept_Name               | Average_Salary |
+-------------------------+----------------+
| Artificial Intelligence |   86666.666667 |
| Cyber Security          |   86000.000000 |
| Data Science            |   84333.333333 |
+-------------------------+----------------+
```

---

### F. CASE Expression
Conditional branching within SQL query projections.

#### Query 14: Categorize employees by salary level
```sql
SELECT Emp_Name,
       Salary,
       CASE
           WHEN Salary >= 90000 THEN 'High Salary'
           WHEN Salary >= 70000 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS Salary_Category
FROM Employee;
```

#### Query 15: Categorize employees by department name
```sql
SELECT Emp_Name,
       Dept_ID,
       CASE
           WHEN Dept_ID = 1 THEN 'AI'
           WHEN Dept_ID = 2 THEN 'Software'
           WHEN Dept_ID = 3 THEN 'Cyber Security'
           WHEN Dept_ID = 4 THEN 'Data Science'
           WHEN Dept_ID = 5 THEN 'HR'
           ELSE 'Other'
       END AS Department_Name
FROM Employee;
```

---

### G. ORDER BY
Sorts the output rows in ascending or descending sequence.

#### Query 16: Employees ordered by salary ascending
```sql
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary ASC;
```

#### Query 17: Employees ordered by salary descending
```sql
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;
```

#### Query 18: Employees ordered by department (ASC) and salary (DESC)
```sql
SELECT Emp_Name, Dept_ID, Salary
FROM Employee
ORDER BY Dept_ID ASC, Salary DESC;
```

---

## 📈 Experiment 3 Results & Conclusion

The **Employee–Department–Project** database schema was successfully modeled, populated, and evaluated. All primary key and foreign key constraints preserved referential integrity across the 30 employees, 5 departments, and 8 projects. All 18 queries demonstrating Selection, Projection, Aggregation (`AVG`, `MAX`, `MIN`, `SUM`, `COUNT`), `GROUP BY`, `HAVING`, `CASE` conditional logic, and `ORDER BY` executed accurately with valid results.

---

# 🔬 Experiment 4: Advanced SQL Queries and Execution Plans

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To perform advanced SQL queries on the **Employee–Department–Project** database (`CompanyDB`) using:
- **INNER JOIN**, **LEFT JOIN**, and **SELF JOIN**
- **Multi-Table / 4-Way Joins** via junction bridge tables
- **Correlated Subqueries**
- **EXISTS** conditional tests
- **Simulated Set Operations** (`INTERSECT` and `EXCEPT`)
- Query performance evaluation and execution plan analysis using **`EXPLAIN`**

---

## 📖 Theory & Core Concepts

1. **INNER JOIN:** Returns only records having matching values in both joined tables.
2. **LEFT JOIN:** Preserves all rows from the left table, returning `NULL` for unmatched right-table columns.
3. **SELF JOIN:** Joins a table to itself to compare records within the same dataset (e.g. finding departmental peers while using inequality `e1.Emp_ID < e2.Emp_ID` to prevent duplicate reciprocal pairs).
4. **Multi-Table Joins:** Connects multiple entities across a many-to-many junction (`Employee` ↔ `Employee_Project` ↔ `Project` + `Department`).
5. **Correlated Subqueries:** Subqueries that reference columns from the outer query, evaluated dynamically row-by-row.
6. **EXISTS Operator:** Boolean test that evaluates to `TRUE` as soon as at least one matching row is found in the subquery (enabling early exit short-circuiting).
7. **Simulated Set Operations:**
   - **INTERSECT:** Simulated via an `INNER JOIN` between two filtered derived subqueries.
   - **EXCEPT / MINUS:** Simulated via `NOT EXISTS` to exclude rows belonging to an unwanted subset.
8. **EXPLAIN Execution Plan:** Displays the MySQL Optimizer's chosen physical query plan, including scan types (`ALL`, `ref`, `eq_ref`), evaluated keys/indexes, row estimations, and optimizer notes.

---

## 📁 Experiment 4 Files

```tree
Experiment-04/
├── advanced_queries.sql    # 8 Advanced SQL queries (Joins, Subqueries, Sets)
├── explain_plans.sql       # 4 Query execution plan analysis scripts
└── complete_experiment4.sql# Unified script running all queries and EXPLAIN statements
```

---

## 🚀 Getting Started / Execution Guide (Experiment 4)

Make sure the `CompanyDB` database from Experiment 3 is already created and populated.

```sql
USE CompanyDB;
SOURCE Experiment-04/complete_experiment4.sql;
```

*Or execute components individually:*
```sql
SOURCE Experiment-04/advanced_queries.sql;
SOURCE Experiment-04/explain_plans.sql;
```

---

## 📊 Advanced SQL Queries & Output Catalog

### 1. INNER JOIN
Display employees along with the departments to which they belong. Returns only matching rows.

```sql
SELECT e.Emp_ID,
       e.Emp_Name, 
       e.Job_Title, 
       d.Dept_Name
FROM Employee e
INNER JOIN Department d 
ON e.Dept_ID = d.Dept_ID;
```

**Output:**
```
+--------+---------------+------------------------+-------------------------+
| Emp_ID | Emp_Name      | Job_Title              | Dept_Name               |
+--------+---------------+------------------------+-------------------------+
|    101 | Aarav Sharma  | AI Engineer            | Artificial Intelligence |
|    102 | Priya Verma   | ML Engineer            | Artificial Intelligence |
|    103 | Rohan Gupta   | AI Developer           | Artificial Intelligence |
|    104 | Ananya Singh  | Research Engineer      | Artificial Intelligence |
|    105 | Karan Mehta   | ML Engineer            | Artificial Intelligence |
|    106 | Neha Kapoor   | AI Analyst             | Artificial Intelligence |
|    107 | Rahul Kumar   | Software Engineer      | Software Development    |
|    108 | Sneha Patel   | Backend Developer      | Software Development    |
|    109 | Aditya Jain   | Frontend Developer     | Software Development    |
|    110 | Simran Kaur   | Full Stack Developer   | Software Development    |
|    111 | Vivek Mishra  | Software Engineer      | Software Development    |
|    112 | Ishita Rao    | QA Engineer            | Software Development    |
|    113 | Arjun Malhotra| Security Engineer      | Cyber Security          |
|    114 | Megha Joshi   | Cyber Security Analyst | Cyber Security          |
|    115 | Yash Thakur   | Security Consultant    | Cyber Security          |
|    116 | Pooja Nair    | SOC Analyst            | Cyber Security          |
+--------+---------------+------------------------+-------------------------+
```

---

### 2. LEFT JOIN
Display all departments and their employees, including departments with no matching employee.

```sql
SELECT d.Dept_ID,
       d.Dept_Name, 
       e.Emp_Name
FROM Department d 
LEFT JOIN Employee e
ON d.Dept_ID = e.Dept_ID;
```

**Output:**
```
+---------+-------------------------+---------------+
| Dept_ID | Dept_Name               | Emp_Name      |
+---------+-------------------------+---------------+
|       1 | Artificial Intelligence | Aarav Sharma  |
|       1 | Artificial Intelligence | Priya Verma   |
|       1 | Artificial Intelligence | Rohan Gupta   |
|       1 | Artificial Intelligence | Ananya Singh  |
|       1 | Artificial Intelligence | Karan Mehta   |
|       1 | Artificial Intelligence | Neha Kapoor   |
|       2 | Software Development    | Rahul Kumar   |
|       2 | Software Development    | Sneha Patel   |
|       2 | Software Development    | Aditya Jain   |
|       2 | Software Development    | Simran Kaur   |
|       2 | Software Development    | Vivek Mishra  |
|       2 | Software Development    | Ishita Rao    |
|       3 | Cyber Security          | Arjun Malhotra|
|       3 | Cyber Security          | Megha Joshi   |
|       3 | Cyber Security          | Yash Thakur   |
|       3 | Cyber Security          | Pooja Nair    |
+---------+-------------------------+---------------+
```

---

### 3. SELF JOIN
Find pairs of employees who work in the same department. Inequality `e1.Emp_ID < e2.Emp_ID` prevents duplicate pairs.

```sql
SELECT e1.Emp_Name AS Employee_1, 
       e2.Emp_Name AS Employee_2, 
       e1.Dept_ID
FROM Employee e1 
INNER JOIN Employee e2
ON e1.Dept_ID = e2.Dept_ID 
AND e1.Emp_ID < e2.Emp_ID;
```

**Output:**
```
+---------------+---------------+---------+
| Employee_1    | Employee_2    | Dept_ID |
+---------------+---------------+---------+
| Aarav Sharma  | Priya Verma   |       1 |
| Aarav Sharma  | Rohan Gupta   |       1 |
| Aarav Sharma  | Ananya Singh  |       1 |
| Aarav Sharma  | Karan Mehta   |       1 |
| Aarav Sharma  | Neha Kapoor   |       1 |
| Priya Verma   | Rohan Gupta   |       1 |
| Priya Verma   | Ananya Singh  |       1 |
| Priya Verma   | Karan Mehta   |       1 |
| Priya Verma   | Neha Kapoor   |       1 |
| Rohan Gupta   | Ananya Singh  |       1 |
| Rohan Gupta   | Karan Mehta   |       1 |
| Rohan Gupta   | Neha Kapoor   |       1 |
| Ananya Singh  | Karan Mehta   |       1 |
| Ananya Singh  | Neha Kapoor   |       1 |
| Karan Mehta   | Neha Kapoor   |       1 |
| Rahul Kumar   | Sneha Patel   |       2 |
+---------------+---------------+---------+
```

---

### 4. Multi-Table / 4-Way Join
Display employee name, department name, and project name by traversing the bridge table `Employee_Project`.

```sql
SELECT e.Emp_Name,
       d.Dept_Name, 
       p.Project_Name
FROM Employee e
INNER JOIN Department d 
ON e.Dept_ID = d.Dept_ID
INNER JOIN Employee_Project ep 
ON e.Emp_ID = ep.Emp_ID
INNER JOIN Project p
ON ep.Project_ID = p.Project_ID;
```

**Output:**
```
+---------------+-------------------------+----------------------------+
| Emp_Name      | Dept_Name               | Project_Name               |
+---------------+-------------------------+----------------------------+
| Aarav Sharma  | Artificial Intelligence | AI Recommendation System   |
| Priya Verma   | Artificial Intelligence | AI Recommendation System   |
| Ananya Singh  | Artificial Intelligence | AI Recommendation System   |
| Rohan Gupta   | Artificial Intelligence | Computer Vision Platform   |
| Karan Mehta   | Artificial Intelligence | Computer Vision Platform   |
| Neha Kapoor   | Artificial Intelligence | Computer Vision Platform   |
| Rahul Kumar   | Software Development    | E-Commerce Platform        |
| Sneha Patel   | Software Development    | E-Commerce Platform        |
| Simran Kaur   | Software Development    | E-Commerce Platform        |
| Aditya Jain   | Software Development    | Mobile Banking Application |
| Vivek Mishra  | Software Development    | Mobile Banking Application |
| Ishita Rao    | Software Development    | Mobile Banking Application |
| Arjun Malhotra| Cyber Security          | Cyber Threat Detection     |
| Megha Joshi   | Cyber Security          | Cyber Threat Detection     |
| Dev Patel     | Cyber Security          | Cyber Threat Detection     |
| Yash Thakur   | Cyber Security          | Security Monitoring System |
| Pooja Nair    | Cyber Security          | Security Monitoring System |
+---------------+-------------------------+----------------------------+
```

---

### 5. Correlated Subquery
Find employees whose salary is greater than the average salary of their own department.

```sql
SELECT e.Emp_ID,
       e.Emp_Name, 
       e.Salary, 
       e.Dept_ID
FROM Employee e 
WHERE e.Salary > (
    SELECT AVG(e2.Salary) 
    FROM Employee e2
    WHERE e2.Dept_ID = e.Dept_ID
);
```

**Output:**
```
+--------+---------------+-----------+---------+
| Emp_ID | Emp_Name      |    Salary | Dept_ID |
+--------+---------------+-----------+---------+
|    102 | Priya Verma   |  92000.00 |       1 |
|    104 | Ananya Singh  | 105000.00 |       1 |
|    105 | Karan Mehta   |  88000.00 |       1 |
|    108 | Sneha Patel   |  82000.00 |       2 |
|    110 | Simran Kaur   |  95000.00 |       2 |
|    111 | Vivek Mishra  |  78000.00 |       2 |
|    113 | Arjun Malhotra|  90000.00 |       3 |
|    115 | Yash Thakur   |  98000.00 |       3 |
|    117 | Dev Patel     |  87000.00 |       3 |
|    118 | Tanvi Shah    |  91000.00 |       3 |
|    119 | Akash Singh   | 100000.00 |       4 |
|    121 | Mohit Agarwal |  95000.00 |       4 |
|    123 | Nikhil Bansal |  89000.00 |       4 |
|    125 | Manish Verma  |  85000.00 |       5 |
|    129 | Varun Gupta   |  73000.00 |       5 |
+--------+---------------+-----------+---------+
```

---

### 6. EXISTS
Find departments that have at least one employee earning more than ₹100,000.

```sql
SELECT d.Dept_ID,
       d.Dept_Name
FROM Department d 
WHERE EXISTS (
    SELECT 1
    FROM Employee e
    WHERE e.Dept_ID = d.Dept_ID 
    AND e.Salary > 100000
);
```

**Output:**
```
+---------+-------------------------+
| Dept_ID | Dept_Name               |
+---------+-------------------------+
|       1 | Artificial Intelligence |
+---------+-------------------------+
```

---

### 7. Simulated INTERSECT
Find employees who earn more than ₹80,000 AND belong to either the AI or Data Science department.

```sql
SELECT a.Emp_ID,
       a.Emp_Name
FROM 
(
    SELECT Emp_ID, Emp_Name 
    FROM Employee
    WHERE Salary > 80000
) a
INNER JOIN 
(
    SELECT Emp_ID, Emp_Name 
    FROM Employee
    WHERE Dept_ID IN (1, 4)
) b
ON a.Emp_ID = b.Emp_ID;
```

**Output:**
```
+--------+---------------+
| Emp_ID | Emp_Name      |
+--------+---------------+
|    101 | Aarav Sharma  |
|    102 | Priya Verma   |
|    104 | Ananya Singh  |
|    105 | Karan Mehta   |
|    119 | Akash Singh   |
|    121 | Mohit Agarwal |
|    123 | Nikhil Bansal |
+--------+---------------+
```

---

### 8. Simulated EXCEPT
Find employees who earn more than ₹80,000 but are not in the Cyber Security department.

```sql
SELECT e.Emp_ID,
       e.Emp_Name 
FROM Employee e
WHERE e.Salary > 80000 
AND NOT EXISTS (
    SELECT 1
    FROM Employee e2
    WHERE e2.Emp_ID = e.Emp_ID 
    AND e2.Dept_ID = 3
);
```

**Output:**
```
+--------+---------------+
| Emp_ID | Emp_Name      |
+--------+---------------+
|    101 | Aarav Sharma  |
|    102 | Priya Verma   |
|    104 | Ananya Singh  |
|    105 | Karan Mehta   |
|    108 | Sneha Patel   |
|    110 | Simran Kaur   |
|    119 | Akash Singh   |
|    121 | Mohit Agarwal |
|    123 | Nikhil Bansal |
|    125 | Manish Verma  |
+--------+---------------+
```

---

## 🔍 Query Execution Plans (EXPLAIN Analysis)

`EXPLAIN` displays how the MySQL Optimizer executes queries:

### Query 1: EXPLAIN for Simple Selection
```sql
EXPLAIN SELECT * FROM Employee WHERE Salary > 90000;
```
- **Type:** `ALL` (Full table scan; evaluations made without index on `Salary`).
- **Rows:** 30 (All 30 employee rows examined).

### Query 2: EXPLAIN for INNER JOIN
```sql
EXPLAIN
SELECT e.Emp_Name, d.Dept_Name 
FROM Employee e
INNER JOIN Department d ON e.Dept_ID = d.Dept_ID;
```
- **Join Ordering:** Table `d` scanned (`ALL`), table `e` looked up via foreign key index `Dept_ID` (`ref`).

### Query 3: EXPLAIN for Correlated Subquery
```sql
EXPLAIN
SELECT e.Emp_ID, e.Emp_Name, e.Salary
FROM Employee e 
WHERE e.Salary > (
    SELECT AVG(e2.Salary) FROM Employee e2 WHERE e2.Dept_ID = e.Dept_ID
);
```
- **Subquery Select Type:** `DEPENDENT SUBQUERY` (Evaluated for each row processed in the outer query).

### Query 4: EXPLAIN for EXISTS
```sql
EXPLAIN
SELECT d.Dept_Name FROM Department d 
WHERE EXISTS (
    SELECT 1 FROM Employee e WHERE e.Dept_ID = d.Dept_ID AND e.Salary > 100000
);
```
- **Optimization:** Semi-join conversion allows early termination as soon as a qualifying employee is encountered.

---

## 📈 Experiment 4 Results & Conclusion

The **Employee–Department–Project** database was successfully queried using `INNER JOIN`, `LEFT JOIN`, `SELF JOIN`, multi-table joins, correlated subqueries, `EXISTS`, and simulated `INTERSECT` and `EXCEPT` operations. Execution plans for selected queries were examined using `EXPLAIN` and their access methods, join types, row estimates, and optimizer characteristics were evaluated for performance analysis.

---

# 🔬 Experiment 5: SQL Views, View Updatability and Recursive CTE

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To design and implement SQL views for department salary aggregation and employee organizational hierarchy, investigate the rules governing view updatability in MySQL, and implement recursive Common Table Expressions (CTE) to traverse hierarchical employee-manager reporting chains.

---

## 📖 Theory & Core Concepts

1. **SQL View:** A virtual table defined by a stored `SELECT` query. Views simplify complex query execution, provide data abstraction, and enable column-level security.
2. **View Updatability:**
   - **Updatable Views:** A simple, 1-to-1 projection on a single underlying base table is updatable (inserts/updates/deletes propagate directly to the base table).
   - **Non-Updatable Views:** Views containing `GROUP BY`, aggregate functions (`SUM`, `AVG`, `COUNT`), `DISTINCT`, `HAVING`, or `UNION` are **not updatable** because each row represents grouped summaries rather than a unique underlying base-table row (MySQL returns `ERROR 1288 (HY000)`).
   - **Join Views:** Updating columns derived from multiple joined tables is restricted or rejected if the target column belongs to an un-updatable join partner.
3. **Recursive Common Table Expressions (CTE):**
   - Defined using `WITH RECURSIVE`.
   - Contains an **Anchor Member** (initial non-recursive seed query, e.g. finding top-level managers with `Manager_ID IS NULL`).
   - Followed by `UNION ALL` and a **Recursive Member** (references the CTE itself to fetch the next hierarchical level).
   - Terminates automatically when the recursive step returns an empty set.

---

## 📁 Experiment 5 Files

```tree
Experiment-05/
├── schema_update.sql          # Self-referencing Foreign Key & reporting relationships
├── views_and_updatability.sql # View creation, updatability tests & definition checks
├── recursive_cte.sql          # Recursive CTE reporting chains & indented trees
└── complete_experiment5.sql   # Unified executable script for Experiment 5
```

---

## 🚀 Getting Started / Execution Guide (Experiment 5)

Make sure `CompanyDB` is initialized.

```sql
USE CompanyDB;
SOURCE Experiment-05/complete_experiment5.sql;
```

*Or execute components modularly:*
```sql
SOURCE Experiment-05/schema_update.sql;
SOURCE Experiment-05/views_and_updatability.sql;
SOURCE Experiment-05/recursive_cte.sql;
```

---

## 🛠️ Step 1: Extend Schema for Reporting Hierarchy

Add a self-referencing foreign key column `Manager_ID` to `Employee` and assign reporting managers across all 5 departments:

```sql
ALTER TABLE Employee
ADD COLUMN Manager_ID INT NULL;

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID);
```

---

## 📊 Views & Updatability Experiments

### 1. Department Salary Summary View (Aggregate View)
Summarizes department budgets, headcounts, average, min, and max salaries:

```sql
CREATE OR REPLACE VIEW Department_Salary_Summary AS 
SELECT d.Dept_ID,
       d.Dept_Name,
       COUNT(e.Emp_ID) AS Employee_Count, 
       SUM(e.Salary) AS Total_Salary, 
       AVG(e.Salary) AS Average_Salary, 
       MIN(e.Salary) AS Minimum_Salary, 
       MAX(e.Salary) AS Maximum_Salary
FROM Department d
LEFT JOIN Employee e ON d.Dept_ID = e.Dept_ID 
GROUP BY d.Dept_ID, d.Dept_Name;

SELECT * FROM Department_Salary_Summary;
```

**Output:**
```
+---------+-------------------------+----------------+--------------+----------------+----------------+----------------+
| Dept_ID | Dept_Name               | Employee_Count | Total_Salary | Average_Salary | Minimum_Salary | Maximum_Salary |
+---------+-------------------------+----------------+--------------+----------------+----------------+----------------+
|       1 | Artificial Intelligence |              6 |    520000.00 |   86666.666667 |       72000.00 |      105000.00 |
|       2 | Software Development    |              6 |    465000.00 |   77500.000000 |       65000.00 |       95000.00 |
|       3 | Cyber Security          |              6 |    516000.00 |   86000.000000 |       68000.00 |       98000.00 |
|       4 | Data Science            |              6 |    506000.00 |   84333.333333 |       72000.00 |      100000.00 |
|       5 | Human Resources         |              6 |    403000.00 |   67166.666667 |       58000.00 |       85000.00 |
+---------+-------------------------+----------------+--------------+----------------+----------------+----------------+
```

---

### 2. Employee Hierarchy View (Multi-Table Join View)
Combines employee details with department name and manager's name:

```sql
CREATE OR REPLACE VIEW Employee_Hierarchy AS 
SELECT e.Emp_ID,
       e.Emp_Name AS Employee_Name, 
       e.Job_Title,
       e.Dept_ID, 
       d.Dept_Name, 
       e.Manager_ID,
       m.Emp_Name AS Manager_Name
FROM Employee e
LEFT JOIN Department d ON e.Dept_ID = d.Dept_ID 
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

SELECT *
FROM Employee_Hierarchy
ORDER BY Dept_ID, Manager_ID, Emp_ID;
```

**Output:**
```
+--------+---------------+----------------------+---------+-------------------------+------------+--------------+
| Emp_ID | Employee_Name | Job_Title            | Dept_ID | Dept_Name               | Manager_ID | Manager_Name |
+--------+---------------+----------------------+---------+-------------------------+------------+--------------+
|    101 | Aarav Sharma  | AI Engineer          |       1 | Artificial Intelligence |       NULL | NULL         |
|    102 | Priya Verma   | ML Engineer          |       1 | Artificial Intelligence |        101 | Aarav Sharma |
|    103 | Rohan Gupta   | AI Developer         |       1 | Artificial Intelligence |        101 | Aarav Sharma |
|    104 | Ananya Singh  | Research Engineer    |       1 | Artificial Intelligence |        102 | Priya Verma  |
|    105 | Karan Mehta   | ML Engineer          |       1 | Artificial Intelligence |        102 | Priya Verma  |
|    106 | Neha Kapoor   | AI Analyst           |       1 | Artificial Intelligence |        103 | Rohan Gupta  |
|    110 | Simran Kaur   | Full Stack Developer |       2 | Software Development    |       NULL | NULL         |
|    107 | Rahul Kumar   | Software Engineer    |       2 | Software Development    |        110 | Simran Kaur  |
|    ... | ...           | ...                  |     ... | ...                     |        ... | ...          |
+--------+---------------+----------------------+---------+-------------------------+------------+--------------+
```

---

### 3. View Updatability Tests & Observations

#### A. Updatable Simple View (`Employee_Basic`)
```sql
CREATE OR REPLACE VIEW Employee_Basic AS
SELECT Emp_ID, Emp_Name, Job_Title, Salary, Dept_ID 
FROM Employee;

UPDATE Employee_Basic 
SET Salary = 86000 
WHERE Emp_ID = 101;

SELECT Emp_ID, Emp_Name, Salary FROM Employee WHERE Emp_ID = 101;
```
- **Result:** **Success!** Salary is updated in the base `Employee` table.

#### B. Non-Updatable Aggregate View (`Department_Salary_Summary`)
```sql
UPDATE Department_Salary_Summary 
SET Average_Salary = 90000 
WHERE Dept_ID = 1;
```
- **Result:** **REJECTED!**
- **Error:** `ERROR 1288 (HY000): The target table Department_Salary_Summary of the UPDATE is not updatable`

#### C. Non-Updatable Multi-Table Join View (`Employee_Hierarchy`)
```sql
UPDATE Employee_Hierarchy
SET Manager_Name = 'Priya Verma' 
WHERE Emp_ID = 103;
```
- **Result:** **REJECTED!** `Manager_Name` is derived from a joined table (`m`).

---

### 📋 View Updatability Comparison Matrix

| View Name | Main Characteristics | Directly Updatable? | Reason / DBMS Rule |
| :--- | :--- | :---: | :--- |
| **`Employee_Basic`** | Single base table projection | **Yes** | 1:1 mapping directly updates underlying table row. |
| **`Department_Salary_Summary`**| `GROUP BY` + Aggregate functions | **No** | Rows represent grouped summary data, not single base rows. |
| **`Employee_Hierarchy`** | Multi-table `JOIN` with aliases | **No** | Target column `Manager_Name` is derived from joined relation. |

---

## 🌲 Recursive Common Table Expressions (CTE)

### 1. Full Reporting Chains with Paths
```sql
WITH RECURSIVE EmployeeChain AS ( 
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, 0 AS Level,
           CAST(e.Emp_Name AS CHAR(1000)) AS Reporting_Chain 
    FROM Employee e
    WHERE e.Manager_ID IS NULL
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, ec.Level + 1,
           CONCAT(ec.Reporting_Chain, ' -> ', e.Emp_Name) 
    FROM Employee e
    INNER JOIN EmployeeChain ec ON e.Manager_ID = ec.Emp_ID
)
SELECT Emp_ID, Emp_Name, Manager_ID, Level, Reporting_Chain 
FROM EmployeeChain
ORDER BY Reporting_Chain;
```

---

### 2. Recursive CTE for a Single Subtree (Root = Emp_ID 101)
```sql
WITH RECURSIVE ReportingTree AS (
    SELECT Emp_ID, Emp_Name, Manager_ID, 0 AS Level 
    FROM Employee
    WHERE Emp_ID = 101 
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, rt.Level + 1 
    FROM Employee e
    INNER JOIN ReportingTree rt ON e.Manager_ID = rt.Emp_ID
)
SELECT Emp_ID, Emp_Name, Manager_ID, Level 
FROM ReportingTree
ORDER BY Level, Emp_ID;
```

---

### 3. Visual Indentation Organizational Tree
```sql
WITH RECURSIVE EmployeeTree AS (
    SELECT Emp_ID, Emp_Name, Manager_ID, 0 AS Level 
    FROM Employee
    WHERE Manager_ID IS NULL 
    UNION ALL
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, et.Level + 1 
    FROM Employee e
    INNER JOIN EmployeeTree et ON e.Manager_ID = et.Emp_ID
)
SELECT Emp_ID,
       CONCAT(REPEAT('    ', Level), Emp_Name) AS Employee_Hierarchy, 
       Level
FROM EmployeeTree
ORDER BY Level, Emp_ID;
```

---

## 💡 Important Observations

- A view stores a stored query definition rather than duplicating underlying storage.
- Aggregate and `GROUP BY` views produce synthesized rows and cannot be updated directly.
- A simple single-table projection allows update propagation when meeting DBMS integrity criteria.
- Recursive CTEs cleanly solve the hierarchical traversal problem in relational databases without requiring procedural cursor loops.
- `Manager_ID` implements a self-referencing unary relationship model.

---

## 📈 Experiment 5 Results & Conclusion

SQL views for departmental salary aggregation and multi-table employee hierarchy were successfully defined and evaluated. View updatability rules were validated: simple projections permitted updates, whereas aggregate and joined views were properly rejected with `ERROR 1288`. Recursive Common Table Expressions (`WITH RECURSIVE`) efficiently computed organizational reporting paths and rendered indented hierarchy trees across all organizational levels.

---

# 🔬 Experiment 6: Stored Procedures, Triggers and Audit Logging

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To design and implement:
- A stored procedure `transfer_employee(emp_id, new_dept_id)` with input validation and conditional error handling using custom SQLSTATE signals.
- A **`BEFORE UPDATE`** trigger (`before_employee_salary_update`) for business constraint enforcement (preventing negative salary values).
- An **`AFTER UPDATE`** trigger (`after_employee_salary_update`) for automated audit logging (`Salary_Audit` tracking history of salary revisions).
- Thorough verification of successful operations as well as testing of critical edge cases (non-existent employee, non-existent department, negative salary).

---

## 📖 Theory & Core Concepts

1. **Stored Procedures:**
   - Precompiled SQL routines stored centrally in the database catalog.
   - Encapsulate business logic, reduce network round-trips, and improve application security through parameterized execution.
2. **Error Handling & Custom Signaling (`SIGNAL SQLSTATE '45000'`):**
   - In MySQL, `SQLSTATE '45000'` is reserved for user-defined unhandled exceptions.
   - When an application constraint fails (e.g., employee or department not found), `SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '...'` terminates the execution immediately and returns a clean, human-readable error message to the client application.
3. **Database Triggers:**
   - Special stored programs invoked automatically by the DBMS engine in response to specific DML events (`INSERT`, `UPDATE`, `DELETE`).
4. **`BEFORE UPDATE` Triggers:**
   - Fired *prior* to modifying the underlying table data.
   - Ideal for **data validation**, sanitization, and defensive programming. Accesses prospective column values via the `NEW` pseudorow. If an invalid value is supplied, the trigger aborts the transaction before any dirty write occurs.
5. **`AFTER UPDATE` Triggers:**
   - Fired *after* changes have been successfully staged in the table.
   - Ideal for **audit trails, history logging**, and cascading notifications. Accesses prior values via `OLD` and updated values via `NEW`.
6. **Audit Logging Architecture:**
   - An independent audit relation (`Salary_Audit`) records who/what was modified (`Emp_ID`), previous state (`Old_Salary`), new state (`New_Salary`), and the exact moment of modification (`Changed_At TIMESTAMP`).

---

## 🗄️ Database Design & Schema Architecture

```
+--------------------+            1 : N            +--------------------+
|     Department     | <-------------------------- |      Employee      |
+--------------------+                             +--------------------+
| Dept_ID (PK)       |                             | Emp_ID (PK)        |
| Dept_Name          |                             | Emp_Name           |
+--------------------+                             | Salary             |
                                                   | Dept_ID (FK)       |
                                                   +--------------------+
                                                             |
                                                     Triggers Audit (1 : N)
                                                             v
                                                   +--------------------+
                                                   |    Salary_Audit    |
                                                   +--------------------+
                                                   | Audit_ID (PK, AI)  |
                                                   | Emp_ID             |
                                                   | Old_Salary         |
                                                   | New_Salary         |
                                                   | Changed_At         |
                                                   +--------------------+
```

### Table Specifications

| Table | Primary Key | Foreign Key(s) | Description |
| :--- | :--- | :--- | :--- |
| **`Department`** | `Dept_ID` | *None* | Stores department IDs and unit names |
| **`Employee`** | `Emp_ID` | `Dept_ID` → `Department(Dept_ID)` | Stores employee personal records, salaries, and assigned department |
| **`Salary_Audit`** | `Audit_ID` | *None* | Automated ledger storing history of employee salary adjustments |

---

## 📁 Experiment 6 Files

```tree
Experiment-06/
├── schema_and_data.sql     # Base tables, constraints, audit table & sample records
├── stored_procedures.sql   # transfer_employee procedure with exception handling
├── triggers_and_audit.sql  # Salary validation & automated audit logging triggers
└── complete_experiment6.sql# Unified executable script for Experiment 6
```

---

## 🚀 Getting Started / Execution Guide (Experiment 6)

### Method 1: Using MySQL Command Line Client

1. Open your terminal inside the repository folder.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the unified SQL script:
   ```sql
   SOURCE Experiment-06/complete_experiment6.sql;
   ```
   *Or run modularly:*
   ```sql
   SOURCE Experiment-06/schema_and_data.sql;
   SOURCE Experiment-06/stored_procedures.sql;
   SOURCE Experiment-06/triggers_and_audit.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your database instance.
2. Open `Experiment-06/complete_experiment6.sql`.
3. Click the ⚡ **Execute (All Queries)** button.
4. Review the query results and generated audit logs in the output grid.

---

## 📊 Stored Procedure & Triggers Implementation & Output Catalog

### 1. Schema Initialization and Seeding

Creates the base tables and inserts baseline records:

```sql
INSERT INTO Department (Dept_ID, Dept_Name) VALUES (1, 'Sales'), (2, 'Engineering');
INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID) VALUES (1, 'Alex', 60000.00, 1);
```

---

### 2. Stored Procedure: `transfer_employee`

Encapsulates department transfer logic with existence verification:

```sql
DELIMITER $$
CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE dept_count INT DEFAULT 0;

    SELECT COUNT(*) INTO emp_count
    FROM Employee
    WHERE Emp_ID = p_emp_id;

    SELECT COUNT(*) INTO dept_count
    FROM Department
    WHERE Dept_ID = p_new_dept_id;

    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee does not exist';
    ELSEIF dept_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist';
    ELSE
        UPDATE Employee
        SET Dept_ID = p_new_dept_id
        WHERE Emp_ID = p_emp_id;
    END IF;
END$$
DELIMITER ;
```

#### Test Case 1: Successful Transfer Execution
Transfer Employee 1 (Alex) from Department 1 (Sales) to Department 2 (Engineering):

```sql
CALL transfer_employee(1, 2);
SELECT * FROM Employee WHERE Emp_ID = 1;
```

**Output:**
```
+--------+----------+----------+---------+
| Emp_ID | Emp_Name | Salary   | Dept_ID |
+--------+----------+----------+---------+
|      1 | Alex     | 60000.00 |       2 |
+--------+----------+----------+---------+
```

#### Test Case 2: Edge Case — Non-Existent Employee
```sql
CALL transfer_employee(666, 2);
```
**Output / Error:**
```
ERROR 1644 (45000): Employee does not exist
```

#### Test Case 3: Edge Case — Non-Existent Department
```sql
CALL transfer_employee(1, 666);
```
**Output / Error:**
```
ERROR 1644 (45000): Department does not exist
```

---

### 3. Business Rule Validation Trigger (`BEFORE UPDATE`)

Guarantees data integrity by intercepting salary updates and rejecting negative amounts:

```sql
DELIMITER $$
CREATE TRIGGER before_employee_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.Salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$
DELIMITER ;
```

#### Test Case: Edge Case — Negative Salary Validation
```sql
UPDATE Employee SET Salary = -5000 WHERE Emp_ID = 1;
```
**Output / Error:**
```
ERROR 1644 (45000): Salary cannot be negative
```

---

### 4. Audit Logging Trigger (`AFTER UPDATE`)

Captures historical salary adjustments to ensure an immutable audit trail:

```sql
DELIMITER $$
CREATE TRIGGER after_employee_salary_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.Salary <> NEW.Salary THEN
        INSERT INTO Salary_Audit (Emp_ID, Old_Salary, New_Salary)
        VALUES (OLD.Emp_ID, OLD.Salary, NEW.Salary);
    END IF;
END$$
DELIMITER ;
```

#### Test Case: Valid Salary Adjustment
Update Alex's salary from ₹60,000 to ₹65,000:

```sql
UPDATE Employee SET Salary = 65000 WHERE Emp_ID = 1;
```

#### Verification: Salary Audit Log
```sql
SELECT * FROM Salary_Audit;
```
**Output:**
```
+----------+--------+------------+------------+---------------------+
| Audit_ID | Emp_ID | Old_Salary | New_Salary | Changed_At          |
+----------+--------+------------+------------+---------------------+
|        1 |      1 |   60000.00 |   65000.00 | 2026-10-16 05:32:46 |
+----------+--------+------------+------------+---------------------+
```

#### Verification: Employee Current State
```sql
SELECT Emp_ID, Emp_Name, Salary
FROM Employee
WHERE Emp_ID = 1;
```
**Output:**
```
+--------+----------+----------+
| Emp_ID | Emp_Name | Salary   |
+--------+----------+----------+
|      1 | Alex     | 65000.00 |
+--------+----------+----------+
```

---

## 💡 Important Observations

- **Atomic Validation:** Validations inside stored procedures prevent partial or invalid transactions from touching database state.
- **SQLSTATE 45000:** Using standard custom state `45000` allows client software to distinguish business rule violations from internal database hardware/syntax faults.
- **BEFORE vs AFTER:** `BEFORE` triggers are ideal for validation because aborting them stops the transaction without executing writes; `AFTER` triggers ensure audit logging only occurs when the base update has succeeded.
- **Change Detection:** Checking `IF OLD.Salary <> NEW.Salary THEN` avoids writing redundant audit entries if an update statement runs without modifying the salary value.

---

## 📈 Experiment 6 Results & Conclusion

The stored procedure `transfer_employee` and triggers `before_employee_salary_update` and `after_employee_salary_update` were successfully implemented and verified on MySQL. Input validation and custom error handling correctly blocked invalid operations (non-existent employee, non-existent department, and negative salary) with user-friendly messages via `SQLSTATE '45000'`. Valid departmental transfers and salary revisions succeeded, and all salary modifications were recorded in the `Salary_Audit` table.

---

# 🔬 Experiment 7: Database Normalization (UNF to 1NF, 2NF, 3NF & BCNF) with Lossless Join & Dependency Preservation

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-UniversityDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

Given a denormalized database relation (`Registration_UNF`), identify all functional dependencies (FDs) and perform step-by-step relational database normalization from **UNF** to **1NF**, **2NF**, **3NF**, and **BCNF (Boyce-Codd Normal Form)**. Verify:
1. **Lossless Join Decomposition:** Demonstrating through multi-table relational joins that the decomposed tables reconstruct the original dataset with zero information loss and no spurious tuples.
2. **Dependency Preservation:** Validating through SQL aggregation checks that all original functional dependencies are preserved across the decomposed schema without cross-table constraints.

---

## 📖 Theory & Core Concepts

Database Normalization is the systematic technique of structuring relational schemas to minimize data redundancy, avoid insertion/update/deletion anomalies, and ensure data integrity.

### 1. Functional Dependencies in the Registration Schema
From the denormalized relation `Registration_UNF(registration_id, student_id, student_name, course_id, course_name, instructor_id, instructor_name, department, semester, grade)`:
- `FD1: registration_id -> student_id, course_id, semester, grade` (Primary registration identifier)
- `FD2: student_id -> student_name` (Student profile)
- `FD3: course_id -> course_name, instructor_id` (Course details and instructor assignment)
- `FD4: instructor_id -> instructor_name, department` (Instructor personal details and department)
- `Candidate Keys:` `{registration_id}`, `{student_id, course_id}`

### 2. Normal Forms Progression

- **UNF (Unnormalized Form):** A flat table storing multiple real-world entities together without strict constraints. Contains high redundancy (e.g., student name and instructor details repeated across multiple course enrollments).
- **1NF (First Normal Form):** Every column contains atomic (indivisible) scalar values with unique column names and no repeating groups.
- **2NF (Second Normal Form):** Must be in 1NF, and every non-prime attribute must be **fully functionally dependent** on the candidate key (elimination of *Partial Dependencies*).
  - *Partial Dependencies in 1NF:* In composite candidate key `{student_id, course_id}`, `student_name` depends solely on `student_id`, and `course_name`, `instructor_id` depend solely on `course_id`.
  - *Resolution:* Decomposed into `Students(student_id PK, student_name)`, `Courses(course_id PK, course_name, instructor_id, instructor_name, department)`, and `Registrations(registration_id PK, student_id FK, course_id FK, semester, grade)`.
- **3NF (Third Normal Form):** Must be in 2NF, and no non-prime attribute is **transitively dependent** on any candidate key (elimination of *Transitive Dependencies* `X -> Y -> Z`).
  - *Transitive Dependency in 2NF Courses:* `course_id -> instructor_id` and `instructor_id -> instructor_name, department`.
  - *Resolution:* Decomposed `Courses` into `Instructors(instructor_id PK, instructor_name, department)` and `Courses_3NF(course_id PK, course_name, instructor_id FK)`.
- **BCNF (Boyce-Codd Normal Form):** A relation is in BCNF if for every non-trivial functional dependency `X -> Y`, the determinant `X` is a **Superkey**.
  - In all resulting tables (`Students`, `Instructors`, `Courses_3NF`, `Registrations`), every determinant is a Primary/Superkey, satisfying BCNF.

### 3. Properties of Good Decomposition
- **Lossless Join Decomposition:** $R_1 \bowtie R_2 = R$. The natural join of the decomposed relations reproduces the original relation $R$ exactly without generating spurious rows.
- **Dependency Preservation:** Every functional dependency in $F$ can be verified directly on a single decomposed relation without computing expensive cross-table joins.

---

## 📁 Experiment 7 Files

```tree
Experiment-07/
├── 01_unf_and_1nf.sql                  # Denormalized UNF schema & 1NF transformation
├── 02_2nf_decomposition.sql            # 2NF decomposition eliminating partial dependencies
├── 03_3nf_and_bcnf.sql                 # 3NF/BCNF decomposition eliminating transitive dependencies
├── 04_verification_lossless_and_fd.sql # Lossless join reconstruction & FD verification
└── complete_experiment7.sql            # Unified executable script for entire Experiment 7
```

---

## 🚀 Getting Started / Execution Guide (Experiment 7)

### Method 1: Using MySQL Command Line Client

1. Open your terminal in the repository root directory.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the complete unified script:
   ```sql
   SOURCE Experiment-07/complete_experiment7.sql;
   ```
   *Or execute step-by-step:*
   ```sql
   SOURCE Experiment-07/01_unf_and_1nf.sql;
   SOURCE Experiment-07/02_2nf_decomposition.sql;
   SOURCE Experiment-07/03_3nf_and_bcnf.sql;
   SOURCE Experiment-07/04_verification_lossless_and_fd.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your instance.
2. Open `Experiment-07/complete_experiment7.sql`.
3. Click the ⚡ **Execute (All Queries)** button and review the result grids.

---

## 📊 Step-by-Step Normalization Implementation

### 1. Creating Denormalized Table (UNF) & Converting to 1NF
```sql
CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;

CREATE TABLE Registration_UNF (
    registration_id INT,
    student_id INT,
    student_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100),
    department VARCHAR(100),
    semester VARCHAR(20),
    grade CHAR(2)
);

INSERT INTO Registration_UNF VALUES
(501, 101, 'Ankan Bhattacharjee', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'A'),
(502, 102, 'Unnati Mishra', 202, 'Operating Systems', 302, 'Dr Rao', 'CSE', 'Semester 3', 'B'),
(503, 103, 'Riya Patel', 203, 'Computer Networks', 303, 'Dr Sen', 'IT', 'Semester 4', 'A'),
(504, 104, 'Isha Gupta', 201, 'Database Systems', 301, 'Dr Mehta', 'CSE', 'Semester 3', 'B'),
(505, 105, 'Arjun Das', 204, 'Artificial Intelligence', 304, 'Dr Nair', 'AIML', 'Semester 5', 'A');

-- Convert to 1NF
CREATE TABLE Registration_1NF AS
SELECT * FROM Registration_UNF;
```

---

### 2. Decomposing to 2NF (Eliminating Partial Dependencies)
```sql
-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO Students
SELECT DISTINCT student_id, student_name
FROM Registration_UNF;

-- Courses Table (2NF)
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    instructor_name VARCHAR(100),
    department VARCHAR(100)
);

INSERT INTO Courses
SELECT DISTINCT course_id, course_name, instructor_id, instructor_name, department
FROM Registration_UNF;

-- Registrations Table (2NF)
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Registrations
SELECT DISTINCT registration_id, student_id, course_id, semester, grade
FROM Registration_UNF;
```

---

### 3. Decomposing to 3NF & BCNF (Eliminating Transitive Dependencies)
```sql
-- Instructors Table (3NF & BCNF)
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

INSERT INTO Instructors
SELECT DISTINCT instructor_id, instructor_name, department
FROM Registration_UNF;

-- Courses_3NF Table (3NF & BCNF)
CREATE TABLE Courses_3NF (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

INSERT INTO Courses_3NF
SELECT DISTINCT course_id, course_name, instructor_id
FROM Registration_UNF;
```

---

### 4. Verification: Lossless Join Decomposition
```sql
SELECT
    r.registration_id,
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name,
    i.instructor_id,
    i.instructor_name,
    i.department,
    r.semester,
    r.grade
FROM Registrations r
JOIN Students s ON r.student_id = s.student_id
JOIN Courses_3NF c ON r.course_id = c.course_id
JOIN Instructors i ON c.instructor_id = i.instructor_id
ORDER BY r.registration_id;
```

---

### 5. Verification: Dependency Preservation
```sql
-- Verifying student dependency (student_id -> student_name)
SELECT student_id
FROM Students
GROUP BY student_id
HAVING COUNT(DISTINCT student_name) > 1;

-- Verifying instructor dependency (instructor_id -> instructor_name, department)
SELECT instructor_id
FROM Instructors
GROUP BY instructor_id
HAVING COUNT(DISTINCT instructor_name) > 1
    OR COUNT(DISTINCT department) > 1;

-- Verifying course dependency (course_id -> course_name, instructor_id)
SELECT course_id
FROM Courses_3NF
GROUP BY course_id
HAVING COUNT(DISTINCT course_name) > 1
    OR COUNT(DISTINCT instructor_id) > 1;

-- Verifying registration uniqueness
SELECT registration_id
FROM Registrations
GROUP BY registration_id
HAVING COUNT(*) > 1;
```

---

## 📋 Expected Outputs & Execution Verification

### 1. Original Denormalized Registration Table (`Registration_UNF`)
```
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
| registration_id | student_id | student_name       | course_id | course_name             | instructor_id | instructor_name | department | semester   | grade |
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
|             501 |        101 | Ankan Bhattacharjee|       201 | Database Systems        |           301 | Dr Mehta        | CSE        | Semester 3 | A     |
|             502 |        102 | Unnati Mishra      |       202 | Operating Systems       |           302 | Dr Rao          | CSE        | Semester 3 | B     |
|             503 |        103 | Riya Patel         |       203 | Computer Networks       |           303 | Dr Sen          | IT         | Semester 4 | A     |
|             504 |        104 | Isha Gupta         |       201 | Database Systems        |           301 | Dr Mehta        | CSE        | Semester 3 | B     |
|             505 |        105 | Arjun Das          |       204 | Artificial Intelligence |           304 | Dr Nair         | AIML       | Semester 5 | A     |
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
```

### 2. Normalized Tables in 3NF / BCNF

#### `Students` Table:
```
+------------+--------------------+
| student_id | student_name       |
+------------+--------------------+
|        101 | Ankan Bhattacharjee|
|        102 | Unnati Mishra      |
|        103 | Riya Patel         |
|        104 | Isha Gupta         |
|        105 | Arjun Das          |
+------------+--------------------+
```

#### `Instructors` Table:
```
+---------------+-----------------+------------+
| instructor_id | instructor_name | department |
+---------------+-----------------+------------+
|           301 | Dr Mehta        | CSE        |
|           302 | Dr Rao          | CSE        |
|           303 | Dr Sen          | IT         |
|           304 | Dr Nair         | AIML       |
+---------------+-----------------+------------+
```

#### `Courses_3NF` Table:
```
+-----------+-------------------------+---------------+
| course_id | course_name             | instructor_id |
+-----------+-------------------------+---------------+
|       201 | Database Systems        |           301 |
|       202 | Operating Systems       |           302 |
|       203 | Computer Networks       |           303 |
|       204 | Artificial Intelligence |           304 |
+-----------+-------------------------+---------------+
```

#### `Registrations` Table:
```
+-----------------+------------+-----------+------------+-------+
| registration_id | student_id | course_id | semester   | grade |
+-----------------+------------+-----------+------------+-------+
|             501 |        101 |       201 | Semester 3 | A     |
|             502 |        102 |       202 | Semester 3 | B     |
|             503 |        103 |       203 | Semester 4 | A     |
|             504 |        104 |       201 | Semester 3 | B     |
|             505 |        105 |       204 | Semester 5 | A     |
+-----------------+------------+-----------+------------+-------+
```

### 3. Lossless Join Reconstructed Output
```
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
| registration_id | student_id | student_name       | course_id | course_name             | instructor_id | instructor_name | department | semester   | grade |
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
|             501 |        101 | Ankan Bhattacharjee|       201 | Database Systems        |           301 | Dr Mehta        | CSE        | Semester 3 | A     |
|             502 |        102 | Unnati Mishra      |       202 | Operating Systems       |           302 | Dr Rao          | CSE        | Semester 3 | B     |
|             503 |        103 | Riya Patel         |       203 | Computer Networks       |           303 | Dr Sen          | IT         | Semester 4 | A     |
|             504 |        104 | Isha Gupta         |       201 | Database Systems        |           301 | Dr Mehta        | CSE        | Semester 3 | B     |
|             505 |        105 | Arjun Das          |       204 | Artificial Intelligence |           304 | Dr Nair         | AIML       | Semester 5 | A     |
+-----------------+------------+--------------------+-----------+-------------------------+---------------+-----------------+------------+------------+-------+
```

### 4. Dependency Preservation Test Results
```
Empty set (0.00 sec)
Empty set (0.00 sec)
Empty set (0.00 sec)
Empty set (0.00 sec)
```
*(All 4 dependency verification queries returned 0 rows, confirming that every single functional dependency is fully preserved across the decomposed relations).*

### 5. Final Reconstructed View
```
+-----------------+--------------------+-------------------------+-----------------+------------+------------+-------+
| registration_id | student_name       | course_name             | instructor_name | department | semester   | grade |
+-----------------+--------------------+-------------------------+-----------------+------------+------------+-------+
|             501 | Ankan Bhattacharjee| Database Systems        | Dr Mehta        | CSE        | Semester 3 | A     |
|             502 | Unnati Mishra      | Operating Systems       | Dr Rao          | CSE        | Semester 3 | B     |
|             503 | Riya Patel         | Computer Networks       | Dr Sen          | IT         | Semester 4 | A     |
|             504 | Isha Gupta         | Database Systems        | Dr Mehta        | CSE        | Semester 3 | B     |
|             505 | Arjun Das          | Artificial Intelligence | Dr Nair         | AIML       | Semester 5 | A     |
+-----------------+--------------------+-------------------------+-----------------+------------+------------+-------+
```

---

## 💡 Important Observations

- **Anomaly Elimination:** Updating an instructor's department now requires modifying exactly one tuple in `Instructors` rather than updating multiple registration records, eliminating Update Anomalies.
- **Independence of Entities:** A new course or instructor can now be registered in `Courses_3NF` / `Instructors` without requiring student enrollment, eliminating Insertion Anomalies.
- **Graceful Deletion:** Deleting a student registration does not inadvertently delete the course or instructor details from the university catalog, eliminating Deletion Anomalies.
- **Simultaneous Lossless Join & Dependency Preservation:** The schema decomposition simultaneously achieves both the **Lossless Join Property** and **Dependency Preservation**, representing the gold standard in relational database design.

---

## 📈 Experiment 7 Results & Conclusion

The denormalized student course registration schema was successfully normalized step-by-step from **UNF** to **1NF**, **2NF**, **3NF**, and **BCNF**. Partial functional dependencies were eliminated by isolating `Students` and `Courses`, while transitive dependencies were resolved by extracting `Instructors`. The relational decomposition was formally verified via SQL to be both **lossless** (exact table reconstruction with zero spurious rows) and **dependency preserving** (all functional dependencies enforced within individual relations).

---

# 🔬 Experiment 8: Banking Transactions, ACID Properties, Savepoints and Concurrency Control

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-BankingDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To design and implement a transactional banking database application demonstrating:
1. **Transaction Control Language (TCL):** `START TRANSACTION` (`BEGIN`), `COMMIT`, and full `ROLLBACK`.
2. **Intermediate Checkpoints:** Using `SAVEPOINT` and `ROLLBACK TO SAVEPOINT` to handle partial failures gracefully without aborting the entire transaction.
3. **Partial Failure Simulation:** Ensuring all-or-nothing execution (Atomicity) when funds transfer operations encounter unexpected failures or invalid accounts.
4. **Transaction Isolation Levels:** Configuring `READ COMMITTED`, `REPEATABLE READ`, and `SERIALIZABLE` in MySQL InnoDB.
5. **Multi-Session Concurrency Control:** Demonstrating concurrency phenomena (Non-Repeatable Read) across two simultaneous database client sessions.

---

## 📖 Theory & Core Concepts

A **Database Transaction** is a logical unit of database processing that includes one or more database access operations.

### 1. ACID Properties
- **Atomicity (All-or-Nothing):** Either all operations of a transaction succeed and are committed to disk, or none take effect. In banking, debiting account $A$ without crediting account $B$ is strictly prohibited.
- **Consistency:** Transactions transition the database from one valid state to another valid state, preserving all integrity constraints (e.g., account balance constraints).
- **Isolation:** Concurrent transactions execute without mutual interference. Intermediate uncommitted changes made by one transaction remain invisible to concurrent transactions.
- **Durability:** Once committed, changes are permanently written to non-volatile storage (WAL / InnoDB redo logs) and will not be lost even in the event of an immediate system crash or power outage.

### 2. Transaction Control Statements
- `START TRANSACTION` / `BEGIN`: Marks the boundary start of a logical unit of work.
- `COMMIT`: Persists all modifications made in the current transaction permanently to the database.
- `ROLLBACK`: Discards all modifications made since the start of the transaction, restoring data to its pre-transaction state.
- `SAVEPOINT <name>`: Establishes a named checkpoint within a transaction.
- `ROLLBACK TO SAVEPOINT <name>`: Undoes only those operations executed after the named savepoint, keeping preceding operations intact and uncommitted.

### 3. Concurrency Anomalies & ANSI SQL Isolation Levels
When multiple transactions execute concurrently without proper isolation, several anomalies can arise:
1. **Dirty Read:** A transaction reads uncommitted modifications made by another transaction (prevented in `READ COMMITTED` and higher).
2. **Non-Repeatable Read:** A transaction re-reads a row and finds that values have been modified by another committed transaction (prevented in `REPEATABLE READ` and `SERIALIZABLE`).
3. **Phantom Read:** A transaction re-executes a range query and finds new rows added by another committed transaction (prevented in `SERIALIZABLE` or InnoDB Next-Key Locks).

| Isolation Level | Dirty Read | Non-Repeatable Read | Phantom Read |
| :--- | :---: | :---: | :---: |
| **`READ UNCOMMITTED`** | Permitted | Permitted | Permitted |
| **`READ COMMITTED`** | ❌ Prevented | Permitted | Permitted |
| **`REPEATABLE READ`** (InnoDB Default) | ❌ Prevented | ❌ Prevented | ❌ Prevented (via MVCC & Next-Key Locks) |
| **`SERIALIZABLE`** | ❌ Prevented | ❌ Prevented | ❌ Prevented |

---

## 📁 Experiment 8 Files

```tree
Experiment-08/
├── 01_banking_schema_and_commit.sql        # Accounts DDL & atomic BEGIN/COMMIT transfer
├── 02_rollback_and_savepoint.sql           # Full ROLLBACK & SAVEPOINT partial rollback
├── 03_partial_failure_simulation.sql       # Invalid account transfer failure & atomicity test
├── 04_isolation_levels_and_concurrency.sql # Isolation level syntax & 2-session concurrency test
└── complete_experiment8.sql                # Unified executable script for entire Experiment 8
```

---

## 🚀 Getting Started / Execution Guide (Experiment 8)

### Method 1: Using MySQL Command Line Client

1. Open your terminal in the repository root directory.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the complete unified script:
   ```sql
   SOURCE Experiment-08/complete_experiment8.sql;
   ```
   *Or execute step-by-step:*
   ```sql
   SOURCE Experiment-08/01_banking_schema_and_commit.sql;
   SOURCE Experiment-08/02_rollback_and_savepoint.sql;
   SOURCE Experiment-08/03_partial_failure_simulation.sql;
   SOURCE Experiment-08/04_isolation_levels_and_concurrency.sql;
   ```

### Method 2: Testing Multi-Session Concurrency in Two Terminals

1. **Terminal 1 (Session 1):**
   ```bash
   mysql -u root -p BankingDB
   ```
   ```sql
   SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
   START TRANSACTION;
   SELECT Balance FROM Accounts WHERE Account_ID = 101;
   ```
2. **Terminal 2 (Session 2):**
   ```bash
   mysql -u root -p BankingDB
   ```
   ```sql
   START TRANSACTION;
   UPDATE Accounts SET Balance = Balance - 500 WHERE Account_ID = 101;
   COMMIT;
   ```
3. **Terminal 1 (Session 1 - Verification):**
   ```sql
   SELECT Balance FROM Accounts WHERE Account_ID = 101;
   COMMIT;
   ```

---

## 📊 Step-by-Step Transaction Implementations

### 1. Database Creation & Initial Table Setup
```sql
CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;

CREATE TABLE Accounts (
    Account_ID INT PRIMARY KEY,
    Holder_Name VARCHAR(50) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL
);

INSERT INTO Accounts VALUES
(101, 'Amit', 10000.00),
(102, 'Rahul', 8000.00);

SELECT * FROM Accounts;
```

---

### 2. Successful Transaction (`START TRANSACTION` & `COMMIT`)
Transfer ₹2000 from Amit (Account 101) to Rahul (Account 102):
```sql
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 2000
WHERE Account_ID = 101;

UPDATE Accounts
SET Balance = Balance + 2000
WHERE Account_ID = 102;

COMMIT;

SELECT * FROM Accounts;
```

---

### 3. Full Transaction Abort (`ROLLBACK`)
Attempting a ₹5000 withdrawal from Amit that is subsequently cancelled:
```sql
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 5000
WHERE Account_ID = 101;

ROLLBACK;

SELECT * FROM Accounts;
```

---

### 4. Intermediate Checkpoints (`SAVEPOINT` & Partial Rollback)
Deduct ₹1000 from Amit, establish savepoint `sp1`, attempt an erroneous ₹20,000 deduction on Rahul, and rollback specifically to `sp1`:
```sql
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE Account_ID = 101;

SAVEPOINT sp1;

UPDATE Accounts
SET Balance = Balance - 20000
WHERE Account_ID = 102;

ROLLBACK TO SAVEPOINT sp1;

COMMIT;

SELECT * FROM Accounts;
```

---

### 5. Partial Failure Simulation
Simulating an atomic transfer where debit succeeds on Account 101, but the credit target (Account 999) does not exist:
```sql
START TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 500
WHERE Account_ID = 101;

-- Simulated failure: target account does not exist
UPDATE Accounts
SET Balance = Balance + 500
WHERE Account_ID = 999;

ROLLBACK;

SELECT * FROM Accounts;
```

---

### 6. Isolation Levels Configuration
```sql
-- Read Committed
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

-- Repeatable Read (Default)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;

-- Serializable
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM Accounts;
COMMIT;
```

---

### 7. Concurrency Anomaly (Two Sessions)
```sql
-- SESSION 1
START TRANSACTION;
SELECT Balance FROM Accounts WHERE Account_ID = 101;

-- SESSION 2 (Concurrent Update & Commit)
START TRANSACTION;
UPDATE Accounts SET Balance = Balance - 500 WHERE Account_ID = 101;
COMMIT;

-- SESSION 1 (Re-querying same row)
SELECT Balance FROM Accounts WHERE Account_ID = 101;
COMMIT;
```

---

## 📋 Expected Outputs & Execution Verification

### 1. Initial Account Table
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        | 10000.00 |
|        102 | Rahul       |  8000.00 |
+------------+-------------+----------+
```

### 2. State After BEGIN and COMMIT (₹2000 Transfer)
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  8000.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```
*(Amit debited ₹2000, Rahul credited ₹2000; total bank balance preserved at ₹18,000).*

### 3. State After ROLLBACK (Aborted ₹5000 Debit)
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  8000.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```
*(All uncommitted modifications rolled back; balances remain unchanged).*

### 4. State After SAVEPOINT and Partial Rollback
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  7000.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```
*(Amit's valid ₹1000 debit committed; Rahul's excessive ₹20,000 debit reverted back to savepoint `sp1`).*

### 5. State After Partial Failure Simulation
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  7000.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```
*(Because target account 999 failed, the entire transaction rolled back; Amit's ₹500 was not deducted).*

### 6. State After Isolation Level Check
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  7000.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```

### 7. State After Concurrency Anomaly (Session 2 Debit of ₹500)
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  6500.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```

### 8. Final Account State
```
+------------+-------------+----------+
| Account_ID | Holder_Name | Balance  |
+------------+-------------+----------+
|        101 | Amit        |  6500.00 |
|        102 | Rahul       | 10000.00 |
+------------+-------------+----------+
```

---

## 💡 Important Observations

- **ACID Compliance in Banking:** Transaction boundaries (`START TRANSACTION` ... `COMMIT`) guarantee that intermediate monetary debits are never left dangling without corresponding credits.
- **Savepoints Prevent Total Aborts:** When processing multi-stage complex workflows, `SAVEPOINT` provides checkpoint isolation, enabling retry or recovery logic for subsequent steps without wasting already-validated preceding work.
- **Failure Resilience:** The partial failure simulation demonstrates why programmatic transaction wrappers are mandatory in financial software to prevent lost money during network or logical exceptions.
- **MVCC & Isolation Trade-offs:** MySQL InnoDB uses Multi-Version Concurrency Control (MVCC). Under `REPEATABLE READ`, readers do not lock writers and writers do not lock readers, providing consistent read snapshots while preserving high throughput.

---

## 📈 Experiment 8 Results & Conclusion

Banking transactions adhering to ACID properties were successfully implemented and verified. Atomic balance transfers were committed using `START TRANSACTION` and `COMMIT`, and invalid operations were rolled back using `ROLLBACK`. The use of `SAVEPOINT` permitted selective partial rollbacks without abandoning preceding valid work. Transaction isolation levels (`READ COMMITTED`, `REPEATABLE READ`, and `SERIALIZABLE`) were configured, and concurrent execution behavior across multiple database sessions was demonstrated and validated.

---

# 🔬 Experiment 9: B-Tree Indexing, Composite Indexes and Query Optimization with EXPLAIN

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-RailwayDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To design and implement a high-volume **Railway Booking System** database with 5,000 records, benchmark data retrieval performance, and analyze query execution plans using **`EXPLAIN`**:
1. **Procedural Data Synthesis:** Populating at least 5,000 synthetic ticket bookings using an iterative MySQL stored procedure (`InsertBookings`).
2. **Baseline Query Analysis (Unindexed):** Evaluating the execution cost and full table scan (`ALL`) overhead of unindexed queries.
3. **Single-Column Indexing:** Creating a B-Tree index on `Train_No` (`idx_train`) and measuring the reduction in examined rows (`rows` reduced from ~5000 to ~250).
4. **Composite (Multi-Column) Indexing:** Creating a composite B-Tree index on `(Train_No, Journey_Date)` (`idx_train_date`) to optimize multi-attribute filtering down to a single row lookup (`rows = 1`).
5. **Execution Plan Metrics Comparison:** Comparing access types (`ALL` vs `ref`), `key_len` byte allocations, and filtering efficiency.

---

## 📖 Theory & Core Concepts

Database indexes are specialized auxiliary data structures (predominantly **B-Trees** in MySQL InnoDB) that dramatically accelerate data retrieval operations at the cost of slight write overhead.

### 1. Clustered vs Secondary Indexes
- **Clustered Index:** The physical table organization in MySQL InnoDB. The leaf pages of the clustered index contain the actual data rows, ordered by the Primary Key (`Booking_ID`).
- **Secondary (Non-Clustered) Index:** An auxiliary B-Tree index whose leaf nodes store the indexed key values along with a pointer to the clustered index primary key.

### 2. Single-Column vs Composite Indexes
- **Single-Column Index (`idx_train` on `Train_No`):** Indexes a single attribute. Best for queries filtering solely by that attribute.
- **Composite Index (`idx_train_date` on `(Train_No, Journey_Date)`):** Indexes multiple columns in a specified left-to-right hierarchy.
  - **Leftmost Prefix Rule:** A composite index `(A, B)` can satisfy queries filtering on `(A)` or `(A, B)`, but cannot independently satisfy queries filtering solely on `(B)` without `A`.

### 3. Key `EXPLAIN` Performance Metrics

| Metric | Full Table Scan (Baseline) | Single-Column Index | Composite Index |
| :--- | :---: | :---: | :---: |
| **`type` (Access Method)** | `ALL` (Slowest) | `ref` (Indexed Lookup) | `ref` (Indexed Lookup) |
| **`key` (Index Used)** | `NULL` | `idx_train` | `idx_train_date` |
| **`key_len` (Index Length)**| `NULL` | `5` bytes | `9` bytes |
| **`rows` (Estimated Scanned)**| **4,961 - 5,000** | **250** | **1** |
| **Performance Factor** | $1\times$ (Baseline) | **$20\times$ Faster** | **$5,000\times$ Faster** |

*Key Length Calculation Details:*
- `Train_No`: `INT` (4 bytes) + 1 byte for `NULL` indicator = **5 bytes**
- `Journey_Date`: `DATE` (3 bytes) + 1 byte for `NULL` indicator = 4 bytes
- Combined `key_len` for `(Train_No, Journey_Date)` = $5 + 4 =$ **9 bytes**

---

## 📁 Experiment 9 Files

```tree
Experiment-09/
├── 01_schema_and_data_generation.sql   # Railway schema & 5,000 records procedural synthesis
├── 02_single_column_index.sql          # Single index creation & EXPLAIN benchmark
├── 03_composite_index.sql              # Composite index creation & EXPLAIN benchmark
├── 04_performance_benchmarking.sql     # Index metadata inspection & benchmark queries
└── complete_experiment9.sql            # Unified executable script for entire Experiment 9
```

---

## 🚀 Getting Started / Execution Guide (Experiment 9)

### Method 1: Using MySQL Command Line Client

1. Open your terminal in the repository root directory.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the complete unified script:
   ```sql
   SOURCE Experiment-09/complete_experiment9.sql;
   ```
   *Or execute step-by-step:*
   ```sql
   SOURCE Experiment-09/01_schema_and_data_generation.sql;
   SOURCE Experiment-09/02_single_column_index.sql;
   SOURCE Experiment-09/03_composite_index.sql;
   SOURCE Experiment-09/04_performance_benchmarking.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your database instance.
2. Open `Experiment-09/complete_experiment9.sql`.
3. Click the ⚡ **Execute (All Queries)** button. Note that bulk inserting 5,000 records may take 2-5 seconds.

---

## 📊 Step-by-Step SQL Implementation

### 1. Creating Table & Populating 5,000 Bookings
```sql
CREATE DATABASE IF NOT EXISTS RailwayDB;
USE RailwayDB;

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

SELECT * FROM Railway_Booking LIMIT 10;
```

---

### 2. Query Before Indexing (Baseline)
```sql
EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;
```

---

### 3. Creating Single-Column Index & Benchmarking
```sql
CREATE INDEX idx_train
ON Railway_Booking(Train_No);

EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005;
```

---

### 4. Creating Composite Index & Benchmarking
```sql
CREATE INDEX idx_train_date
ON Railway_Booking(Train_No, Journey_Date);

EXPLAIN SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';
```

---

### 5. Performance Comparison Queries
```sql
-- Single Column Lookup
SELECT * FROM Railway_Booking
WHERE Train_No = 12005;

-- Composite Pin-point Lookup
SELECT * FROM Railway_Booking
WHERE Train_No = 12005
AND Journey_Date = '2026-03-15';
```

---

## 📋 Expected Outputs & Execution Verification

### 1. Original Railway Booking Table (Sample 9 Records)
```
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
| Booking_ID | Passenger_Name | Train_No | Source | Destination | Journey_Date | Seat_No | Fare   |
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
|          1 | Passenger_1    |    12001 | Delhi  | Lucknow     | 2026-01-02   |       1 | 501.00 |
|          2 | Passenger_2    |    12002 | Delhi  | Lucknow     | 2026-01-03   |       2 | 502.00 |
|          3 | Passenger_3    |    12003 | Delhi  | Lucknow     | 2026-01-04   |       3 | 503.00 |
|          4 | Passenger_4    |    12004 | Delhi  | Lucknow     | 2026-01-05   |       4 | 504.00 |
|          5 | Passenger_5    |    12005 | Delhi  | Lucknow     | 2026-01-06   |       5 | 505.00 |
|          6 | Passenger_6    |    12006 | Delhi  | Lucknow     | 2026-01-07   |       6 | 506.00 |
|          7 | Passenger_7    |    12007 | Delhi  | Lucknow     | 2026-01-08   |       7 | 507.00 |
|          8 | Passenger_8    |    12008 | Delhi  | Lucknow     | 2026-01-09   |       8 | 508.00 |
|          9 | Passenger_9    |    12009 | Delhi  | Lucknow     | 2026-01-10   |       9 | 509.00 |
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
```

### 2. Execution Plan Before Indexing (Full Table Scan)
```
+----+-------------+-----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table           | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | Railway_Booking | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 4961 |    10.00 | Using where |
+----+-------------+-----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```
*(Analysis: Without an index, the query engine performs a full table scan `type = ALL` evaluating nearly all 5,000 records).*

### 3. Execution Plan with Single Column Index (`idx_train`)
```
+----+-------------+-----------------+------------+------+---------------+-----------+---------+-------+------+----------+-------+
| id | select_type | table           | partitions | type | possible_keys | key       | key_len | ref   | rows | filtered | Extra |
+----+-------------+-----------------+------------+------+---------------+-----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Railway_Booking | NULL       | ref  | idx_train     | idx_train | 5       | const |  250 |   100.00 | NULL  |
+----+-------------+-----------------+------------+------+---------------+-----------+---------+-------+------+----------+-------+
```
*(Analysis: Access type improved to `ref`. Only the 250 rows matching Train 12005 are scanned instead of 5,000 rows).*

### 4. Execution Plan with Composite Index (`idx_train_date`)
```
+----+-------------+-----------------+------------+------+--------------------------+----------------+---------+-------------+------+----------+-------+
| id | select_type | table           | partitions | type | possible_keys            | key            | key_len | ref         | rows | filtered | Extra |
+----+-------------+-----------------+------------+------+--------------------------+----------------+---------+-------------+------+----------+-------+
|  1 | SIMPLE      | Railway_Booking | NULL       | ref  | idx_train,idx_train_date | idx_train_date | 9       | const,const |    1 |   100.00 | NULL  |
+----+-------------+-----------------+------------+------+--------------------------+----------------+---------+-------------+------+----------+-------+
```
*(Analysis: Evaluated rows dropped to **1**. Both `Train_No` and `Journey_Date` are matched in the B-Tree index, achieving $O(\log N)$ pin-point efficiency).*

### 5. Performance Comparison Query Results (`Train_No = 12005`)
```
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
| Booking_ID | Passenger_Name | Train_No | Source | Destination | Journey_Date | Seat_No | Fare   |
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
|          5 | Passenger_5    |    12005 | Delhi  | Lucknow     | 2026-01-06   |       5 | 505.00 |
|         25 | Passenger_25   |    12005 | Delhi  | Lucknow     | 2026-01-26   |      25 | 525.00 |
|         45 | Passenger_45   |    12005 | Delhi  | Lucknow     | 2026-02-15   |      45 | 545.00 |
|         65 | Passenger_65   |    12005 | Delhi  | Lucknow     | 2026-03-07   |      65 | 565.00 |
|         85 | Passenger_85   |    12005 | Delhi  | Lucknow     | 2026-03-27   |      85 | 585.00 |
|        105 | Passenger_105  |    12005 | Delhi  | Lucknow     | 2026-04-16   |       5 | 605.00 |
|        125 | Passenger_125  |    12005 | Delhi  | Lucknow     | 2026-05-06   |      25 | 625.00 |
|        145 | Passenger_145  |    12005 | Delhi  | Lucknow     | 2026-05-26   |      45 | 645.00 |
|        165 | Passenger_165  |    12005 | Delhi  | Lucknow     | 2026-06-15   |      65 | 665.00 |
+------------+----------------+----------+--------+-------------+--------------+---------+--------+
```

---

## 💡 Important Observations

- **Massive Row Scan Reductions:** Creating single-column and composite B-Tree indexes reduced evaluated rows from **5,000** down to **250** and finally to **1**, reducing disk I/O exponentially.
- **Index Selectivity:** The more selective an index column is (higher cardinality), the greater the performance benefit.
- **Composite Index Ordering:** Order of columns in composite indexes matters. `(Train_No, Journey_Date)` works for `WHERE Train_No = ?` and `WHERE Train_No = ? AND Journey_Date = ?`, but not for `WHERE Journey_Date = ?` alone.
- **Write Trade-Off:** While indexes accelerate `SELECT` operations, each additional index incurs maintenance cost during `INSERT`, `UPDATE`, and `DELETE` operations.

---

## 📈 Experiment 9 Results & Conclusion

A high-volume railway booking dataset containing 5,000 records was generated via stored procedure. Query execution performance was systematically benchmarked before and after creating single-column (`idx_train`) and composite (`idx_train_date`) B-Tree indexes. Execution plans compared via `EXPLAIN` demonstrated a transition from an unindexed full table scan (`type = ALL`, ~5000 rows) to index lookups (`type = ref`), culminating in a near-instantaneous single-row retrieval (`rows = 1`) under composite indexing.

---

# 🔬 Experiment 10: Query Optimization, Indexing Strategies and Query Rewriting on 10,000 Records

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-EnterpriseDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)

---

## 📌 Aim & Objectives

To design and benchmark enterprise database workloads on a synthetic dataset of at least **10,000 employee records**:
1. **Procedural Dataset Generation:** Generating 10,000 multi-attribute rows (`Emp_ID`, `Emp_Name`, `Department`, `City`, `Salary`, `Joining_Date`) with pseudo-random distributions using `ELT()` and mathematical modulo operations.
2. **Identification of Slow Queries:** Formulating five representative unindexed queries (filtering by equality, range, multi-attribute combinations, and sorting) and diagnosing bottlenecks with **`EXPLAIN`**.
3. **Index Optimization (Single & Composite):** Designing single-column (`idx_department`, `idx_city`, `idx_salary`) and composite (`idx_dept_city`, `idx_dept_salary`) B-Tree indexes to convert full table scans into index seeks.
4. **Eliminating Sort Overhead (`Using filesort`):** Using composite index ordering to satisfy `ORDER BY Salary DESC` directly from B-Tree leaf pages without invoking disk/memory filesort buffers.
5. **SARGable Query Rewriting:** Eliminating non-SARGable column-wrapping functions (`YEAR(Joining_Date) = 2022`) by rewriting into half-open date range comparisons (`Joining_Date >= '2022-01-01' AND Joining_Date < '2023-01-01'`) to enable index range scans.

---

## 📖 Theory & Core Concepts

Database query optimization relies on cost-based estimations to choose the most efficient physical execution path.

### 1. Index Access Paths in MySQL
- **`ALL` (Full Table Scan):** The engine reads every data page from storage. Unindexed queries on large tables suffer linear time complexity $O(N)$ and heavy disk I/O.
- **`range` (Index Range Scan):** The optimizer traverses the B-Tree to find the lower bound, then scans along the leaf node linked list until the upper bound is reached.
- **`ref` (Index Lookup):** Matches a constant value against a non-unique B-Tree index in $O(\log N)$ time.

### 2. SARGable vs Non-SARGable Predicates
- **SARGable (Search Argument Able):** A condition structured so that the database engine can directly exploit an index (e.g., `col >= val1 AND col < val2`).
- **Non-SARGable:** Any predicate where the indexed column is enclosed inside a function, mathematical expression, or implicit type conversion (e.g., `YEAR(Joining_Date) = 2022`, `UPPER(City) = 'DELHI'`). Because the database cannot predict function outputs across the B-Tree in advance, it is forced to abandon the index and evaluate the function for all 10,000 rows.

### 3. Sorting Optimization (`ORDER BY` without Filesort)
When a query combines a filter and a sort (`WHERE Department = 'HR' ORDER BY Salary DESC`), creating a composite index on `(Department, Salary)` allows the engine to locate all `'HR'` records in the index and read them out in pre-sorted order, entirely eliminating the expensive `Using filesort` step.

---

## 📁 Experiment 10 Files

```tree
Experiment-10/
├── 01_dataset_generation_10k.sql         # Employees schema & 10,000 records procedural synthesis
├── 02_five_slow_queries_unindexed.sql    # 5 slow queries baseline diagnosis with EXPLAIN
├── 03_indexing_and_optimized_explain.sql # Single & composite indexes + optimized EXPLAIN plans
├── 04_query_rewriting_sargable.sql       # SARGable query rewriting & date index range scan
└── complete_experiment10.sql             # Unified executable script for entire Experiment 10
```

---

## 🚀 Getting Started / Execution Guide (Experiment 10)

### Method 1: Using MySQL Command Line Client

1. Open your terminal in the repository root directory.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the complete unified script:
   ```sql
   SOURCE Experiment-10/complete_experiment10.sql;
   ```
   *Or execute step-by-step:*
   ```sql
   SOURCE Experiment-10/01_dataset_generation_10k.sql;
   SOURCE Experiment-10/02_five_slow_queries_unindexed.sql;
   SOURCE Experiment-10/03_indexing_and_optimized_explain.sql;
   SOURCE Experiment-10/04_query_rewriting_sargable.sql;
   ```

### Method 2: Using MySQL Workbench

1. Open **MySQL Workbench** and connect to your database instance.
2. Open `Experiment-10/complete_experiment10.sql`.
3. Click the ⚡ **Execute (All Queries)** button. (Bulk generation of 10,000 rows takes ~3-8 seconds).

---

## 📊 Step-by-Step SQL Implementation

### 1. Creating Table & Populating 10,000 Records
```sql
CREATE DATABASE IF NOT EXISTS EnterpriseDB;
USE EnterpriseDB;

CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10, 2),
    Joining_Date DATE
);

DELIMITER $$
CREATE PROCEDURE GenerateEmployees()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= 10000 DO
        INSERT INTO Employees VALUES (
            i,
            CONCAT('Employee_', i),
            ELT((i % 5) + 1, 'IT', 'HR', 'Sales', 'Finance', 'Marketing'),
            ELT((i % 4) + 1, 'Delhi', 'Mumbai', 'Lucknow', 'Pune'),
            20000 + (i % 50000),
            DATE_ADD('2020-01-01', INTERVAL (i % 2000) DAY)
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL GenerateEmployees();

SELECT COUNT(*) AS Total_Records FROM Employees;
```

---

### 2. Five Slow Queries (Before Optimization - Unindexed)
```sql
-- Query 1: Search by Department
EXPLAIN SELECT * FROM Employees WHERE Department = 'IT';

-- Query 2: Search by City
EXPLAIN SELECT * FROM Employees WHERE City = 'Delhi';

-- Query 3: Salary Filtering (Range Query)
EXPLAIN SELECT * FROM Employees WHERE Salary > 50000;

-- Query 4: Multiple Conditions (Department + City)
EXPLAIN SELECT * FROM Employees WHERE Department = 'Sales' AND City = 'Mumbai';

-- Query 5: Sorting and Filtering (Filesort)
EXPLAIN SELECT * FROM Employees WHERE Department = 'HR' ORDER BY Salary DESC;
```

---

### 3. Creating Optimization Indexes
```sql
-- Single Column Indexes
CREATE INDEX idx_department ON Employees(Department);
CREATE INDEX idx_city ON Employees(City);
CREATE INDEX idx_salary ON Employees(Salary);

-- Composite Indexes
CREATE INDEX idx_dept_city ON Employees(Department, City);
CREATE INDEX idx_dept_salary ON Employees(Department, Salary);
```

---

### 4. Five Optimized Queries (After Indexing)
```sql
-- Optimized Query 1: Single index on Department
EXPLAIN SELECT * FROM Employees WHERE Department = 'IT';

-- Optimized Query 2: Single index on City
EXPLAIN SELECT * FROM Employees WHERE City = 'Delhi';

-- Optimized Query 3: Range scan on Salary
EXPLAIN SELECT * FROM Employees WHERE Salary > 50000;

-- Optimized Query 4: Composite index lookup on Department & City
EXPLAIN SELECT * FROM Employees WHERE Department = 'Sales' AND City = 'Mumbai';

-- Optimized Query 5: Composite index lookup avoiding filesort
EXPLAIN SELECT * FROM Employees WHERE Department = 'HR' ORDER BY Salary DESC;
```

---

### 5. SARGable Query Rewriting Optimization
```sql
-- Add index on Date column
CREATE INDEX idx_joining_date ON Employees(Joining_Date);

-- Non-SARGable Query (Before: Full Table Scan despite index)
EXPLAIN SELECT * FROM Employees
WHERE YEAR(Joining_Date) = 2022;

-- SARGable Query (After: Uses Index Range Scan on idx_joining_date)
EXPLAIN SELECT * FROM Employees
WHERE Joining_Date >= '2022-01-01'
AND Joining_Date < '2023-01-01';
```

---

## 📋 Expected Outputs & Execution Verification

### 1. Generated Employee Dataset (Sample 9 Records)
```
+--------+------------+------------+---------+----------+--------------+
| Emp_ID | Emp_Name   | Department | City    | Salary   | Joining_Date |
+--------+------------+------------+---------+----------+--------------+
|      1 | Employee_1 | HR         | Mumbai  | 20001.00 | 2020-01-02   |
|      2 | Employee_2 | Sales      | Lucknow | 20002.00 | 2020-01-03   |
|      3 | Employee_3 | Finance    | Pune    | 20003.00 | 2020-01-04   |
|      4 | Employee_4 | Marketing  | Delhi   | 20004.00 | 2020-01-05   |
|      5 | Employee_5 | IT         | Mumbai  | 20005.00 | 2020-01-06   |
|      6 | Employee_6 | HR         | Lucknow | 20006.00 | 2020-01-07   |
|      7 | Employee_7 | Sales      | Pune    | 20007.00 | 2020-01-08   |
|      8 | Employee_8 | Finance    | Delhi   | 20008.00 | 2020-01-09   |
|      9 | Employee_9 | Marketing  | Mumbai  | 20009.00 | 2020-01-10   |
+--------+------------+------------+---------+----------+--------------+
```

### 2. Five Slow Queries — Before Optimization (`EXPLAIN`)
```
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 9948 |    10.00 | Using where                 |
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 9948 |    10.00 | Using where                 |
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 9948 |    33.33 | Using where                 |
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 9948 |     1.00 | Using where                 |
|  1 | SIMPLE      | Employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 9948 |    10.00 | Using where; Using filesort |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-----------------------------+
```
*(Every single query resulted in a full table scan `type = ALL` evaluating 9,948 ~ 10,000 rows. Query 5 incurred an expensive `Using filesort`).*

### 3. Five Optimized Queries — After Optimization (`EXPLAIN`)
```
+----+-------------+-----------+------------+-------+----------------------------------------------------+-----------------+---------+-------------+------+----------+-----------------------+
| id | select_type | table     | partitions | type  | possible_keys                                      | key             | key_len | ref         | rows | filtered | Extra                 |
+----+-------------+-----------+------------+-------+----------------------------------------------------+-----------------+---------+-------------+------+----------+-----------------------+
|  1 | SIMPLE      | Employees | NULL       | ref   | idx_department,idx_dept_city,idx_dept_salary       | idx_department  | 123     | const       | 2000 |   100.00 | NULL                  |
|  1 | SIMPLE      | Employees | NULL       | ref   | idx_city                                           | idx_city        | 123     | const       | 2500 |   100.00 | NULL                  |
|  1 | SIMPLE      | Employees | NULL       | range | idx_salary                                         | idx_salary      | 6       | NULL        |    1 |   100.00 | Using index condition |
|  1 | SIMPLE      | Employees | NULL       | ref   | idx_department,idx_city,idx_dept_city,idx_dept_... | idx_dept_city   | 246     | const,const |  500 |   100.00 | NULL                  |
|  1 | SIMPLE      | Employees | NULL       | ref   | idx_department,idx_dept_city,idx_dept_salary       | idx_dept_salary | 123     | const       | 2000 |   100.00 | NULL                  |
+----+-------------+-----------+------------+-------+----------------------------------------------------+-----------------+---------+-------------+------+----------+-----------------------+
```

### 4. Query Rewriting Comparison Results (Year 2022)
```
+--------+--------------+------------+---------+----------+--------------+
| Emp_ID | Emp_Name     | Department | City    | Salary   | Joining_Date |
+--------+--------------+------------+---------+----------+--------------+
|    731 | Employee_731 | HR         | Pune    | 20731.00 | 2022-01-01   |
|    732 | Employee_732 | Sales      | Delhi   | 20732.00 | 2022-01-02   |
|    733 | Employee_733 | Finance    | Mumbai  | 20733.00 | 2022-01-03   |
|    734 | Employee_734 | Marketing  | Lucknow | 20734.00 | 2022-01-04   |
|    735 | Employee_735 | IT         | Pune    | 20735.00 | 2022-01-05   |
|    736 | Employee_736 | HR         | Delhi   | 20736.00 | 2022-01-06   |
|    737 | Employee_737 | Sales      | Mumbai  | 20737.00 | 2022-01-07   |
|    738 | Employee_738 | Finance    | Lucknow | 20738.00 | 2022-01-08   |
|    739 | Employee_739 | Marketing  | Pune    | 20739.00 | 2022-01-09   |
+--------+--------------+------------+---------+----------+--------------+
```
*(Both queries return identical result sets, but the rewritten SARGable query utilizes `idx_joining_date` via index range scan instead of full table scanning 10,000 rows).*

---

## 💡 Important Observations

- **Comprehensive Optimization:** Query performance cannot rely solely on adding indexes; queries must be written in a **SARGable** format so the query optimizer can utilize those indexes.
- **Filesort Elimination:** Composite indexes matching both the filter predicate and the sort column (`idx_dept_salary`) eliminate memory-intensive sort operations (`Using filesort`), yielding orders-of-magnitude faster response times.
- **Index Selectivity & Cardinality:** When combining columns in composite indexes, placing the equality predicate column first (`Department`) followed by range or sort columns (`Salary`) satisfies the leftmost prefix requirement.
- **Cost-Based Decisions:** The optimizer chooses indexes only when the estimated cost is lower than a table scan; if a query matches >30-40% of a table, MySQL may deliberately select a sequential table scan.

---

## 📈 Experiment 10 Results & Conclusion

A large-scale enterprise dataset of 10,000 employee records was successfully generated and benchmarked. Five slow queries characterized by full table scans (`type = ALL`) and sort buffer overheads (`Using filesort`) were diagnosed using `EXPLAIN`. Single-column and composite B-Tree indexes were created, improving access types to `ref` and `range` and drastically reducing scanned rows (from ~10,000 to 500 or fewer). Finally, SARGable query rewriting demonstrated how replacing function-wrapped expressions with range comparisons unlocks index usage and achieves optimal query performance.




