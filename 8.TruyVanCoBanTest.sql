Use Test8_TruyVanCoBan
GO

-- Cấu trúc truy vấn
-- Lấy toàn bộ dữ liệu trong bảng BOMON   
SELECT * FROM dbo.BOMON

-- Lấy MABM, TENBM trong bảng BOMON
SELECT MABM, TENBM FROM dbo.BOMON

-- Đổi tên cột hiển thị
SELECT MABM AS N'Mã Bộ Môn', TENBM AS 'Name' FROM dbo.BOMON

-- Xuất ra 2 bảng BOMON và GIAOVIEN
SELECT * FROM dbo.BOMON, dbo.GIAOVIEN

-- Xuất ra bảng BOMON và MAGV của bảng GV
SELECT BM.*, GV.MAGV FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV

-- Xuất ra MABM, TENBM, PHONG của bảng BOMON và MAGV, HOTEN, MABM của bảng GIAOVIEN
SELECT BM.MABM, BM.TENBM, BM.PHONG, GV.MAGV, GV.HOTEN, gv.MABM FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV

-- Xuất ra tất cả MAKHOA trong bảng BM
SELECT MAKHOA FROM dbo.BOMON
-- Xuất ra tất cả MAKHOA không trùng nhau trong bảng BM
SELECT DISTINCT MAKHOA FROM dbo.BOMON

-- Đếm số khoa không trùng nhau
SELECT COUNT(DISTINCT MAKHOA) FROM dbo.BOMON

--Lấy tất cả dữ liệu trong table BOMON
SELECT * FROM dbo.BOMON
--Lấy tất cả dữ liệu của 5 record đầu tiên trong table BOMON
SELECT TOP 5 * FROM dbo.BOMON
--Lấy tất cả dữ liệu của 5% đầu tiên trong table BOMON
SELECT TOP 20 PERCENT * FROM dbo.BOMON

-- Bài tập nâng cao
-- Lấy MAGV, TENGV, TENKHOA tương ứng
-- Các liên kết: TENKHOA(dbo.KHOA) <- MAKHOA(dbo.BOMON) <- TENBM(dbo.GIAOVIEN)
SELECT GV.MAGV, GV.HOTEN, KH.TENKHOA 
FROM dbo.GIAOVIEN AS GV, dbo.KHOA AS KH, dbo.BOMON AS BM 
WHERE BM.MAKHOA = KH.MAKHOA AND GV.MABM = BM.MABM