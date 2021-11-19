USE Test8_TruyVanCoBan
GO

/*
Vấn đề: 
- Cần tạo 1 bảng bao gồm MaGV, TenGV, TenBM, Luong
- Dữ liệu bảng này cần tự cập nhật khi các bảng gốc thay đổi

-> Tạo VIEW
- Các câu lệnh tạo VIEW, sửa các trường trong VIEW, xóa VIEW như tạo TABLE
*/

-- Tạo VIEW
CREATE VIEW TestView AS
(
	SELECT GV.MAGV AS N'Mã GV', GV.HOTEN AS N'Tên GV', BM.TENBM, GV.LUONG 
	FROM dbo.GIAOVIEN AS GV
	JOIN dbo.BOMON AS BM ON BM.MABM = GV.MABM
)
GO
-- Xem VIEW
SELECT * FROM TestView

-- Update VIEW
ALTER VIEW	TestView AS SELECT * FROM dbo.GIAOVIEN

-- Xóa VIEW
DROP VIEW TestView

-- Tạo VIEW có dấu
CREATE VIEW [Giáo dục miễn phí] AS
SELECT * FROM dbo.KHOA
GO

SELECT * FROM [Giáo dục miễn phí]


