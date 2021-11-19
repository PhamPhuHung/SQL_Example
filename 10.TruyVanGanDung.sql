USE Test8_TruyVanCoBan
GO

-- Cấu trúc
-- SELECT * FROM dbo.GIAOVIEN
-- WHERE HOTEN LIKE ''

-- Xuất ra giáo viên có họ tên bắt đầu bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'n%'

-- Xuất ra giáo viên có họ tên kết thúc bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%n'

-- Xuất ra giáo viên có họ tên bắt đầu và kết thúc bằng chữ n
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'n%n'

-- Xuất ra giáo viên có họ tên có chứa kí tự n ở vị trí bất kì
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '%n%'

-- Xuất ra giáo viên có họ tên có kí tự g ở vị trí thứ 2
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE '_g%'

-- Xuất ra giáo viên có họ tên bắt đầu bằng chữ n và có ít nhất 3 kí tự (nam)
SELECT * FROM dbo.GIAOVIEN
WHERE HOTEN LIKE 'n_%_%'