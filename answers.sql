CREATE DATABASE inventorydb;

USE inventorydb;

-- Create tables using the database and insert data
-- Create the products table
CREATE TABLE products(
product_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
brand VARCHAR(100) NOT NULL,
category VARCHAR(100) NOT NULL,
sku VARCHAR(50)
);
INSERT INTO products(name, brand, category, sku)
VALUES ('Wireless mouse' , 'Logitech' , 'Accessories' , 'WM-001'),
	   ('Mechanical Keyboard' , 'Corsair' , 'Accessories' , 'MK-002'),
       ('USB-C Charger' , 'Anker' , 'Chargers' , 'UC-003');

       
CREATE TABLE stock(
stock_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
quantity INT,
location VARCHAR(50),
last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY(product_id) REFERENCES products(product_id)
);
INSERT INTO stock(product_id, quantity, location)
VALUES (1, 50, 'Nairobi'),
       (2, 55, 'Eldoret'),
       (3, 60, 'Thika'),
       (4, 70, 'Kajiado');
       
CREATE TABLE suppliers(
supplier_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL, 
phone VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL,
address VARCHAR(50)
);
INSERT INTO suppliers(name, phone, email, address)
VALUE ('Tech Distributors Ltd' , '0767889011', 'techdist@gmail.com' , 'Kitengela'),
      ('Gadget World' , '0776456212' , 'gadgetworld@gmail.com' 'Kayole'),
      ('Gib Techs' , '0708996574' , 'gitechs@gmail.com' 'Githunguri');
      
CREATE TABLE transactions(
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT NOT NULL,
supplier_id INT,
quantity_id INT NOT NULL,
type ENUM('IN', 'OUT') NOT NULL,
reason VARCHAR(50),
date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(product_id) REFERENCES products(product_id),
FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);
INSERT INTO transactions(product_id, supplier_id, quantity, type, reason)
VALUES (1, 1, 50, 'IN', 'Initial sttock from Tech Ditributors'),
		(2, 2, 30, 'OUT', 'Initial stock from Gadget World'),
        (1, 1, 20, 'IN', 'Reorder due to low stock'),
        (3, 1, 40, 'OUT', 'Monthly restock');
 