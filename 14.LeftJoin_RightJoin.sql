USE Test8_TruyVanCoBan
GO

-- HALF OUTER JOIN, gồm LEFT JOIN & RIGHT JOIN
-- A LEFT JOIN B (B RIGHT JOIN A) trả về kết quả gồm
-- Dữ liệu chung (INNER JOIN)
-- Dữ liệu riêng của bảng A, các giá trị của B lúc này là NULL
-- Không hiển thị dữ liệu riêng của B

-- Cấu trúc
-- SELECT <Danh sách Column>
-- FROM <Table A> LEFT / RIGHT JOIN <Table B>
-- ON <Điều kiện kết hợp AB>

-- Xuất ra danh sách giáo viên chủ nhiệm hoặc chưa chủ nhiệm đề tài
SELECT MAGV, HOTEN AS N'Giáo viên', TENDT FROM dbo.GIAOVIEN
LEFT JOIN dbo.DETAI
ON DETAI.GVCNDT = GIAOVIEN.MAGV

-- Xuất thông tin bộ môn đã có giáo viên dạy hoặc chưa có giáo viên dạy
SELECT BOMON.MABM, TENBM, HOTEN AS N'Giáo viên giảng dạy' FROM dbo.BOMON
LEFT JOIN dbo.GIAOVIEN
ON GIAOVIEN.MABM = BOMON.MABM

-- Xuất danh sách giáo viên làm trưởng bộ môn hoặc không làm trưởng bộ môn
SELECT MAGV, HOTEN AS N'Giáo viên', TENBM FROM dbo.GIAOVIEN
LEFT JOIN dbo.BOMON
ON BOMON.TRUONGBM = GIAOVIEN.MAGV

-- Xuất danh sách bộ môn có trưởng bộ môn hoặc chưa có trưởng bộ môn
SELECT BOMON.MABM, TENBM, HOTEN AS N'Trưởng bộ môn' FROM dbo.BOMON
LEFT JOIN dbo.GIAOVIEN
ON BOMON.TRUONGBM = GIAOVIEN.MAGV

-- HALF OUTER JOIN kết hợp điều kiện
-- HALF OUTER JOIN có thể kết hợp thêm điều kiện khác bằng cách dùng WHERE

-- Xuất danh sách các giáo viên nam có người thân và không có người thân
SELECT GIAOVIEN.MAGV, HOTEN AS N'Giáo viên', GIAOVIEN.PHAI, TEN AS N'Người thân' FROM dbo.GIAOVIEN
LEFT JOIN dbo.NGUOITHAN
ON NGUOITHAN.MAGV = GIAOVIEN.MAGV
WHERE GIAOVIEN.PHAI = N'Nam'
-- Xuất thông tin bộ môn thuộc khoa Sinh học (SH) đã có giáo viên dạy và chưa có giáo viên dạy
SELECT BOMON.MAKHOA, TENKHOA, BOMON.MABM, TENBM, HOTEN AS N'Giáo viên giảng dạy' FROM dbo.KHOA
JOIN dbo.BOMON ON BOMON.MAKHOA = KHOA.MAKHOA
LEFT JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
WHERE BOMON.MAKHOA = 'SH'