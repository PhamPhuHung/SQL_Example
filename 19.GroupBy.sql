USE Test8_TruyVanCoBan
GO
/*
Agreeate Function

AVG()	Returns the average value
COUNT()	Returns the number of rows
FIRST()	Returns the first value
LAST()	Returns the last value
MAX()	Returns the largest value
MIN()	Returns the smallest value
ROUND()	Rounds a numeric field to the number of decimals specified
SUM()	Returns the sum
*/


/*
string function

CHARINDEX	Searches an expression in a string expression and returns its starting position if found
CONCAT()	 
LEFT()	 
LEN() / LENGTH()	Returns the length of the value in a text field
LOWER() / LCASE()	Converts character data to lower case
LTRIM()	 
SUBSTRING() / MID()	Extract characters from a text field
PATINDEX()	 
REPLACE()	 
RIGHT()	 
RTRIM()	 
UPPER() / UCASE()	Converts character data to upper case
*/

/*Cấu trúc
SELECT <DANH SÁCH COLUMN 1, AGREEATE FUNCTION(DANH SÁCH COLUMN 2 / *)>
FROM TABLE
GROUP BY <DANH SÁCH COLUMN 1>
*/
-- Các cột hiển thị phải nằm trong GROUP BY, hoặc phải là AGREEATE FUNTION

-- Xuất ra danh sách tên bộ môn và số lượng giáo viên cảu bộ môn đó
SELECT TENBM, MAKHOA, COUNT(*) AS N'Số lượng giáo viên' 
FROM dbo.BOMON INNER JOIN dbo.GIAOVIEN
ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENBM, MAKHOA

-- Nếu có nhiều column sau group by, sẽ group theo column mà sẽ cho ra nhiều kết quả nhất
SELECT TENBM, MAKHOA, COUNT(*) AS N'Số lượng giáo viên' 
FROM dbo.BOMON INNER JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENBM, MAKHOA

SELECT MAKHOA, COUNT(*) AS N'Số lượng giáo viên' 
FROM dbo.BOMON INNER JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY MAKHOA

SELECT TENBM, COUNT(*) AS N'Số lượng giáo viên' 
FROM dbo.BOMON INNER JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENBM

-- Xuất ra danh sách giáo viên có lương > lương trung bình
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > (SELECT SUM(LUONG) / COUNT(*) FROM dbo.GIAOVIEN) 

-- Xuất ra tên giáo viên và số lượng đề tài mà giáo viên đó làm
SELECT GIAOVIEN.MAGV, HOTEN, COUNT(*) FROM dbo.GIAOVIEN JOIN dbo.THAMGIADT
ON THAMGIADT.MAGV = GIAOVIEN.MAGV
GROUP BY GIAOVIEN.HOTEN, GIAOVIEN.MAGV

-- Xuất ra tên GV và số lượng đề tài GV đó đã làm (kể cả ko có đề tài)
SELECT GIAOVIEN.MAGV, HOTEN, COUNT(MADT) FROM dbo.GIAOVIEN LEFT JOIN dbo.THAMGIADT
ON THAMGIADT.MAGV = GIAOVIEN.MAGV
GROUP BY GIAOVIEN.MAGV, HOTEN

-- Xuất ra tên GV và số lượng đề tài đã hoàn thành mà GV đó tham gia
SELECT GIAOVIEN.MAGV, HOTEN, COUNT(*) FROM dbo.GIAOVIEN JOIN dbo.THAMGIADT
ON THAMGIADT.MAGV = GIAOVIEN.MAGV
WHERE KETQUA = N'Đạt'
GROUP BY GIAOVIEN.MAGV, HOTEN

-- Xuất ra tên GV và số lượng người thân của GV đó (kể cả không có người thân)
SELECT GIAOVIEN.MAGV, HOTEN, COUNT(TEN) FROM dbo.GIAOVIEN LEFT JOIN dbo.NGUOITHAN
ON NGUOITHAN.MAGV = GIAOVIEN.MAGV
GROUP BY GIAOVIEN.MAGV, HOTEN

-- Xuất ra tên khoa và số lượng bộ môn trong khoa
SELECT K.TENKHOA, COUNT(BM.MABM) AS N'Số lượng BM'
FROM dbo.KHOA AS K
LEFT JOIN dbo.BOMON AS BM ON BM.MAKHOA = K.MAKHOA
GROUP BY K.TENKHOA

-- Xuất ra tên bộ môn và số lượng giáo viên trong bộ môn
SELECT TENBM, COUNT(MAGV) AS N'Số lượng giáo viên'
FROM dbo.BOMON 
LEFT JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENBM

-- Xuất ra tên khoa và số lượng giáo viên trong khoa
SELECT  TENKHOA, COUNT(MAGV) FROM dbo.KHOA
LEFT JOIN dbo.BOMON ON BOMON.MAKHOA = KHOA.MAKHOA
LEFT JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENKHOA

-- Xuất ra tên khoa có số lượng giáo viên lớn nhất
SELECT TOP(1) TENKHOA, COUNT(MAGV) FROM dbo.KHOA
LEFT JOIN dbo.BOMON ON BOMON.MAKHOA = KHOA.MAKHOA
LEFT JOIN dbo.GIAOVIEN ON GIAOVIEN.MABM = BOMON.MABM
GROUP BY TENKHOA
ORDER BY COUNT(MAGV) DESC
