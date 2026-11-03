CREATE DATABASE Retail_Sales;
USE Retail_Sales;
select* from retail_sales_eda_dataset_50_rows;

CREATE TABLE Sales (
    Order_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Total_Sales DECIMAL(10,2),
    City VARCHAR(50)
);

INSERT INTO Sales VALUES
(101, 'Arun', 'Laptop', 'Electronics', 1, 45000, 45000, 'Chennai'),
(102, 'Priya', 'Mobile', 'Electronics', 2, 15000, 30000, 'Trichy'),
(103, 'Kumar', 'Chair', 'Furniture', 4, 2000, 8000, 'Madurai'),
(104, 'Divya', 'Table', 'Furniture', 2, 5000, 10000, 'Chennai'),
(105, 'Rahul', 'Headphones', 'Electronics', 3, 1000, 3000, 'Coimbatore'),
(106, 'Sneha', 'Keyboard', 'Accessories', 2, 800, 1600, 'Salem'),
(107, 'Vijay', 'Mouse', 'Accessories', 5, 400, 2000, 'Trichy'),
(108, 'Meena', 'Laptop', 'Electronics', 1, 50000, 50000, 'Madurai'),
(109, 'Ajith', 'Chair', 'Furniture', 3, 2500, 7500, 'Chennai'),
(110, 'Kavya', 'Mobile', 'Electronics', 1, 20000, 20000, 'Salem'),
(111, 'Ravi', 'Table', 'Furniture', 2, 4500, 9000, 'Coimbatore'),
(112, 'Nisha', 'Mouse', 'Accessories', 4, 500, 2000, 'Madurai'),
(113, 'Manoj', 'Laptop', 'Electronics', 2, 40000, 80000, 'Trichy'),
(114, 'Anu', 'Headphones', 'Electronics', 2, 1200, 2400, 'Chennai'),
(115, 'Suresh', 'Keyboard', 'Accessories', 3, 700, 2100, 'Salem');

##select
SELECT * FROM Sales;

select*from sales;
select customer_name,product,
total_sales
from sales;

## where
Select*from sales
where category = 'electronics';
select *from sales
where total_sales > 10000;

##order by
select *from sales
order by total_sales desc;
select *from sales
order by total_sales asc;

##sum
select sum(total_sales)as total_revenue
from sales;

##average
select avg(total_sales)as average_sales
from sales;
select count(*)as total_orders
from sales;

##group by
select category,sum(total_sales)as
category_sales
from sales
group by category;

##havings
select category,sum(total_sales)as
category_sales
from sales
group by category
having sum(total_sales) > 10000;

##create customers table
USE RetailSales;

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Trichy'),
(3, 'Kumar', 'Madurai'),
(4, 'Divya', 'Chennai'),
(5, 'Rahul', 'Coimbatore'),
(6, 'Sneha', 'Salem'),
(7, 'Vijay', 'Trichy'),
(8, 'Meena', 'Madurai'),
(9, 'Ajith', 'Chennai'),
(10, 'Kavya', 'Salem'),
(11, 'Ravi', 'Coimbatore'),
(12, 'Nisha', 'Madurai'),
(13, 'Manoj', 'Trichy'),
(14, 'Anu', 'Chennai'),
(15, 'Suresh', 'Salem');

SELECT * FROM Customers;


ALTER TABLE Sales
ADD Customer_ID INT;

UPDATE Sales SET Customer_ID = 1 WHERE Order_ID = 101;
UPDATE Sales SET Customer_ID = 2 WHERE Order_ID = 102;
UPDATE Sales SET Customer_ID = 3 WHERE Order_ID = 103;
UPDATE Sales SET Customer_ID = 4 WHERE Order_ID = 104;
UPDATE Sales SET Customer_ID = 5 WHERE Order_ID = 105;
UPDATE Sales SET Customer_ID = 6 WHERE Order_ID = 106;
UPDATE Sales SET Customer_ID = 7 WHERE Order_ID = 107;
UPDATE Sales SET Customer_ID = 8 WHERE Order_ID = 108;
UPDATE Sales SET Customer_ID = 9 WHERE Order_ID = 109;
UPDATE Sales SET Customer_ID = 10 WHERE Order_ID = 110;
UPDATE Sales SET Customer_ID = 11 WHERE Order_ID = 111;
UPDATE Sales SET Customer_ID = 12 WHERE Order_ID = 112;
UPDATE Sales SET Customer_ID = 13 WHERE Order_ID = 113;
UPDATE Sales SET Customer_ID = 14 WHERE Order_ID = 114;
UPDATE Sales SET Customer_ID = 15 WHERE Order_ID = 115;

##inner join

select
sales.order_id,
customers.customer_name,
sales.product,
sales.total_sales
from sales
inner join customers
on sales.customer_id = customers.customer_id;

##left join
SELECT
    Customers.Customer_Name,
    Customers.City,
    Sales.Product,
    Sales.Total_Sales
FROM Customers
LEFT JOIN Sales
ON Customers.Customer_ID = Sales.Customer_ID;

##right join
SELECT
    Sales.Order_ID,
    Sales.Product,
    Customers.Customer_Name,
    Customers.City
FROM Sales
RIGHT JOIN Customers
ON Sales.Customer_ID = Customers.Customer_ID;

##join with where
SELECT
    Customers.Customer_Name,
    Customers.City,
    Sales.Product,
    Sales.Total_Sales
FROM Sales
INNER JOIN Customers
ON Sales.Customer_ID = Customers.Customer_ID
WHERE Customers.City = 'Chennai';

##join with group by
SELECT
    Customers.Customer_Name,
    SUM(Sales.Total_Sales) AS Total_Sales
FROM Sales
INNER JOIN Customers
ON Sales.Customer_ID = Customers.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Customer_Name;

##join with order by
SELECT
    Customers.Customer_Name,
    Sales.Product,
    Sales.Total_Sales
FROM Sales
INNER JOIN Customers
ON Sales.Customer_ID = Customers.Customer_ID
ORDER BY Sales.Total_Sales DESC;

## self_join
SELECT
    S1.Product AS Product1,
    S2.Product AS Product2,
    S1.Category
FROM Sales S1
INNER JOIN Sales S2
ON S1.Category = S2.Category
AND S1.Order_ID < S2.Order_ID;

##cross join
SELECT
    S.Product,
    S.Total_Sales,
    C.Customer_Name,
    C.City
FROM Sales S
CROSS JOIN Customers C;