USE Test8_TruyVanCoBan
GO

/*
Tạo index trên bảng giáo viên
Tăng tốc độ tìm kiếm <> Chậm tốc độ thêm, xóa, sửa
*/

-- Cho phép các trường trùng nhau
CREATE INDEX IndexName ON dbo.NGUOITHAN(MaGV)

-- Không Cho phép các trường trùng nhau
CREATE UNIQUE INDEX IndexNameUnique ON dbo.GIAOVIEN(MaGV)

SELECT * FROM dbo.NGUOITHAN
WHERE MAGV = '001' AND TEN = 'Tes999999'