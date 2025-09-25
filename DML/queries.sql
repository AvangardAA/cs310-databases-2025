-- JOIN
SELECT
	c.name AS customer_name,
	o.order_date,
	p.name AS product_name,
	oi.qty,
	r.rating,
	r.comment
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
LEFT JOIN Reviews r ON r.customer_id = c.customer_id;

-- CTE
WITH HighRating AS (
	SELECT product_id, AVG(rating) AS avg_rating
	FROM reviews
	GROUP BY product_id
	HAVING AVG(rating) >= 4
)
SELECT p.name, h.avg_rating
FROM Products p
JOIN HighRating h ON p.product_id = h.product_id;

-- SUBQUERY
SELECT name, price
FROM Products
WHERE product_id IN (
	SELECT product_id
	FROM Order_Items
	GROUP BY product_id
	HAVING SUM(qty) == 1
);

-- WHERE
SELECT * FROM Customers
WHERE city = 'Kyiv';

-- GROUP BY & HAVING
SELECT customer_id, COUNT(*) AS total_o
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) == 1;

-- ORDER BY
SELECT name, price
FROM products
ORDER BY price DESC;

-- LIMIT
SELECT * FROM Reviews
ORDER BY rating DESC
LIMIT 3;
