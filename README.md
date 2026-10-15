# DBMS Lab – Experiment 1: Employee–Department–Project Schema

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-CompanyDB-005C84?style=for-the-badge&logo=databricks&logoColor=white)](https://github.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

A complete relational database implementation and SQL query suite based on the **Employee–Department–Project** schema. This repository contains end-to-end SQL scripts covering database design, relational integrity constraints (Primary Keys & Foreign Keys), multi-table insertions, and advanced SQL querying.

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

## 📁 Repository Structure

```tree
dbms-employee-department-project/
├── README.md               # Comprehensive documentation and lab report
├── schema.sql              # Database creation and table definitions
├── data.sql                # Complete mock dataset insertion (30 employees, 8 projects, etc.)
├── queries.sql             # All 18 categorized SQL queries
└── database_complete.sql   # Unified all-in-one executable script
```

---

## 🚀 Getting Started / Execution Guide

### Method 1: Using MySQL Command Line Client

1. Open your terminal or command prompt.
2. Log into MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the unified SQL script:
   ```sql
   SOURCE path/to/database_complete.sql;
   ```
   *Or run modularly:*
   ```sql
   SOURCE path/to/schema.sql;
   SOURCE path/to/data.sql;
   SOURCE path/to/queries.sql;
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

## 📈 Experiment Results & Conclusion

The **Employee–Department–Project** database schema was successfully modeled, populated, and evaluated. All primary key and foreign key constraints preserved referential integrity across the 30 employees, 5 departments, and 8 projects. All 18 queries demonstrating Selection, Projection, Aggregation (`AVG`, `MAX`, `MIN`, `SUM`, `COUNT`), `GROUP BY`, `HAVING`, `CASE` conditional logic, and `ORDER BY` executed accurately with valid results.
