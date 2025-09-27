USE InventoryDB;

-- Clear existing data to prevent foreign key conflicts
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM ORDER_ITEMS;
DELETE FROM ORDERS;
DELETE FROM ITEMS;
DELETE FROM USERS;
DELETE FROM Suppliers;
SET FOREIGN_KEY_CHECKS = 1;

-- Reset AUTO_INCREMENT counters
ALTER TABLE Suppliers AUTO_INCREMENT = 1;
ALTER TABLE ITEMS AUTO_INCREMENT = 1;
ALTER TABLE ORDERS AUTO_INCREMENT = 1;
ALTER TABLE USERS AUTO_INCREMENT = 1;

-- -----------------------
-- Suppliers (Insert first - no dependencies)
-- -----------------------
INSERT INTO Suppliers (FName, LName, Email, Tel_No) VALUES
('John', 'Smith', 'john.smith@techsupply.com', '555-0101'),
('Sarah', 'Johnson', 'sarah.johnson@officeplus.com', '555-0102'),
('Michael', 'Brown', 'michael.brown@electroworld.com', '555-0103'),
('Emma', 'Davis', 'emma.davis@furniture-co.com', '555-0104'),
('David', 'Wilson', 'david.wilson@stationery-hub.com', '555-0105');

-- -----------------------
-- USERS (No dependencies)
-- -----------------------
INSERT INTO USERS (username, user_password, role_of_user) VALUES
('admin', 'admin123hash', 'Administrator'),
('manager1', 'manager123hash', 'Manager'),
('staff1', 'staff123hash', 'Staff'),
('staff2', 'staff456hash', 'Staff'),
('viewer1', 'viewer123hash', 'Viewer');

-- -----------------------
-- ITEMS (Depends on Suppliers)
-- -----------------------
INSERT INTO ITEMS (ItemName, Quantity, Price, Category, SupplierID) VALUES
('Gaming Laptop', 15, 1299.99, 'Electronics', 1),
('Wireless Mouse', 50, 29.99, 'Electronics', 1),
('Mechanical Keyboard', 30, 89.99, 'Electronics', 1),
('Office Desk', 12, 299.99, 'Furniture', 4),
('Ergonomic Chair', 20, 199.99, 'Furniture', 4),
('LED Monitor', 25, 249.99, 'Electronics', 3),
('Notebook Pack', 100, 12.99, 'Stationery', 5),
('Blue Pens', 200, 1.99, 'Stationery', 5),
('Printer Paper', 80, 8.99, 'Stationery', 2),
('Standing Desk', 8, 499.99, 'Furniture', 4);

-- -----------------------
-- ORDERS (No dependencies)
-- -----------------------
INSERT INTO ORDERS (OrderDate, Order_Status, Customer_Info) VALUES
('2025-09-25', 'Completed', 'ABC Company - Contact: John Doe, Phone: 555-1001'),
('2025-09-26', 'Processing', 'XYZ Corp - Contact: Jane Smith, Phone: 555-1002'),
('2025-09-27', 'Pending', 'Tech Solutions Ltd - Contact: Bob Johnson, Phone: 555-1003'),
('2025-09-27', 'Shipped', 'Office Supplies Inc - Contact: Alice Brown, Phone: 555-1004'),
('2025-09-28', 'Completed', 'StartUp Hub - Contact: Mike Wilson, Phone: 555-1005');

-- -----------------------
-- ORDER_ITEMS (Depends on both ORDERS and ITEMS)
-- Insert only after verifying IDs exist
-- -----------------------
INSERT INTO ORDER_ITEMS (OrderID, ItemID, Quantity) VALUES
(1, 1, 2),   -- Gaming Laptop x2
(1, 2, 4),   -- Wireless Mouse x4
(1, 3, 2),   -- Mechanical Keyboard x2
(2, 4, 1),   -- Office Desk x1
(2, 5, 2),   -- Ergonomic Chair x2
(2, 6, 2),   -- LED Monitor x2
(3, 7, 10),  -- Notebook Pack x10
(3, 8, 20),  -- Blue Pens x20
(3, 9, 5),   -- Printer Paper x5
(4, 2, 15),  -- Wireless Mouse x15
(4, 8, 50),  -- Blue Pens x50
(5, 10, 1),  -- Standing Desk x1
(5, 6, 1);   -- LED Monitor x1

-- -----------------------
-- Verification queries (optional - can be commented out)
-- -----------------------
-- SELECT 'Suppliers inserted:' AS Info, COUNT(*) AS Count FROM Suppliers;
-- SELECT 'Items inserted:' AS Info, COUNT(*) AS Count FROM ITEMS;
-- SELECT 'Orders inserted:' AS Info, COUNT(*) AS Count FROM ORDERS;
-- SELECT 'Order Items inserted:' AS Info, COUNT(*) AS Count FROM ORDER_ITEMS;
-- SELECT 'Users inserted:' AS Info, COUNT(*) AS Count FROM USERS;
