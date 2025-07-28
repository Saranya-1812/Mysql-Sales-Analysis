CREATE DATABASE OnlineStore;
USE OnlineStore;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT
);


INSERT INTO customers (name, email, city)
VALUES 
('Anu', 'anu@example.com', 'Chennai'),
('Ravi', 'ravi@example.com', 'Bangalore'),
('Priya', 'priya@example.com', 'Mumbai');

INSERT INTO products (product_name, category, price)
VALUES 
('Laptop', 'Electronics', 60000),
('Mouse', 'Electronics', 800),
('Table', 'Furniture', 3000);

INSERT INTO orders (customer_id, order_date)
VALUES 
(1, '2025-07-01'),
(2, '2025-07-02');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES 
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
