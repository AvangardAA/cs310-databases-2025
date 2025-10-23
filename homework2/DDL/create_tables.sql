CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	customer_name TEXT,
	region TEXT
);

CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY,
	customer_id INTEGER,
	product_id INTEGER,
	order_date DATE,
	quantity INTEGER,
	total_amt DOUBLE
);

CREATE TABLE products(
	product_id INTEGER PRIMARY KEY,
	product_name TEXT,
	category TEXT,
	price DOUBLE
);
