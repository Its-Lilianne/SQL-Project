# SQL-Project

## Project Overview
This project presents a comprehensive SQL-based solution for AxiaStores, an electronics and accessories retail business. It involves designing and implementing a relational database with three core tables: Customer, Product, and Orders. While performing various analytical queries to extract insights.

## Objectives
The primary goal of this project is to
1. Create a sample relational database
2. Creation of multiple tables within the database with appropriate data types and constraints:
3. Insertion of sample records into all tables
4. Query functions like:
  - Retriever of customer details
  - Sorting alphabetically
  - The use of the **JOIN function** for multiple tables
  - Use of aggregate functions like average and sum

## Tools and Methodologies 
**Tool Used:** **SQL SERVER MANAGEMENT STUDIO 21** [Download Here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

### The Process 
1. Open your SSMS
2. Load and execute the syntax like:

   i. **Create** a new database called **AxiaStores**
   
   ii. **Create** tables named **CustomerTB, ProductTB,** and **OrderTB** using proper data types and data constraints
   
   iii. **Populate** the created tables with the necessary/given data
   
   iv. Answer analytical questions and run queries, save, and document results for reporting insights.


## Key Analytical Questions
The queries in this project aim to answer the following key questions based on the AxiaStores dataset:
1. Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”
2. List all customers’ full names in ascending alphabetical order (LastName, then FirstName)
3. Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date
4. Show average sales per product category and sort in descending order
5. Which city generated the highest revenue for AxiaStores


## Samples of SQL Queries and results
Here are samples of key queries used in the project and their results:

1. **CREATING DATABASE**
<pre>
CREATE DATABASE [AxiaStores]; --SQL Server
</pre>

2. **CREATING CustomerTB**
<pre>
Create CustomerTB and insert records
CREATE TABLE CustomerTB (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    City VARCHAR(50)
);
INSERT INTO CustomerTB VALUES
(1, 'Musa', 'Ahmed', 'musa.ahmed@hotmail.com', '0803-123-0001', 'Lagos'),
(2, 'Ray', 'Samson', 'ray.samson@yahoo.com', '0803-123-0002', 'Ibadan'),
(3, 'Chinedu', 'Okafor', 'chinedu.ok@yahoo.com', '0803-123-0003', 'Enugu'),
(4, 'Dare', 'Adewale', 'dare.ad@hotmail.com', '0803-123-0004', 'Abuja'),
(5, 'Efe', 'Ojo', 'efe.oj@gmail.com', '0803-123-0005', 'Port Harcourt'),
(6, 'Aisha', 'Bello', 'aisha.bello@hotmail.com', '0803-123-0006', 'Kano'),
(7, 'Tunde', 'Salami', 'tunde.salami@yahoo.com', '0803-123-0007', 'Ilorin'),
(8, 'Nneka', 'Umeh', 'nneka.umeh@gmail.com', '0803-123-0008', 'Owerri'),
(9, 'Kelvin', 'Peters', 'kelvin.peters@hotmail.com', '0803-123-0009', 'Asaba'),
(10, 'Blessing', 'Mark', 'blessing.mark@gmail.com', '0803-123-0010', 'Uyo');
</pre>

![image alt]()

