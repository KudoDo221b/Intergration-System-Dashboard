-- Chạy script này trên SQL Server (database HUMAN_BAITAP)
-- Tạo bảng theo tài liệu Lab 3-3

USE HUMAN_2025;
GO

-- Bảng Phòng ban
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Departments')
BEGIN
    CREATE TABLE Departments (
        DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
        DepartmentName NVARCHAR(100) NOT NULL
    );
    INSERT INTO Departments (DepartmentName) VALUES (N'IT'), (N'HR'), (N'Finance'), (N'Marketing');
END
GO

-- Bảng Chức vụ
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Positions')
BEGIN
    CREATE TABLE Positions (
        PositionID INT IDENTITY(1,1) PRIMARY KEY,
        PositionName NVARCHAR(100) NOT NULL
    );
    INSERT INTO Positions (PositionName) VALUES (N'Developer'), (N'Manager'), (N'Analyst'), (N'Designer');
END
GO

-- Bảng Nhân viên
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Employees')
BEGIN
    CREATE TABLE Employees (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
        FullName NVARCHAR(100) NOT NULL,
        Email NVARCHAR(100),
        DateOfBirth DATE,
        Gender NVARCHAR(20),
        PhoneNumber NVARCHAR(20),
        HireDate DATE,
        DepartmentID INT NULL,
        PositionID INT NULL,
        Status NVARCHAR(50) DEFAULT 'Active',
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
        FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
    );
END
GO

-- Bảng Dividends (dùng để kiểm tra ràng buộc khi xóa)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dividends')
BEGIN
    CREATE TABLE Dividends (
        DividendID INT IDENTITY(1,1) PRIMARY KEY,
        EmployeeID INT NOT NULL,
        Amount DECIMAL(18,2),
        FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    );
END
GO
