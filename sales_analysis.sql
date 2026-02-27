-- ============================================
-- SQL Sales Company Analysis Project
-- ============================================

-- STEP 1: Create Database
CREATE DATABASE sales_company;
USE sales_company;

-- ============================================
-- STEP 2: Create Sales Table
-- ============================================

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    product VARCHAR(50),
    region VARCHAR(50),
    quantity INT,
    price INT
);

-- ============================================
-- STEP 3: Insert Sales Data
-- ============================================

INSERT INTO sales (order_date, product, region, quantity, price) VALUES
('2024-01-01','Mobile','South',5,15000),
('2024-01-02','Laptop','North',3,50000),
('2024-01-03','Tablet','East',4,20000),
('2024-01-04','Mobile','West',6,15000),
('2024-01-05','Laptop','South',2,50000),
('2024-02-01','Mobile','North',7,15000),
('2024-02-03','Tablet','South',3,20000),
('2024-02-05','Laptop','West',4,50000),
('2024-03-01','Mobile','East',8,15000),
('2024-03-02','Tablet','North',6,20000);

-- ============================================
-- STEP 4: Business Analysis Queries
-- ============================================

-- 1️⃣ Total Company Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM sales;

-- 2️⃣ Revenue by Region (Highest First)
SELECT region,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;

-- 3️⃣ Monthly Revenue Analysis
SELECT MONTH(order_date) AS month,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;

-- 4️⃣ Revenue by Product
SELECT product,
       SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;

-- 5️⃣ Average Order Value
SELECT AVG(quantity * price) AS average_order_value
FROM sales;

-- 6️⃣ Orders Above Average Value
SELECT *
FROM sales
WHERE (quantity * price) >
      (SELECT AVG(quantity * price) FROM sales);

-- 7️⃣ Data Validation (Check Zero Values)
SELECT *
FROM sales
WHERE quantity <= 0 OR price <= 0;

-- ============================================
-- END OF PROJECT
-- ============================================
