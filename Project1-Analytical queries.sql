-- TOTAL SALES BY EACH CUSTOMER
SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id;

-- BEST SELLING PRODUCTS 
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id
ORDER BY total_sold DESC;

-- MONTHLY REVENUE 
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month, SUM(p.price * oi.quantity) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');

-- VIEWS FOR REUSABLE REPORTS 
CREATE VIEW customer_spending AS
SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id;

-- STORED PROCEDURE FOR AUTOMATION 
DELIMITER //
CREATE PROCEDURE get_customer_orders(IN cid INT)
BEGIN
    SELECT o.order_id, o.order_date, p.product_name, oi.quantity
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.customer_id = cid;
END //

DELIMITER ;

CALL get_customer_orders(1);











