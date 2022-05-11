--- 11-05-2022 08:05:15
--- SQLite.1
CREATE TABLE products(
  id INT NOT NULL,
  name STRING,
  price MONEY,
  PRIMARY KEY (id)
);

--- 11-05-2022 08:06:52
--- SQLite.1
/***** ERROR ******
no such column: pen
 ----- 
INSERT INTO products
VALUES(1, pen, 1.2);
*****/

--- 11-05-2022 08:07:00
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:07:17
--- SQLite.1
INSERT INTO products
VALUES(1, 'pen', 1.2);

--- 11-05-2022 08:07:20
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:08:54
--- SQLite.1
INSERT INTO products(id,name)
VALUES(2, "pencil");

--- 11-05-2022 08:09:00
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:11:18
--- SQLite.1
/***** ERROR ******
near "FROM": syntax error
 ----- 
SELECT name, price * FROM products;
*****/

--- 11-05-2022 08:11:26
--- SQLite.1
/***** ERROR ******
near "FROM": syntax error
 ----- 
SELECT name, price * FROM products ;
*****/

--- 11-05-2022 08:11:50
--- SQLite.1
SELECT name, price  FROM products ;

--- 11-05-2022 08:12:08
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:14:17
--- SQLite.1
SELECT * FROM products WHERE id=1;

--- 11-05-2022 08:48:37
--- SQLite.1
UPDATE products
SET price = 0.80
WHERE id=2;

--- 11-05-2022 08:48:41
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:51:20
--- SQLite.1
ALTER TABLE products
add stock INT;

--- 11-05-2022 08:51:23
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:53:40
--- SQLite.1
UPDATE products
SET stock = 32
WHERE id=1;

--- 11-05-2022 08:53:45
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:53:57
--- SQLite.1
UPDATE products
SET stock = 12
WHERE id=2;

--- 11-05-2022 08:53:59
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 08:58:09
--- SQLite
DELETE FROM products
WHERE name = "pencil";

--- 11-05-2022 08:58:12
--- SQLite
SELECT * FROM products;

--- 11-05-2022 09:21:43
--- SQLite.1
/***** ERROR ******
near "/": syntax error
 ----- 
INSERT INTO products
VALUES(1, 'pencil', 0.80, 12) //input data ke table;
*****/

--- 11-05-2022 09:21:49
--- SQLite.1
/***** ERROR ******
UNIQUE constraint failed: products.id
 ----- 
INSERT INTO products
VALUES(1, 'pencil', 0.80, 12);
*****/

--- 11-05-2022 09:21:55
--- SQLite.1
INSERT INTO products
VALUES(2, 'pencil', 0.80, 12);

--- 11-05-2022 09:21:58
--- SQLite.1
SELECT * FROM products;

--- 11-05-2022 10:00:35
--- SQLite.1
CREATE TABLE orders(
  id INT NOT NULL,
  order_number INT,
  customer_id INT,
  product_id INT,
  PRIMARY KEY (id)
  FOREIGN KEY (customer_id) REFERENCES customers (id),
  FOREIGN key (product_id) REFERENCES products (id)
  );

--- 11-05-2022 10:01:47
--- SQLite.1
SELECT * FROM orders;

--- 11-05-2022 10:02:06
--- SQLite
SELECT `sql` FROM `sqlite_master` WHERE name LIKE 'orders' AND type LIKE 'table';

--- 11-05-2022 10:03:38
--- SQLite
DELETE FROM demo;

--- 11-05-2022 10:03:48
--- SQLite
DROP TABLE demo;

--- 11-05-2022 10:05:08
--- SQLite
CREATE TABLE "customers" (
  id INT NOT NULL,
  first_name STRING,
  last_name STRING,
  address STRING
  );

--- 11-05-2022 10:05:44
--- SQLite
SELECT `sql` FROM `sqlite_master` WHERE name LIKE 'customers' AND type LIKE 'table';

--- 11-05-2022 10:06:22
--- SQLite
/***** ERROR ******
table customers has 4 columns but 3 values were supplied
 ----- 
INSERT INTO customers
VALUES ("Jhon", "Doe", "32 Cherry Blvd");
*****/

--- 11-05-2022 10:06:30
--- SQLite
INSERT INTO customers
VALUES (1, "Jhon", "Doe", "32 Cherry Blvd");

--- 11-05-2022 10:06:34
--- SQLite
SELECT * FROM customers;

--- 11-05-2022 10:07:16
--- SQLite
insert into customers
VALUES (2, "Angela", "Yu", "12 Sunset Drive");

--- 11-05-2022 10:07:21
--- SQLite
SELECT * FROM customers;

--- 11-05-2022 10:07:35
--- SQLite
SELECT * FROM products;

--- 11-05-2022 10:10:58
--- Schema customers
SELECT * FROM orders;

--- 11-05-2022 10:12:02
--- Schema customers
insert into orders
values (1, 4362, 2, 1);

--- 11-05-2022 10:17:50
--- Schema customers
SELECT orders.order_number, customers.first_name, customers.last_name, customers.address
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.id;

--- 11-05-2022 10:20:15
--- Schema customers
SELECT * FROM orders;

--- 11-05-2022 10:20:20
--- Schema customers
SELECT orders.order_number, customers.first_name, customers.last_name, customers.address
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.id;

--- 11-05-2022 10:23:49
--- Schema customers
/***** ERROR ******
no such column: orders.products_id
 ----- 
SELECT orders.order_number, products.name, products.price, products.stock
FROM orders
INNER JOIN products
ON orders.products_id = products.id;
*****/

--- 11-05-2022 10:24:04
--- Schema customers
SELECT orders.order_number, products.name, products.price, products.stock
FROM orders
INNER JOIN products
ON orders.product_id = products.id;

