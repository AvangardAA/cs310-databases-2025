INSERT INTO customers
SELECT
	i as customer_id
	'Customer' || i AS customer_name,
	CASE (i % 5)
		WHEN 0 THEN 'Europe'
		WHEN 1 THEN 'Asia'
		WHEN 2 THEN 'US'
		WHEN 3 THEN 'Africa'
		ELSE 'KSE'
	END AS region
FROM range(1000000) as t(i);

INSERT INTO products
SELECT
	i AS product_id,
	'Product' || i AS product_name,
	CASE
		WHEN (i % 10) < 3 THEN 'Electronic'
		WHEN (i % 10) < 6 THEN 'Home'
		ELSE 'KSE'
	END AS category,
	round(random() * 100 + 10, 2) AS price
FROM range(1000000) as t(i);

INSERT INTO orders
SELECT
	i AS order_id,
	(random() * 999999)::INTEGER AS customer_id,
	(random() * 999999)::INTEGER AS product_id,
	date_add(DATE '2024-01-01', (random() * 1000)::INTEGER) AS order_date,
	(random() * 10 + 1)::INTEGER AS quantity,
	round(random() * 500 + 20, 2) AS total_amt
FROM range(1000000) as t(i);
