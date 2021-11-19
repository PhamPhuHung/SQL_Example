USE Test8_TruyVanCoBan 
GO

/*
CÁC FUNCTION CÓ SẴN: COUNT(), MAX(), MIN, AVG(), ....

CÚ PHÁP TẠO FUNCTION
	CREATE FUNCTION <Tên function>(<Parameter truyền vào> <Kiểu dữ liệu của Parameter>)
	RETURNS <Kiểu dữ liệu trả về>
	AS  RETURN <Dòng code mà sẽ trả về dữ liệu có kiểu dữ liệu đã cài phía trên>

CÚ PHÁP SỬA FUNCTION
	ALTER FUNCTION <Tên function>(<Parameter truyền vào> <Kiểu dữ liệu của Parameter>)
	RETURNS <Kiểu dữ liệu trả về>
	AS  RETURN <Dòng code mà sẽ trả về dữ liệu có kiểu dữ liệu đã cài phía trên>

CÚ PHÁP XÓA FUNCTION 
	DROP FUNCTION <Tên function>
*/



--------------------------------------------------------------------------------------------
-- Tạo function truyền vào MaGV, trả về lương
CREATE FUNCTION UF_GetLuongGV(@MaGV NVARCHAR(10))
RETURNS INT
AS 
BEGIN
	DECLARE @Luong INT
	SELECT @Luong = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	RETURN @Luong
END
GO

SELECT MAGV, LUONG, dbo.UF_GetLuongGV(MAGV) AS N'Lương' FROM dbo.GIAOVIEN
GO 

--------------------------------------------------------------------------------------------
-- Kiểm tra số truyền vào là số chẵn hay số lẻ
CREATE FUNCTION UF_IsOdd(@Num INT)
RETURNS NVARCHAR(4)
AS 
BEGIN
	DECLARE @s NVARCHAR(20)
    IF @Num%2=0 SET @s = N'Chẵn'
	ELSE SET @s = N'Lẻ'
	RETURN @s
END
GO

-- Tạo function truyền vào ngày sinh xuất ra tuổi
CREATE FUNCTION UF_AgeOfYear(@NgSinh DATE)
RETURNS INT 
AS 
BEGIN
    DECLARE @age INT = 0
	SET @age = YEAR(GETDATE()) - YEAR(@NgSinh)
	RETURN @age
END
GO 
-- Kiểm tra tuổi của giáo viên là chẵn hay lẻ
SELECT MAGV, dbo.UF_AgeOfYear(NGSINH) AS N'Tuổi', N'Tuổi ' + dbo.UF_IsOdd(dbo.UF_AgeOfYear(NGSINH)) AS N'Tuổi chẵn hay lẻ' FROM dbo.GIAOVIEN