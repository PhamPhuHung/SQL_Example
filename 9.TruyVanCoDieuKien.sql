Use Test8_TruyVanCoBan
GO

-- Xuất ra giáo viên có lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- Xuất ra giáo viên là nữ và có lương > 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000 AND PHAI = N'Nữ'

-- Xuất ra họ tên, năm sinh và tuổi của những giáo viên > 40 tuổi
SELECT HOTEN, YEAR(NGSINH) AS N'Năm sinh', YEAR(GETDATE()) - YEAR(NGSINH) AS N'Tuổi' FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 40

-- Xuất ra những giáo viên là trưởng bộ môn
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MAGV = BM.TRUONGBM

-- Xuất ra tên giáo viên và tên đề tài mà giáo viên đó tham gia
SELECT GV.MAGV, GV.HOTEN, DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE GV.MAGV = TGDT.MAGV AND	TGDT.MADT = DT. MADT

-- Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt
SELECT GV.MAGV, GV.HOTEN, DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE GV.MAGV = TGDT.MAGV AND	TGDT.MADT = DT. MADT AND TGDT.KETQUA = N'Đạt'

-- Hàm COUNT: Đếm số lượng record được chỉ định
-- Đếm số lượng giáo viên có trong bảng GIAOVIEN 
SELECT COUNT(*) FROM dbo.GIAOVIEN
-- Đếm số lượng người thân của giáo viên có mã là 007
SELECT COUNT(*) AS N'Số lượng người thân' FROM dbo.NGUOITHAN
WHERE MAGV = '007'
-- Xuất ra số lượng giáo viên của khoa CNTT
SELECT COUNT(*) AS N'Số lượng giáo viên' FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = 'CNTT'

-- Hàm AVG(): Lấy giá trị trung bình của 1 column có giá trị số được chỉ định
-- Xuất ra mức lương trung bình của các giáo viên
SELECT AVG(LUONG) AS N'Lương trung bình' FROM dbo.GIAOVIEN
-- Xuất ra trung bình lương và tuổi trung bình của các giáo viên nữ 
SELECT AVG(LUONG) AS N'Lương trung bình', AVG(YEAR(GETDATE())-YEAR(NGSINH)) AS N'Tuổi trung bình' FROM dbo.GIAOVIEN
WHERE PHAI = N'Nữ'

-- Hàm SUM(): lấy giá trị tổng của 1 column được chỉ định
-- Xuất ra tổng kinh phí dành cho các đề tài có thời gian kết thúc trước năm 2009
SELECT SUM(KINHPHI) AS N'Tổng kinh phí' FROM dbo.DETAI
WHERE YEAR(NGAYKT) < 2009
-- Xuất ra tổng lương của các giáo viên nam có năm sinh trước 1960
SELECT SUM(LUONG) AS N'Tổng lương' FROM dbo.GIAOVIEN
WHERE YEAR(NGSINH) < 1960 AND PHAI = N'Nam'

-- Bài tập
-- Xuất ra MaGV, HoTen của giáo viên và tên của giáo viên quản lý chủ nhiệm của người đó
SELECT GV1.MAGV, GV1.HOTEN, GV2.HOTEN AS 'GVQLCN' FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV
