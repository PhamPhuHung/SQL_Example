CREATE DATABASE Test7_ForeignKey

USE Test7_ForeignKey
GO

-- Điều kiện của khóa ngoại
-- Tham chiếu tới khóa chính
-- Unique, not null
-- Cùng kiểu dữ liệu
-- Cùng số liệu các trường có sắp xếp
-- 
-- Lợi ích: Đảm bảo toàn vẹn dữ liệu, đảm bảo không tham chiếu tới dữ liệu không tồn tại

CREATE TABLE BoMon
(
	MaBM CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100) DEFAULT N'Tên Bộ Môn'
)
GO	
CREATE TABLE Lop
(
	MaLop CHAR(10) NOT NULL,
	Name NVARCHAR(10) DEFAULT N'Tên Lớp'

	PRIMARY KEY(MaLop)
)
GO	

CREATE TABLE GiaoVien
(
	MaGV CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Tên Giáo Viên',
	DiaChi NVARCHAR(100) DEFAULT N'Địa Chỉ',
	NgaySinh DATE,
	Sex BIT DEFAULT 0,

	--Cách 1: Tạo foreign key khi tạo bảng
	MaBM CHAR(10) FOREIGN KEY REFERENCES dbo.BoMon(MaBM), 
	
	--Cách 2: Tạo foreign key khi tạo bảng và đặt tên cho foreign key
	MaLop CHAR(10),
	CONSTRAINT FK_GV1 FOREIGN KEY(MaLop) REFERENCES dbo.Lop(MaLop)
)
GO	
ALTER TABLE dbo.GiaoVien ADD PRIMARY KEY(MaGV)

CREATE TABLE HocSinh
(
	MaHS CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100),
	MaLop CHAR(10)
)
--Cách 3: Sau khi đã tạo bảng, thêm foreign key vào bảng và đặt tên cho foreign key
ALTER TABLE dbo.HocSinh ADD CONSTRAINT FK_HS FOREIGN KEY(MaLop) REFERENCES dbo.Lop(MaLop)

-- Hủy khóa ngoại
ALTER TABLE dbo.HocSinh DROP CONSTRAINT FK_HS
