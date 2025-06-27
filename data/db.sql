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

-- PF (Provident Fund) table
CREATE TABLE EmployeePFDetails (
    pf_id INT PRIMARY KEY,
    employee_id INT,
    pf_number VARCHAR(50),
    pf_contribution DECIMAL(10,2),
    employer_contribution DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Bank account table
CREATE TABLE EmployeeBankDetails (
    bank_id INT PRIMARY KEY,
    employee_id INT,
    bank_name VARCHAR(100),
    account_number VARCHAR(30),
    ifsc_code VARCHAR(15),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- Salary table
CREATE TABLE EmployeeSalary (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    allowances DECIMAL(10,2),
    deductions DECIMAL(10,2),
    net_salary AS (basic_salary + hra + allowances - deductions) PERSISTED,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
