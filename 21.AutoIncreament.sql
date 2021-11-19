USE Test8_TruyVanCoBan
GO

/* 
Từ khóa IDENTITY
- IDENTITY: kiểu dữ liệu phải là số
			mặc định bắt đầu từ 1 và tăng 1 đơn vị
			Biến có từ khóa này chỉ có thể được thêm tự động, không thể dùng code

- IDENTITY(5,10): mặc định bắt đầu từ 5 và tăng 10 đơn vị
*/

--Ex 1
CREATE TABLE Test_AutoIncreament1
(
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
)
GO
INSERT dbo.Test_AutoIncreament1(Name) VALUES(N'Name 1')
INSERT dbo.Test_AutoIncreament1(Name) VALUES(N'Name 2')
INSERT dbo.Test_AutoIncreament1(Name) VALUES(N'Name 3')
INSERT dbo.Test_AutoIncreament1(Name) VALUES(N'Name 4')
INSERT dbo.Test_AutoIncreament1(ID) VALUES(15)--Câu lệnh lỗi

SELECT * FROM dbo.Test_AutoIncreament1

--Ex 2
CREATE TABLE Test_AutoIncreament2
(
	ID INT PRIMARY KEY IDENTITY(5,10),
	Name NVARCHAR(100)
)
GO
INSERT dbo.Test_AutoIncreament2(Name) VALUES(N'Name 1')
INSERT dbo.Test_AutoIncreament2(Name) VALUES(N'Name 2')
INSERT dbo.Test_AutoIncreament2(Name) VALUES(N'Name 3')
INSERT dbo.Test_AutoIncreament2(Name) VALUES(N'Name 4')

SELECT * FROM dbo.Test_AutoIncreament2


DROP TABLE dbo.Test_AutoIncreament1
DROP TABLE dbo.Test_AutoIncreament2