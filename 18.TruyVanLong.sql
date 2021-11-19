USE Test8_TruyVanCoBan
GO

-- Truy vấn lồng

-- Kiểm tra xem giáo viên 001 có phải là GVQLCM hay không
-- Hướng dẫn:
-- Lấy ra danh sách các mã giáo viên QLCM
-- Kiểm tra mã GV tồn tại trong danh sách đó
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001'
AND MAGV IN 
(
	SELECT GVQLCM FROM dbo.GIAOVIEN
)

-- truy vấn lồng trong from
SELECT * FROM
dbo.GIAOVIEN, (SELECT * FROM dbo.DETAI) AS DT

-- Xuất ra danh sách giáo viên tham gia nhiều hơn 1 đề tài
SELECT * FROM dbo.GIAOVIEN
WHERE 1 <
(
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE dbo.THAMGIADT.MAGV = dbo.GIAOVIEN.MAGV
)

-- Xuất ra thông tin của khoa mà có nhiều hơn 2 giáo viên
SELECT * FROM dbo.KHOA
WHERE 2 <
(
	SELECT COUNT(*) FROM dbo.BOMON JOIN dbo.GIAOVIEN
	ON GIAOVIEN.MABM = BOMON.MABM
	WHERE MAKHOA = dbo.KHOA.MAKHOA
)

-- Sắp xếp giảm dần
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- Sắp xếp tăng dần
SELECT * FROM dbo.GIAOVIEN
ORDER BY MAGV ASC

-- Lấy ra TOP 5 phần tử
SELECT TOP(5) * FROM dbo.GIAOVIEN

-- Xuất ra thông tin giáo viên mà có nhiều hơn 2 người thân
SELECT GV.MAGV, HOTEN AS N'Giáo viên' FROM dbo.GIAOVIEN AS GV
WHERE 1<
(
	SELECT COUNT(*) FROM dbo.NGUOITHAN AS NT
	WHERE GV.MAGV = NT.MAGV
)
-- Xuất ra danh sách các giáo viên lớn tuổi hơn ít nhất 5 giáo viên trong trường\
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV NOT IN
(
	SELECT TOP(5) MAGV FROM dbo.GIAOVIEN
	ORDER BY NGSINH DESC
)

SELECT * FROM dbo.GIAOVIEN
	ORDER BY NGSINH ASC