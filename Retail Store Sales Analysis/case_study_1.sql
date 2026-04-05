SHOW DATABASES;
USE business_case_large;
SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;

SELECT * FROM customers LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM orders LIMIT 10;

SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT SUM(total_amount) AS total_revenue FROM orders;

SELECT YEAR(order_date) AS year,
SUM(total_amount) AS revenue
FROM orders
GROUP BY year;

SELECT YEAR(order_date), MONTH(order_date),
SUM(total_amount) AS revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;

SELECT customer_id,
SUM(total_amount) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;

SELECT customer_id,
MAX(order_date) AS last_order
FROM orders
GROUP BY customer_id;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) < DATE_SUB('2024-09-30', INTERVAL 6 MONTH);

SELECT p.product_name,
SUM(o.total_amount) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

SELECT p.category,
SUM(o.total_amount) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category;