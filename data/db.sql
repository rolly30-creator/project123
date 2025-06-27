-- Employee table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    department VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100)
);