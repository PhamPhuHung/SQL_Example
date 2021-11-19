USE Test8_TruyVanCoBan GO

/* 
Từ khóa CHECK
- Thêm điều kiện cho 1 trường trong bảng
- Có 3 cách tạo CHECK như tạo PRIMARY KEY
*/
--Tạo CHECK khi tạo bảng
CREATE TABLE TestCheck
(
	ID INT PRIMARY KEY IDENTITY,
	Luong INT CHECK(Luong > 3000 AND Luong < 9000)
)
GO
--Tạo CHECK & Tên CHECK
CREATE TABLE TestCheck
(
	ID INT PRIMARY KEY IDENTITY,
	Luong INT,
	CONSTRAINT CK CHECK(Luong > 3000 AND Luong < 9000)
)
GO

-- Thêm CHECK sau khi tạo bảng
CREATE TABLE TestCheck
(
	ID INT PRIMARY KEY IDENTITY,
	Luong INT,
)
GO
ALTER TABLE dbo.TestCheck ADD CONSTRAINT CK
CHECK (Luong >2000 AND Luong <10000)

-- Xóa và thêm lại CHEK
ALTER TABLE dbo.TestCheck DROP CONSTRAINT CK
ALTER TABLE dbo.TestCheck ADD CONSTRAINT CK
CHECK (Luong >2000 AND Luong <10000)

INSERT INTO dbo.TestCheck( Luong)VALUES(90000)
