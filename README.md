# SQL-Project

## Project Overview
This project presents a comprehensive SQL-based solution for AxiaStores, an electronics and accessories retail business. It involves designing and implementing a relational database with three core tables: Customer, Product, and Orders. While performing various analytical queries to extract insights.


## Table of Contents
- [Project Overview](#project-overview)
- [Objectives](#objectives)
- [Tools and Methodologies](#tools-and-methodologies)
- [Key Analytical Questions](#key-analytical-questions)
- [Samples of SQL Queries and Results](#samples-of-sql-queries-and-results)
- [Answers to Analytical Questions and Results](#answers-to-analytical-questions-and-results)
- [References](#references)


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

2. **CREATING CustomerTB and Populating the Table**
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

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/caa49f93629a343277464000901aba0dd388753c/CustomerTB.png)


3. **CREATING ProductsTB and Populating the Table**
<pre>
CREATE TABLE ProductTB (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQty INT
);
INSERT INTO ProductTB VALUES
(1, 'Wireless Mouse', 'Accessories', 7500, 120),
(2, 'USB-C Charger 65W', 'Electronics', 14500, 75),
(3, 'Noise-Cancel Headset', 'Audio', 85500, 50),
(4, '27" 4K Monitor', 'Displays', 185000, 20),
(5, 'Laptop Stand', 'Accessories', 19500, 90),
(6, 'Bluetooth Speaker', 'Audio', 52000, 60),
(7, 'Mechanical Keyboard', 'Accessories', 18500, 40),
(8, 'WebCam 1080p', 'Electronics', 25000, 55),
(9, 'Smartwatch Series 5', 'Wearables', 320000, 30),
(10, 'Portable SSD 1TB', 'Storage', 125000, 35);
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/a68e7354c4b1271aafea1bc98d07cedd7ea2b9b9/ProductsTB.png)

4. **CREATING OrdersTB and Populating the Table**
<pre>
CREATE TABLE OrdersTB (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES CustomerTB(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductTB(ProductID)
);
INSERT INTO OrdersTB VALUES
(1001, 1, 3, '2025-06-01', 1),
(1002, 2, 1, '2025-06-03', 2),
(1003, 3, 5, '2025-06-05', 1),
(1004, 4, 4, '2025-06-10', 1),
(1005, 5, 2, '2025-06-12', 3),
(1006, 6, 7, '2025-06-15', 1),
(1007, 7, 6, '2025-06-18', 2),
(1008, 8, 8, '2025-06-20', 1),
(1009, 9, 9, '2025-06-22', 1),
(1010, 10, 10, '2025-06-25', 2);
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/000bda8c6bc6fed32ca6704cedbe04188cf2382e/OrderTB.png)


## Answers to Analytical Questions and Results

1. **Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”**
<pre>
--Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”
SELECT FirstName, Email
FROM CustomerTB
WHERE CustomerID IN (
    SELECT CustomerID
    FROM OrdersTB
    WHERE ProductID = (
        SELECT ProductID FROM ProductsTB WHERE ProductName = 'Wireless Mouse'
    )
);
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/6bb60761f91bb1eb207c8c7d12a5189eb5e1c760/Purchase_product%20wireless.png)


2. **List all customers’ full names in ascending alphabetical order (LastName, then 
FirstName)**
<pre>
SELECT LastName + ' ' + FirstName AS FullName
FROM CustomerTB
ORDER BY LastName ASC, FirstName ASC;
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/c56f640ccc7a70ce9e262420bd9d5f4c10e22031/Customer_Fullnames.png)


3. **Show every order together with the customer’s full name, the product name, quantity, 
      unit price, total price (quantity × unit price), and order date.**
<pre>
  SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.ProductName,
    o.Quantity,
    p.UnitPrice,
    (o.Quantity * p.UnitPrice) AS TotalPrice,
    o.OrderDate
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductsTB p ON o.ProductID = p.ProductID;
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/2de689f1333818b0f8fcf5fba763ad45ac880e56/Detailed_Order_Summary.png)


4. **Show average sales per product category and sort in descending order**
<pre>
  SELECT 
    p.Category,
    AVG(o.Quantity * p.UnitPrice) AS AverageSales
FROM OrdersTB o
JOIN ProductsTB p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageSales DESC;
</pre>

![image alt](https://github.com/Its-Lilianne/SQL-Project/blob/9f6dde87d9f189f4bb1e99bf9c4affb1ebaaab0e/Average_Result.png)


5. **Which city generated the highest revenue for AxiaStores?**
<pre>
  SELECT TOP 1 
    c.City,
    SUM(o.Quantity * p.UnitPrice) AS TotalRevenue
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductsTB p ON o.ProductID = p.ProductID
GROUP BY c.City
ORDER BY TotalRevenue DESC;
</pre>

![image alt]()


### References
- [Axia Africa SQL Exam](https://drive.google.com/file/d/13chnDFUr7NqbyPSRqy65d9pgeVCM86Ix/view)
- [Axia Africa](https://student.axia.africa)
