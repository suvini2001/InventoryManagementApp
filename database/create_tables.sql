-- create the database
CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

-- create the tables    
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Tel_No VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS ORDERS (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Order_Status VARCHAR(20) DEFAULT 'Pending',
    Customer_Info VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ITEMS (
    ItemID  INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    Category VARCHAR(50),
    SupplierID INT,
    CONSTRAINTS fk_item_supplier
        FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- -----------------------
-- Order_Items junction table
-- Composite primary key enforces one row per (order,item)
-- -----------------------



CREATE TABLE IF NOT EXISTS ORDER_ITEMS (
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    PRIMARY KEY (OrderID, ItemID),
    CONSTRAINTS fk_order_item_order
        FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINTS fk_order_item_item
        FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS USERS (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    role_of_user VARCHAR(50) NOT NULL
);
