CREATE DATABASE conditionals;

USE conditionals;

CREATE TABLE Employees (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(255),
employee_salary INT,
employee_city VARCHAR(255) DEFAULT 'Karachi'
);


SELECT * FROM Employees;

SELECT employee_name, employee_salary, IF (employee_salary > 50000, 'Senior', 'Junior') AS EmployeeSalary FROM Employees;


SELECT employee_name, employee_salary, 
CASE 
WHEN employee_salary >= 20000 AND employee_salary <= 50000 THEN 'Junior Employees'
WHEN employee_salary >= 50000 AND employee_salary <= 100000 THEN 'Senior Employees'
WHEN employee_salary >= 100000 THEN 'Most Senior Employees'
ELSE 'Interns'
END AS EmployeeDetails FROM Employees;