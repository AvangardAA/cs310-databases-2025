SELECT
	c.customer_name,
	p.category,
	SUM(o.total_amt) AS total_sales,
	COUNT(o.order_id) AS num_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE p.category IN ('Electronics', 'Home') AND o.order_date BETWEEN '2024-01-01' AND '2025-10-22'
GROUP BY c.customer_name, p.category
HAVING SUM(o.total_amt) > 10000
ORDER BY total_sales DESC
LIMIT 20;

WITH filter_orders AS(
	SELECT order_id, customer_id, product_id, total_amt
	FROM orders
	WHERE order_date BETWEEN '2024-01-01' AND '2025-10-22'
),
filter_products AS(
	SELECT product_id, category
	FROM products
	WHERE category IN ('Electronics', 'Home')
)
SELECT
	c.customer_name,
	p.category,
	SUM(o.total_amt) AS total_sales,
	COUNT(o.order_id) AS num_orders
FROM filter_orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN filter_products p ON o.product_id = p.product_id
GROUP BY c.customer_name, p.category
HAVING SUM(o.total_amt) > 10000
ORDER BY total_sales DESC
LIMIT 20;
