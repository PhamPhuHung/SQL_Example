USE Test8_TruyVanCoBan GO

/*
- Cú pháp khao báo biến
	DECLARE @<Tên biến> <Kiểu dữ liệu>
	DECLARE @<Tên biến> <Kiểu dữ liệu> = <Giá trị ban đầu>
- Set giá trị cho biến (như C#)
	SET @<Tên biến> = <Giá trị>
	SET @<Tên biến 1> = @<Tên biến 2>
	SELECT @<Tên biến> = <Giá trị> FROM TABLE

- Phải chạy đồng loạt câu lệnh declare với các câu lệnh liên quan

- Cú pháp print
	Print <Biến / Giá trị muốn print>
*/

-- In ra giá trị lương cao nhất trong bảng giáo viên
DECLARE @LuongMax INT
SELECT @LuongMax = MAX(LUONG) FROM dbo.GIAOVIEN
PRINT @LuongMax

-- Xuất ra bảng các giáo viên có lương cao nhất
DECLARE @LuongMax INT
SELECT @LuongMax = MAX(LUONG) FROM dbo.GIAOVIEN

SELECT * FROM dbo.GIAOVIEN WHERE LUONG = @LuongMax

-- In ra tên giáo viên có lương thấp nhất
DECLARE @LuongMin INT 
SELECT @LuongMin = MIN(LUONG) FROM dbo.GIAOVIEN

DECLARE @GiaoVienLuongMin NVARCHAR(50)
SELECT @GiaoVienLuongMin = HOTEN FROM dbo.GIAOVIEN WHERE LUONG = @LuongMin

PRINT @GiaoVienLuongMin

SELECT * FROM dbo.GIAOVIEN
