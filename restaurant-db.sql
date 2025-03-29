-- Create and use the database
DROP DATABASE IF EXISTS restaurant_db;
CREATE DATABASE restaurant_db;
USE restaurant_db;

-- 1. Create Roles table
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL,
    AnnualSalary DECIMAL(10,2) NOT NULL
);

-- 2. Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    RoleID INT NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(64),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- 3. Create Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(64),
    Phone VARCHAR(20)
);

-- 4. Create Tables table
CREATE TABLE Tables (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    TableNumber INT NOT NULL UNIQUE,
    Capacity INT
);

-- 5. Create MenuCategories table
CREATE TABLE MenuCategories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- 6. Create Cuisines table
CREATE TABLE Cuisines (
    CuisineID INT AUTO_INCREMENT PRIMARY KEY,
    CuisineName VARCHAR(100) NOT NULL UNIQUE
);

-- 7. Create MenuItems table
CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT NOT NULL,
    CuisineID INT,
    FOREIGN KEY (CategoryID) REFERENCES MenuCategories(CategoryID),
    FOREIGN KEY (CuisineID) REFERENCES Cuisines(CuisineID)
);

-- 8. Create Menus table
CREATE TABLE Menus (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuName VARCHAR(100) NOT NULL,
    CuisineID INT,
    Description TEXT,
    FOREIGN KEY (CuisineID) REFERENCES Cuisines(CuisineID)
);

-- 9. Create junction table for Menu-MenuItems relationship
CREATE TABLE MenuMenuItems (
    MenuID INT NOT NULL,
    ItemID INT NOT NULL,
    PRIMARY KEY (MenuID, ItemID),
    FOREIGN KEY (MenuID) REFERENCES Menus(MenuID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- 10. Create Bookings table
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    TableID INT NOT NULL,
    EmployeeID INT,
    BookingDate DATETIME NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TableID) REFERENCES Tables(TableID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 11. Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    BookingID INT,
    EmployeeID INT,
    TableID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    Status ENUM('Pending', 'In Progress', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- 12. Create OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10,2) NOT NULL,
    SpecialRequests TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- 13. Create OrderDeliveryStatus table (for takeaway/delivery)
CREATE TABLE OrderDeliveryStatus (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    DeliveryAddress VARCHAR(255),
    DeliveryDate DATETIME,
    Status ENUM('Preparing', 'Dispatched', 'In Transit', 'Delivered', 'Cancelled') NOT NULL,
    Notes TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);