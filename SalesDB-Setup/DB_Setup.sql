/*
==============================================================================
                     SALES DATABASE SETUP 
==============================================================================
Tables   : 
  - sales: Order-level data (customers , orderdetails , orders , products)

Usage    : Run this before executing query files.
==============================================================================
*/

-- . Create the database
CREATE DATABASE SalesDB;

-- ================================
-- 1. Create Customers Table
-- ================================
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL );

-- ================================
-- 2. Create Products Table
-- ================================
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
	product_category VARCHAR(50) NOT NULL,
    price NUMERIC(10, 2) NOT NULL);

-- ================================
-- 3. Create Orders Table
-- ================================
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

-- ================================
-- 4. Create OrderDetails Table
-- ================================
CREATE TABLE OrderDetails (
    detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id));


SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;


