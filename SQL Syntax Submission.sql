
-- 1. Create a new database
CREATE DATABASE AxiaStores;


-- 2.i Create CustomerTB and insert records
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




-- 2.ii Create ProductTB and insert records
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



-- 2.iii Create OrdersTB and insert records
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



-- 4. Customers who purchased “Wireless Mouse”
SELECT FirstName, Email
FROM CustomerTB
WHERE CustomerID IN (
    SELECT CustomerID
    FROM OrdersTB
    WHERE ProductID = (
        SELECT ProductID FROM ProductTB WHERE ProductName = 'Wireless Mouse'
    )
);



-- 5. Customers’ full names in alphabetical order
SELECT LastName + ' ' + FirstName AS FullName
FROM CustomerTB
ORDER BY LastName, FirstName;



-- 6. Detailed order summary
SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    p.ProductName,
    o.Quantity,
    p.UnitPrice,
    (o.Quantity * p.UnitPrice) AS TotalPrice,
    o.OrderDate
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductTB p ON o.ProductID = p.ProductID;



-- 7. Average sales per product category
SELECT 
    p.Category,
    AVG(o.Quantity * p.UnitPrice) AS AverageSales
FROM OrdersTB o
JOIN ProductTB p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY AverageSales DESC;



-- 8. City with highest revenue
SELECT TOP 1 
    c.City,
    SUM(o.Quantity * p.UnitPrice) AS TotalRevenue
FROM OrdersTB o
JOIN CustomerTB c ON o.CustomerID = c.CustomerID
JOIN ProductTB p ON o.ProductID = p.ProductID
GROUP BY c.City
ORDER BY TotalRevenue DESC;
