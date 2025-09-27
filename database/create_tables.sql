-- create the database
CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

-- create the tables    
CREATE TABLE IF NOT EXISTS Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Email VARCHAR(100),
    Tel_No VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS ORDERS (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    Order_Status VARCHAR(20),
    Customer_Info VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ITEMS (
    ItemID  INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


CREATE TABLE IF NOT EXISTS ORDER_ITEMS (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID)
);


CREATE TABLE IF NOT EXISTS USERS (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    role_of_user VARCHAR(50) NOT NULL
);
