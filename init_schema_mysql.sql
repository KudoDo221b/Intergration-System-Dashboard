-- Chạy script này trên MySQL (database PAYROLL_BAITAP)
-- Tạo bảng theo tài liệu Lab 3-3

USE PAYROLL;

-- Bảng employees_payroll (đồng bộ với SQL Server)
CREATE TABLE IF NOT EXISTS employees_payroll (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DepartmentID INT NULL,
    PositionID INT NULL,
    Status VARCHAR(50) DEFAULT 'Active'
);

-- Bảng attendance (đã đồng bộ với router.py)
CREATE TABLE IF NOT EXISTS attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    AttendanceMonth DATE,
    WorkDays INT DEFAULT 0,
    LeaveDays INT DEFAULT 0,
    AbsentDays INT DEFAULT 0
);

-- Bảng salaries (đã đồng bộ với router.py)
CREATE TABLE IF NOT EXISTS salaries (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    SalaryMonth DATE,
    BaseSalary DECIMAL(18,2),
    Bonus DECIMAL(18,2) DEFAULT 0.00,
    Deductions DECIMAL(18,2) DEFAULT 0.00,
    NetSalary DECIMAL(18,2)
);
