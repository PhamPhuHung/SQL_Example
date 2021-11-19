CREATE DATABASE SQLDBQuery
GO --(Neu co loi van di tiep)

--Su dung DB SQLDBQuery
USE SQLDBQuery
GO

CREATE TABLE GiaoVien
(
	MaGV NVARCHAR(10),
	Name NVARCHAR(100)
)
GO

CREATE TABLE HocSinh
(
	MaHS NVARCHAR(10),
	Name NVARCHAR(100)
)
GO

--Them du lieu vao bang (them cot ngay sinh)
ALTER TABLE HocSinh ADD NgaySinh Date

--Xóa 1 cột dữ liêu
ALTER TABLE dbo.HocSinh DROP COLUMN NgaySinh

--Xoa toan bo bang
DROP TABLE GiaoVien
GO

--Xoa du lieu trong bang
TRUNCATE TABLE Hocsinh
GO
