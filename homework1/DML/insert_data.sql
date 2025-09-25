INSERT INTO Products VALUES 
(1, 'dummy_product1', 'phone', 99.99), 
(2, 'dummy_product2', 'headset', 9.99), 
(3, 'dummy_product3', 'PC', 999.9), 
(4, 'dummy_product4', 'Pen', 9.9), 
(5, 'dummy_product5', 'Book', 99.9);

INSERT INTO Customers VALUES
(1, 'Mike Jones', 'mikejones@dummy.com', 'Kyiv'),
(2, 'Radric Davis', 'rdavis@dummy.com', 'Kyiv'),
(3, 'Tape LaFlare', 'tl@dummy.com', 'Kyiv'),
(4, 'Guwop', 'gw@dummy.com', 'Kyiv'),
(5, 'Mr. Perfect', 'perfect@dummy.com', 'Kyiv');

INSERT INTO Orders VALUES
(1, 1, '2025-09-01', 99.99),
(2, 2, '2025-09-02', 9.99),
(3, 3, '2025-09-01', 999.9),
(4, 4, '2025-09-02', 99.9),
(5, 5, '2025-09-03', 9.9);

INSERT INTO Order_Items VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 5, 1),
(5, 5, 4, 1);

INSERT INTO Reviews VALUES
(1, 1, 1, 5, 'good'),
(2, 2, 2, 4, 'almost good'),
(3, 3, 3, 3, 'ok'),
(4, 4, 5, 2, 'bad'),
(5, 5, 4, 1, 'so bad');
