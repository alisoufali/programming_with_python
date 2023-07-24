CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NULL DEFAULT NULL
);

CREATE TABLE order_shop (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NULL DEFAULT NULL,
    customer_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(id)
);

INSERT INTO customer (name) VALUES('Jane');
INSERT INTO customer (name) VALUES('John');
INSERT INTO customer (name) VALUES('Mary');
INSERT INTO customer (name) VALUES('Paul');

INSERT INTO order_shop (name, customer_id) VALUES('Apple', 1);
INSERT INTO order_shop (name, customer_id) VALUES('Banana', 2);
INSERT INTO order_shop (name, customer_id) VALUES('Orange', 3);
INSERT INTO order_shop (name, customer_id) VALUES('Mango', 4);
INSERT INTO order_shop (name, customer_id) VALUES('Pear', 1);
INSERT INTO order_shop (name, customer_id) VALUES('Banana', 3);

SELECT customer.name AS customer_name, order_shop.name AS product FROM
	customer INNER JOIN order_shop on customer.id = order_shop.customer_id;