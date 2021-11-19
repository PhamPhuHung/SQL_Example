USE Test8_TruyVanCoBan GO

/*
Cú pháp:
IF
	BEGIN

	END
ELSE IF
	BEGIN
	
	END
ELSE
	BEGIN

	END

Dùng BEGIN - END khi có nhiều hơn 1 dòng lệnh
*/

-- In ra "Lớn hơn", "Nhỏ hơn", "Bằng" tương ứng khi so sánh lương của 1 giáo viên với lương trung bình
DECLARE @LuongAVG INT 
SELECT @LuongAVG = AVG(LUONG) FROM dbo.GIAOVIEN
PRINT @LuongAVG

DECLARE @MaGV NCHAR(3) = '001'
DECLARE @LuongGV INT 
SELECT @LuongGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV

IF @LuongGV > @LuongAVG
	PRINT N'Giáo viên ' + @MaGV + N' có lương ' + CAST(@LuongGV AS NVARCHAR(4)) + N', lớn hơn lương trung bình ' + CAST(@LuongAVG AS NVARCHAR(4))
ELSE IF @LuongGV < @LuongAVG
	PRINT N'Giáo viên ' + @MaGV + N' có lương ' + CAST(@LuongGV AS NVARCHAR(4)) + N', nhỏ hơn lương trung bình ' + CAST(@LuongAVG AS NVARCHAR(4))
ELSE 
	PRINT N'Giáo viên ' + @MaGV + N' có lương ' + CAST(@LuongGV AS NVARCHAR(4)) + N', bằng lương trung bình ' + CAST(@LuongAVG AS NVARCHAR(4))
GO 














