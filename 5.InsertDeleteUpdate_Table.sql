CREATE DATABASE First_DB
GO

USE First_DB
GO

CREATE TABLE Student (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(100) NOT NULL,
	Age INT,
	ClassID INT NOT NULL,
	ShoolFee INT,

)
GO

INSERT Student (Name, Age, ClassID) VALUES ('John', 12, 1)
INSERT Student (Name, Age, ClassID, SchoolFee) VALUES ('Richard', 12, 1, 100)
INSERT Student (Name, Age, ClassID, SchoolFee) VALUES ('Arthur', 15, 45, 2, 150)
INSERT Student (Name, Age, ClassID, SchoolFee) VALUES ('Lily', 15, 2, 150)
GO

UPDATE Student SET Name = 'Blake' WHERE ID = 2 
GO
UPDATE Student SET SchoolFee = 200 WHERE ClassID = 2 
GO
UPDATE Student SET Age = 16
GO

DELETE Student WHERE ID = 4
GO

DELETE Student
GO

DROP TABLE Student
GO









































CREATE TABLE Test5
(
	MaSo INT,
	Ten NVARCHAR(10),
	NgaySinh DATE,
	Nam BIT,
	DiaChi CHAR(20),
	TienLuowng FLOAT
)
GO

-- Thêm dữ liệu
-- Kiểu số - Thêm bình thường
-- Kiểu kí tự, date - Đặt trong cặp nháy đơn
-- Kiểu unicode - cần có N phía trước cặp nháy đơn

INSERT dbo.Test5
(--Bỏ toàn bộ phần này thì phần VALUES sẽ theo thứ tự cột của bảng, có thể sắp xếp lại hoặc xóa bớt 1 trường thì phần VALUES phải nhập giá trị tương ứng
    MaSo,
    Ten,
    NgaySinh,
    Nam,
    DiaChi,
    TienLuowng
)
VALUES
(   2,         -- MaSo - int
    N'Phạm Hưng',       -- Ten - nvarchar(10)
    '19970205', -- NgaySinh - date
    1,      -- Nam - bit
    'Q8,TPHCM',        -- DiaChi - char(20)
    8        -- TienLuowng - float
)

-- Xóa dữ liệu
-- các toán tử: >, <, >=, <=, <>, =, AND, OR
DELETE dbo.Test5 -- xóa tất cả dữ liệu trong bảng

DELETE dbo.Test5 WHERE MaSo = 0 -- xoá các dòng có MaSo = 0

DELETE dbo.Test5 WHERE TienLuowng < 10 AND MaSo <3 --  Xóa các dòng có TienLuong > 10

-- Update dữ liệu
UPDATE dbo.Test5 SET TienLuowng = 100000 -- Sửa cột TienLuong trong cả bảng thành 100000

UPDATE dbo.Test5 SET TienLuowng = 150000 WHERE MaSo > 2 -- Sửa cột TienLuong nếu MaSo > 2