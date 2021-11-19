USE Test8_TruyVanCoBan
GO
-- Tạo ra 1 bảng mới có các record tương ứng trong bảng cũ
-- Thường dùng để back up dữ liệu

-- Cấu trúc
-- SELECT <Danh sách COLUMN> INTO <TABLE A>
-- FROM <TABLE B>


-- Lấy hết dữ liệu của bảng GV đưa vào bảng TableA
SELECT * INTO TableA
FROM dbo.GIAOVIEN

-- Tạo bảng TableB có 1 cột dữ liệu là HOTEN tương ứng như bảng GV
-- Điều kiện là lương của các giáo viên đó > 2000
SELECT HOTEN AS N'Giáo viên có lương > 2000', LUONG INTO TableB
FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Tạo bảng TableC từ nhiều bảng
SELECT MAGV, HOTEN, TENBM INTO GVBackup
FROM dbo.GIAOVIEN, dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

-- Tạo ra một bảng GVBK y chang nhưng không có dữ liệu
SELECT * INTO GVBK
FROM dbo.GIAOVIEN
WHERE 6>9