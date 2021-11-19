USE Test8_TruyVanCoBan
GO

-- FULL OUTER JOIN là kết hợp tất cả dữ liệu chung và riêng của 2 bảng thông qua điều kiện
-- Dữ liệu chung = dữ liệu khi dùng INNER JOIN
-- Dữ liệu riêng = dữ liệu chỉ 1 trong 2 bảng có, bảng còn lại sẽ hiển thị giá trị NULL

-- Cấu trúc
-- SELECT <Danh sách COLUMN>
-- FROM <TABLE A>
-- FULL OUTER JOIN
-- ON <Điều kiện kết hợp AB>

-- Hiển thị các GVCNDT và chưa CNDT
SELECT MAGV, HOTEN AS N'Giáo viên', TENDT 
FROM dbo.GIAOVIEN
FULL OUTER JOIN dbo.DETAI
ON DETAI.GVCNDT = GIAOVIEN.MAGV

-- Hiển thị thông tin bộ môn đã có giáo viên dạy và chưa có giáo viên dạy
SELECT BOMON.MABM, TENBM, HOTEN AS N'Giáo viên giảng dạy' FROM dbo.BOMON
FULL OUTER JOIN dbo.GIAOVIEN 
ON GIAOVIEN.MABM = BOMON.MABM

-- Hiển thị danh sách giáo viên có người thân và chưa có người thân
SELECT GIAOVIEN.MAGV, HOTEN AS N'Giáo viên', TEN AS N'Người thân' 
FROM dbo.GIAOVIEN
FULL OUTER JOIN dbo.NGUOITHAN
ON NGUOITHAN.MAGV = GIAOVIEN.MAGV

-- FULL OUTER JOIN có thể kết hợp thêm điều kiện khác bằng cách sử dụng thêm WHERE

-- Xuất ra danh sách các giáo viên nữ có và chưa có người thân
SELECT GIAOVIEN.MAGV, HOTEN AS N'Giáo viên', GIAOVIEN.PHAI, TEN AS N'Người thân' FROM dbo.GIAOVIEN
FULL OUTER JOIN dbo.NGUOITHAN 
ON NGUOITHAN.MAGV = GIAOVIEN.MAGV
WHERE GIAOVIEN.PHAI = N'Nữ'

-- Xuất thông tin bộ môn thuộc khoa CNTT đã có giáo viên dạy và chưa có giáo viên dạy
SELECT BOMON.MAKHOA, TENKHOA, BOMON.MABM, TENBM, HOTEN AS N'Giáo viên giảng dạy' FROM dbo.BOMON
FULL OUTER JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
FULL OUTER JOIN dbo.KHOA ON KHOA.MAKHOA = BOMON.MAKHOA
WHERE BOMON.MAKHOA = 'CNTT'
