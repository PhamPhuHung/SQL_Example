CREATE DATABASE Test13_CHIANHOM
GO

USE Test13_CHIANHOM
GO

CREATE TABLE NHOM_A
(
	MAHS CHAR(4),
	TENHS NVARCHAR(50)
)
CREATE TABLE NHOM_B
(
	MAHS CHAR(4),
	TENHS NVARCHAR(50)
)

CREATE TABLE MONTHI
(
	MAMH CHAR(4),
	TENMH NVARCHAR(100)
)


INSERT INTO dbo.NHOM_A
        ( MAHS, TENHS )
VALUES  ( 'A01', -- MAHS - char(4)
          N'Trần Kim Long'  -- TENHS - nvarchar(50)
          )
INSERT INTO dbo.NHOM_A
        ( MAHS, TENHS )
VALUES  ( 'A02', -- MAHS - char(4)
          N'Nguyễn Đoàn Ngọc Giàu'  -- TENHS - nvarchar(50)
          )
INSERT INTO dbo.NHOM_A
        ( MAHS, TENHS )
VALUES  ( 'A03', -- MAHS - char(4)
          N'Trần Thị Như Quỳnh'  -- TENHS - nvarchar(50)
		  )

INSERT INTO dbo.NHOM_B
        ( MAHS, TENHS )
VALUES  ( 'B01', -- MAHS - char(4)
          N'Trần Thành Vi Thanh'  -- TENHS - nvarchar(50)
          )
INSERT INTO dbo.NHOM_B
        ( MAHS, TENHS )
VALUES  ( 'B02', -- MAHS - char(4)
          N'Phạm Thành'  -- TENHS - nvarchar(50)
          )

INSERT INTO dbo.MONTHI 
        ( MAMH, TENMH )
VALUES  ( '001', -- MAMH - char(4)
          N'Toán'  -- TENMH - nvarchar(100)
          )
INSERT INTO dbo.MONTHI 
        ( MAMH, TENMH )
VALUES  ( '002', -- MAMH - char(4)
          N'Văn'  -- TENMH - nvarchar(100)
          )
INSERT INTO dbo.MONTHI 
        ( MAMH, TENMH )
VALUES  ( '003', -- MAMH - char(4)
          N'Tiếng Anh'  -- TENMH - nvarchar(100)
          )

	 
SELECT * FROM dbo.NHOM_A
SELECT * FROM dbo.NHOM_B
SELECT * FROM dbo.MONTHI