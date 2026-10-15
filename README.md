# DBMS Practical File

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

A structured laboratory repository containing practical experiments, relational schema designs, datasets, and SQL query suites for **Database Management Systems (DBMS) Lab**.

---

## 📑 Index of Practical Experiments

| Exp No. | Experiment Title | Folder / Code | Status |
| :---: | :--- | :---: | :---: |
| **01** | *Experiment 1* | — | ⏳ Upcoming |
| **02** | *Experiment 2* | — | ⏳ Upcoming |
| **03** | **Employee–Department–Project Schema** | [`📁 Experiment-3`](./Experiment-3) | ✅ Completed |
| **04** | **Advanced SQL Queries & Execution Plans** | [`📁 Experiment-4`](./Experiment-4) | ✅ Completed |

---

## 📁 Repository Structure

```tree
DBMS-Practical-File-/
├── README.md                   # Master practical documentation & experiment index
├── .gitignore
├── Experiment-3/               # Experiment 3: Employee-Department-Project Schema
│   ├── schema.sql              # Database creation and table definitions
│   ├── data.sql                # Dataset insertion (5 depts, 30 employees, 8 projects)
│   ├── queries.sql             # 18 Categorized SQL queries (A to G)
│   └── database_complete.sql   # Unified all-in-one executable script
└── Experiment-4/               # Experiment 4: Advanced SQL Queries & EXPLAIN Plans
    ├── advanced_queries.sql    # 8 Advanced queries (Joins, Subqueries, Sets)
    ├── explain_plans.sql       # EXPLAIN execution plan analysis
    └── complete_experiment4.sql# Unified executable script for Experiment 4
```

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
   SOURCE Experiment-3/database_complete.sql;
   ```
   *Or run modularly:*
   ```sql
   SOURCE Experiment-3/schema.sql;
   SOURCE Experiment-3/data.sql;
   SOURCE Experiment-3/queries.sql;
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
Experiment-4/
├── advanced_queries.sql    # 8 Advanced SQL queries (Joins, Subqueries, Sets)
├── explain_plans.sql       # 4 Query execution plan analysis scripts
└── complete_experiment4.sql# Unified script running all queries and EXPLAIN statements
```

---

## 🚀 Getting Started / Execution Guide (Experiment 4)

Make sure the `CompanyDB` database from Experiment 3 is already created and populated.

```sql
USE CompanyDB;
SOURCE Experiment-4/complete_experiment4.sql;
```

*Or execute components individually:*
```sql
SOURCE Experiment-4/advanced_queries.sql;
SOURCE Experiment-4/explain_plans.sql;
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
