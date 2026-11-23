-- ==============================================================================
-- DBMS Lab – Experiment 3: Employee–Department–Project Schema
-- File: data.sql
-- Description: Data insertion for Departments, Employees, Projects, and Assignments
-- ==============================================================================

USE CompanyDB;

-- 3. Insert Department Records (5 Departments)
INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES
(1, 'Artificial Intelligence', 'Chandigarh'),
(2, 'Software Development', 'Bangalore'),
(3, 'Cyber Security', 'Delhi'),
(4, 'Data Science', 'Pune'),
(5, 'Human Resources', 'Mumbai');

-- 4. Insert 30 Employee Records
INSERT INTO Employee (Emp_ID, Emp_Name, Job_Title, Salary, Hire_Date, Dept_ID) VALUES
-- Dept 1: Artificial Intelligence
(101, 'Aarav Sharma', 'AI Engineer', 85000.00, '2022-01-15', 1),
(102, 'Priya Verma', 'ML Engineer', 92000.00, '2021-06-20', 1),
(103, 'Rohan Gupta', 'AI Developer', 78000.00, '2023-03-10', 1),
(104, 'Ananya Singh', 'Research Engineer', 105000.00, '2020-08-12', 1),
(105, 'Karan Mehta', 'ML Engineer', 88000.00, '2022-11-05', 1),
(106, 'Neha Kapoor', 'AI Analyst', 72000.00, '2024-01-18', 1),

-- Dept 2: Software Development
(107, 'Rahul Kumar', 'Software Engineer', 75000.00, '2022-02-14', 2),
(108, 'Sneha Patel', 'Backend Developer', 82000.00, '2021-09-21', 2),
(109, 'Aditya Jain', 'Frontend Developer', 70000.00, '2023-05-17', 2),
(110, 'Simran Kaur', 'Full Stack Developer', 95000.00, '2020-11-10', 2),
(111, 'Vivek Mishra', 'Software Engineer', 78000.00, '2022-07-25', 2),
(112, 'Ishita Rao', 'QA Engineer', 65000.00, '2024-02-11', 2),

-- Dept 3: Cyber Security
(113, 'Arjun Malhotra', 'Security Engineer', 90000.00, '2021-04-16', 3),
(114, 'Megha Joshi', 'Cyber Security Analyst', 82000.00, '2022-10-09', 3),
(115, 'Yash Thakur', 'Security Consultant', 98000.00, '2020-06-13', 3),
(116, 'Pooja Nair', 'SOC Analyst', 68000.00, '2023-08-19', 3),
(117, 'Dev Patel', 'Security Engineer', 87000.00, '2022-12-01', 3),
(118, 'Tanvi Shah', 'Ethical Hacker', 91000.00, '2021-03-22', 3),

-- Dept 4: Data Science
(119, 'Akash Singh', 'Data Scientist', 100000.00, '2020-09-15', 4),
(120, 'Kriti Sharma', 'Data Analyst', 76000.00, '2022-05-12', 4),
(121, 'Mohit Agarwal', 'Data Scientist', 95000.00, '2021-11-18', 4),
(122, 'Riya Das', 'Data Analyst', 72000.00, '2023-04-07', 4),
(123, 'Nikhil Bansal', 'ML Data Scientist', 89000.00, '2022-08-30', 4),
(124, 'Sakshi Roy', 'BI Analyst', 74000.00, '2024-03-14', 4),

-- Dept 5: Human Resources
(125, 'Manish Verma', 'HR Manager', 85000.00, '2019-07-10', 5),
(126, 'Divya Mehta', 'HR Executive', 60000.00, '2022-01-25', 5),
(127, 'Suresh Kumar', 'Recruiter', 58000.00, '2023-06-18', 5),
(128, 'Ayesha Khan', 'HR Executive', 62000.00, '2021-10-11', 5),
(129, 'Varun Gupta', 'Training Manager', 73000.00, '2020-12-05', 5),
(130, 'Nandini Sharma', 'HR Analyst', 65000.00, '2024-04-20', 5);

-- 5. Insert 8 Project Records
INSERT INTO Project (Project_ID, Project_Name, Budget, Dept_ID) VALUES
(201, 'AI Recommendation System', 1500000.00, 1),
(202, 'Computer Vision Platform', 2000000.00, 1),
(203, 'E-Commerce Platform', 2500000.00, 2),
(204, 'Mobile Banking Application', 1800000.00, 2),
(205, 'Cyber Threat Detection', 2200000.00, 3),
(206, 'Security Monitoring System', 1700000.00, 3),
(207, 'Customer Analytics Platform', 1900000.00, 4),
(208, 'Employee Management System', 1200000.00, 5);

-- 6. Assign Employees to Projects (Employee_Project)
INSERT INTO Employee_Project (Emp_ID, Project_ID, Hours_Worked) VALUES
(101, 201, 120),
(102, 201, 150),
(103, 202, 100),
(104, 201, 180),
(105, 202, 140),
(106, 202, 90),
(107, 203, 160),
(108, 203, 180),
(109, 204, 130),
(110, 203, 200),
(111, 204, 150),
(112, 204, 100),
(113, 205, 170),
(114, 205, 140),
(115, 206, 190),
(116, 206, 120),
(117, 205, 160),
(118, 206, 150),
(119, 207, 200),
(120, 207, 140),
(121, 207, 180),
(122, 207, 120),
(123, 207, 160),
(124, 207, 100),
(125, 208, 180),
(126, 208, 140),
(127, 208, 120),
(128, 208, 150),
(129, 208, 160),
(130, 208, 110);
