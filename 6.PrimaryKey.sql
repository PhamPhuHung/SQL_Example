-- Unique: duy nhất, -> trong toàn bộ bảng, trường nào có từ khóa Unique thì không thể có 2 giá trị trùng nhau
-- NOT NULL: Trường đó không được phép null
-- Default: Giá trị mặc định nếu không nhập dữ liệu
-- Primary Key: duy nhất và không null, dùng để tham chiếu tới bảng đó
CREATE TABLE Test6
(
	ID INT UNIQUE NOT NULL,
	Name NVARCHAR(20) DEFAULT N'Phạm Phú Hưng',
	Sex BIT DEFAULT 1,
)
GO

INSERT dbo.Test6(ID)
VALUES	(0)
INSERT dbo.Test6(ID)
VALUES	(1)
INSERT dbo.Test6(ID)
VALUES	(2)
INSERT dbo.Test6(ID)
VALUES	(3)

-- Các cách tạo Primary Key
-- Cách 1: Tạo ngay khi tạo bảng
CREATE TABLE Test6
(
	ID INT PRIMARY KEY,
	Name NVARCHAR(20) DEFAULT N'Phạm Phú Hưng',
	Sex BIT DEFAULT 1,
)
GO

--Cách 2: Đã tạo bảng, sửa cột thành Primary Key và đặt tên cho Primary Key
ALTER TABLE dbo.Test6 ADD CONSTRAINT PK_Test6 PRIMARY KEY (ID,Name)

-- Cách 3: Tạo nhiều primary key khi tạo bảng, đặt tên cho Primary Key
CREATE TABLE Test6
(
	ID INT ,
	Name NVARCHAR(20),
	Sex BIT DEFAULT 1,

	CONSTRAINT PK_Test6 -- Sau này có thể dùng tên để xóa Primary Key
	PRIMARY KEY(ID, Name)
)
GO