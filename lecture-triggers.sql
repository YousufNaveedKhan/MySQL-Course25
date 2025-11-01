CREATE DATABASE triggersandtransactions;

USE triggersandtransactions;

CREATE TABLE Products (
ProductID INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(255),
Stock INT,
Price INT
);

CREATE TABLE AuditLog (
AuditID INT PRIMARY KEY AUTO_INCREMENT,
ProductID INT,
ActionTaken VARCHAR(255),
ActionTime DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Products (ProductName, Stock, Price) VALUES ('Laptop', 10, 25000),
                                                        ('Mobile Phone', 15, 50000),
                                                        ('PC', 25, 15000),
                                                        ('Monitor', 5, 10000);
                                                        

DELIMITER // 
CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products 
FOR EACH ROW
BEGIN
DECLARE changeDetails VARCHAR(255);

SET changeDetails = '';

IF OLD.ProductName <> NEW.ProductName THEN
SET changeDetails = CONCAT(changeDetails, 'ProductName Updated; ');
END IF;

IF OLD.Stock <> NEW.Stock THEN
SET changeDetails = CONCAT(changeDetails, 'Stock Updated; ');
END IF;

IF OLD.Price <> NEW.Price THEN
SET changeDetails = CONCAT(changeDetails, 'Price Updated; ');
END IF;

INSERT INTO AuditLog (ProductID, ActionTaken) VALUES (NEW.ProductID, changeDetails);
END //
DELIMITER ;


UPDATE Products SET Stock = 20 WHERE ProductID = 4;

UPDATE Products SET ProductName = 'iPad', Stock = 15, Price = 90000 WHERE ProductID = 1;

SELECT * FROM AuditLog;
 SELECT * FROM Products;