-- Import MySQL Connector/Python
-- Create database and tables for Little Lemon

-- Check if the database exists, and delete if it does
DROP DATABASE IF EXISTS little_lemon_db;

-- Create the database
CREATE DATABASE little_lemon_db;

-- Switch to the newly created database
USE little_lemon_db;

-- Create MenuItems table
CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT,
    Name VARCHAR(200),
    Type VARCHAR(100),
    Price INT,
    PRIMARY KEY (ItemID)
);

-- Create Menus table
CREATE TABLE Menus (
    MenuID INT,
    ItemID INT,
    Cuisine VARCHAR(100),
    PRIMARY KEY (MenuID, ItemID)
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT,
    TableNo INT,
    GuestFirstName VARCHAR(100) NOT NULL,
    GuestLastName VARCHAR(100) NOT NULL,
    BookingSlot TIME NOT NULL,
    EmployeeID INT,
    PRIMARY KEY (BookingID)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    TableNo INT,
    MenuID INT,
    BookingID INT,
    BillAmount INT,
    Quantity INT,
    PRIMARY KEY (OrderID, TableNo)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR (255),
    Role VARCHAR (100),
    Address VARCHAR (255),
    Contact_Number INT,
    Email VARCHAR (255),
    Annual_Salary VARCHAR (100)
);

-- Insert data into MenuItems table
INSERT INTO MenuItems (ItemID, Name, Type, Price) VALUES
(1, 'Olives', 'Starters', 5),
(2, 'Flatbread', 'Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread', 'Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10, 'Greek yoghurt', 'Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);

-- Insert data into Menus table
INSERT INTO Menus (MenuID, ItemID, Cuisine) VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');

-- Insert data into Bookings table
INSERT INTO Bookings (BookingID, TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID) VALUES
(1, 12, 'Anna', 'Iversen', '19:00:00', 1),
(2, 12, 'Joakim', 'Iversen', '19:00:00', 1),
(3, 19, 'Vanessa', 'McCarthy', '15:00:00', 3),
(4, 15, 'Marcos', 'Romero', '17:30:00', 4),
(5, 5, 'Hiroki', 'Yamane', '18:30:00', 2),
(6, 8, 'Diana', 'Pinto', '20:00:00', 5);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID, Quantity, BillAmount) VALUES
(1, 12, 1, 1, 2, 86),
(2, 19, 2, 2, 1, 37),
(3, 15, 2, 3, 1, 37),
(4, 5, 3, 4, 1, 40),
(5, 8, 1, 5, 1, 43);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, Name, Role, Address, Contact_Number, Email, Annual_Salary) VALUES
(1, 'Mario Gollini', 'Manager', '724, Parsley Lane, Old Town, Chicago, IL', 351258074, 'Mario.g@littlelemon.com', 70000),
(2, 'Adrian Gollini', 'Assistant Manager', '334, Dill Square, Lincoln Park, Chicago, IL', 351474048, 'Adrian.g@littlelemon.com', 65000),
(3, 'Giorgos Dioudis', 'Head Chef', '879 Sage Street, West Loop, Chicago, IL', 351970582, 'Giorgos.d@littlelemon.com', 50000),
(4, 'Fatma Kaya', 'Assistant Chef', '132 Bay Lane, Chicago, IL', 351963569, 'Fatma.k@littlelemon.com', 45000),
(5, 'Elena Salvai', 'Head Waiter', '989 Thyme Square, EdgeWater, Chicago, IL', 351074198, 'Elena.s@littlelemon.com', 40000),
(6, 'John Millar', 'Receptionist', '245 Dill Square, Lincoln Park, Chicago, IL', 351584508, 'John.m@littlelemon.com', 35000);

-- Create stored procedure for PeakHours
DELIMITER //
CREATE PROCEDURE PeakHours()
BEGIN
    SELECT HOUR(BookingSlot) AS Hour, COUNT(*) AS NumBookings
    FROM Bookings
    GROUP BY Hour
    ORDER BY NumBookings DESC;
END;
//
DELIMITER ;

-- Create stored procedure for GuestStatus
DELIMITER //
CREATE PROCEDURE GuestStatus()
BEGIN
    SELECT CONCAT(GuestFirstName, ' ', GuestLastName) AS GuestName,
        CASE 
            WHEN Employees.Role IN ('Manager', 'Assistant Manager') THEN 'Ready to pay'
            WHEN Employees.Role = 'Head Chef' THEN 'Ready to serve'
            WHEN Employees.Role = 'Assistant Chef' THEN 'Preparing Order'
            WHEN Employees.Role = 'Head Waiter' THEN 'Order served'
            ELSE 'Unknown status'
        END AS OrderStatus
    FROM Bookings
    LEFT JOIN Employees ON Bookings.EmployeeID = Employees.EmployeeID;
END;
//
DELIMITER ;
