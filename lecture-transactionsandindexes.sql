-- Create a new database named TRANSACTIONS
CREATE DATABASE TRANSACTIONS;

-- Select / use the TRANSACTIONS database
USE TRANSACTIONS;

-- Create a table named Accounts to store account details
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID for each account
    AccountHolder VARCHAR(100),                -- Name of the account holder
    Balance DECIMAL(10,2)                      -- Account balance with 2 decimal precision
);

-- View all records from the Accounts table (currently empty)
SELECT * FROM Accounts;

-- Insert sample data (5 account holders with balances)
INSERT INTO Accounts (AccountHolder, Balance) 
VALUES ('Laiba', 5000.00),
       ('Saqlain', 10000.00),
       ('Abu Hurerah', 2000.00),
       ('Fatima', 5000.00),
       ('Anusha', 6000.00);

-- Display all inserted records
SELECT * FROM Accounts;

-- Start a new transaction (group of SQL commands)
START TRANSACTION;

-- Turn off auto-commit so changes are not saved automatically
SET AUTOCOMMIT = 0;

-- Deduct 1000 from Saqlain's balance
UPDATE Accounts
SET Balance = Balance - 1000.00
WHERE AccountHolder = 'Saqlain';

-- Add 1000 to Abu Hurerah's balance
UPDATE Accounts
SET Balance = Balance + 1000.00
WHERE AccountHolder = 'Abu Hurerah';

-- Undo all the above changes (cancel the transaction)
ROLLBACK;

-- Check Saqlain's balance (to confirm rollback worked)
SELECT * FROM Accounts WHERE AccountHolder = "Saqlain";

-- Commit means permanently save changes (if rollback not used)
COMMIT;

-- Create a table named Products to store product information
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique product ID
    ProductName VARCHAR(110),                  -- Product name
    Category VARCHAR(110),                     -- Product category (e.g., Phones, Laptops)
    Price INT                                  -- Product price
);

-- Insert sample product records
INSERT INTO Products (ProductName, Category, Price) VALUES 
('iPhone 17 Pro Max', 'Phones', 580000),
('Dell Latitude 630', 'Laptops', 25000),
('Haier AC', 'Electronics', 80000),
('Fan', 'Electronics', 5000);

-- Display only products that belong to 'Electronics' category
SELECT * FROM Products WHERE Category = 'Electronics';

-- Create an index on ProductName (to make searching by name faster)
CREATE INDEX idx_ProductName ON Products (ProductName);

-- Create another index on Category (to make category-based queries faster)
CREATE INDEX idx_Category ON Products (Category);

-- Find product by exact name using index
SELECT * FROM Products WHERE ProductName = 'iPhone 17 Pro Max';

-- Find all products under 'Electronics' category using index
SELECT * FROM Products WHERE Category = 'Electronics';

-- Show all products priced above 12000
SELECT * FROM Products WHERE Price > 12000;
