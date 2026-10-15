-- ==============================================================================
-- DBMS Lab – Experiment 1: Employee–Department–Project Schema
-- File: schema.sql
-- Description: Database initialization and Table Definitions with Constraints
-- ==============================================================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- Drop existing tables to avoid conflict if re-executing (in reverse dependency order)
DROP TABLE IF EXISTS Employee_Project;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- 2. Create Tables

-- Department Table: Stores department information
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

-- Employee Table: Stores employee personal and professional records
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Job_Title VARCHAR(50),
    Salary DECIMAL(10, 2),
    Hire_Date DATE,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Project Table: Stores project details and funding
CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Budget DECIMAL(12, 2),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Employee_Project Table: Represents many-to-many relationship between Employees & Projects
CREATE TABLE Employee_Project (
    Emp_ID INT,
    Project_ID INT,
    Hours_Worked INT,
    PRIMARY KEY (Emp_ID, Project_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
