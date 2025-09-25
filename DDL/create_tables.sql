CREATE TABLE Products (
	product_id INT PRIMARY KEY,
	name VARCHAR(50),
	category VARCHAR(50),
	price DECIMAL(10, 2)
);

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	city VARCHAR(50)
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	total DECIMAL(10, 2),
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
	item_id INT PRIMARY KEY,
	order_id INT,
	product_id INT,
	qty INT,
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Reviews (
	review_id INT PRIMARY KEY,
	customer_id INT,
	product_id INT,
	rating INT CHECK (rating BETWEEN 1 AND 5),
	comment TEXT,
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
