-- RESTAURANT DATABASE SAMPLE DATA
-- This file populates all tables with sample data for testing and development

USE restaurant_db;

-- ======================
-- ROLES DATA
-- ======================
INSERT INTO Roles (RoleName, AnnualSalary) VALUES 
('Manager', 70000.00),
('Head Chef', 60000.00),
('Sous Chef', 50000.00),
('Waiter', 40000.00),
('Receptionist', 35000.00),
('Bartender', 38000.00),
('Host/Hostess', 32000.00);

-- ======================
-- EMPLOYEES DATA
-- ======================
INSERT INTO Employees (Name, RoleID, Email, ContactNumber) VALUES
-- Management
('Mario Gollini', 1, 'mario.g@littlelemon.com', '351258074'),
('Adrian Gollini', 1, 'adrian.g@littlelemon.com', '351474048'),

-- Kitchen Staff
('Giorgos Dioudis', 2, 'giorgos.d@littlelemon.com', '351970582'),
('Fatma Kaya', 3, 'fatma.k@littlelemon.com', '351963569'),

-- Front of House
('Elena Salvai', 4, 'elena.s@littlelemon.com', '351074198'),
('John Smith', 4, 'john.s@littlelemon.com', '351111222'),
('Sarah Johnson', 4, 'sarah.j@littlelemon.com', '351222333'),
('David Wilson', 5, 'david.w@littlelemon.com', '351333444'),
('Thomas Brown', 6, 'thomas.b@littlelemon.com', '351444555'),
('Olivia Green', 7, 'olivia.g@littlelemon.com', '351555666');

-- ======================
-- CUSTOMERS DATA
-- ======================
INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('Anna', 'Iversen', 'anna@example.com', '555-0101'),
('Joakim', 'Iversen', 'joakim@example.com', '555-0102'),
('Vanessa', 'McCarthy', 'vanessa@example.com', '555-0103'),
('Marcos', 'Romero', 'marcos@example.com', '555-0104'),
('Sophia', 'Chen', 'sophia@example.com', '555-0105'),
('Daniel', 'Kim', 'daniel@example.com', '555-0106');

-- ======================
-- TABLES DATA
-- ======================
INSERT INTO Tables (TableNumber, Capacity) VALUES
(1, 2), (2, 2), (3, 4), (4, 4), (5, 6), 
(6, 6), (7, 8), (8, 8), (9, 10), (10, 10);

-- ======================
-- MENU CATEGORIES DATA
-- ======================
INSERT INTO MenuCategories (CategoryName) VALUES 
('Starters'), ('Main Courses'), ('Desserts'), 
('Drinks'), ('Sides'), ('Specialties');

-- ======================
-- CUISINES DATA
-- ======================
INSERT INTO Cuisines (CuisineName) VALUES 
('Greek'), ('Italian'), ('Turkish'), 
('Mediterranean'), ('Spanish'), ('French');

-- ======================
-- MENU ITEMS DATA
-- ======================
INSERT INTO MenuItems (Name, Description, Price, CategoryID, CuisineID) VALUES
-- Greek Cuisine
('Olives', 'Marinated Greek olives', 5.00, 1, 1),
('Greek Salad', 'Fresh vegetables with feta cheese', 15.00, 2, 1),
('Moussaka', 'Layered eggplant dish', 22.00, 2, 1),
('Baklava', 'Sweet pastry dessert', 8.00, 3, 1),

-- Italian Cuisine
('Pizza Margherita', 'Classic Italian pizza', 18.00, 2, 2),
('Bruschetta', 'Toasted bread with tomatoes', 7.00, 1, 2),
('Tiramisu', 'Coffee-flavored dessert', 9.00, 3, 2),

-- Turkish Cuisine
('Kunefe', 'Cheese pastry dessert', 10.00, 3, 3),
('Lahmacun', 'Turkish pizza', 14.00, 2, 3),

-- Beverages
('Athens White Wine', 'Premium Greek wine', 25.00, 4, 1),
('Italian Red Wine', 'Chianti Classico', 28.00, 4, 2),
('Turkish Coffee', 'Traditional strong coffee', 6.00, 4, 3);

-- ======================
-- MENUS DATA
-- ======================
INSERT INTO Menus (MenuName, CuisineID) VALUES 
('Greek Feast', 1), 
('Italian Classics', 2), 
('Turkish Delights', 3),
('Mediterranean Fusion', 4);

-- ======================
-- MENU ITEM ASSIGNMENTS
-- ======================
INSERT INTO MenuMenuItems (MenuID, ItemID) VALUES
-- Greek Feast
(1, 1), (1, 2), (1, 3), (1, 4), (1, 10),

-- Italian Classics
(2, 5), (2, 6), (2, 7), (2, 11),

-- Turkish Delights
(3, 8), (3, 9), (3, 12),

-- Mediterranean Fusion
(4, 1), (4, 2), (4, 5), (4, 6), (4, 8);

-- ======================
-- BOOKINGS DATA
-- ======================
INSERT INTO Bookings (CustomerID, TableID, EmployeeID, BookingDate) VALUES
-- Weekday bookings
(1, 1, 5, '2023-12-04 18:00:00'),  -- Elena Salvai
(2, 3, 5, '2023-12-04 18:30:00'),
(3, 5, 6, '2023-12-04 19:00:00'),  -- John Smith

-- Weekend bookings
(4, 2, 7, '2023-12-09 12:00:00'),  -- Sarah Johnson
(5, 4, NULL, '2023-12-09 12:30:00'), -- Unassigned
(6, 6, 5, '2023-12-09 19:00:00'),   -- Elena Salvai

-- Future bookings
(1, 7, 8, '2023-12-15 19:30:00'),   -- David Wilson
(3, 8, NULL, '2023-12-16 20:00:00'); -- Unassigned

-- ======================
-- ORDERS DATA
-- ======================
INSERT INTO Orders (CustomerID, BookingID, EmployeeID, TableID, OrderDate, TotalAmount, Status) VALUES
(1, 1, 5, 1, '2023-12-04 18:15:00', 45.00, 'Completed'),
(2, 2, 5, 3, '2023-12-04 18:45:00', 68.00, 'Completed'),
(4, 4, 7, 2, '2023-12-09 12:15:00', 92.00, 'In Progress');

-- ======================
-- ORDER ITEMS DATA
-- ======================
INSERT INTO OrderItems (OrderID, ItemID, Quantity, UnitPrice, SpecialRequests) VALUES
-- Order 1
(1, 1, 1, 5.00, 'Extra olives'),
(1, 2, 2, 15.00, 'No onions'),
(1, 10, 1, 25.00, NULL),

-- Order 2
(2, 5, 1, 18.00, 'Well done'),
(2, 7, 1, 9.00, NULL),
(2, 11, 2, 28.00, NULL),

-- Order 3
(3, 3, 1, 22.00, 'Extra sauce'),
(3, 8, 2, 10.00, 'With ice cream'),
(3, 12, 1, 6.00, 'Less sugar');

-- ======================
-- END OF SAMPLE DATA
-- ======================
