USE Test8_TruyVanCoBan 
GO

/*
STORE PROCEDURE
- Là chương trình hay thủ tục
- Ta có hể dùng Transact-SQL EXECUTE (EXEC) để thực thi các Store Procedure
- Store Procedure khác với FUNCTION là giá trị trả về của chúng (STORE PROC trả về giá trị
không chứa trong tên và chúng không được sử dụng trục tiếp trong biểu thức

ĐẶC TÍNH
- Động: có thể chỉnh sửa khối lệnh, tái sử dụng nhiều lần
- Nhanh hơn: Tự phân tích cú pháp cho tối ưu, tạo bản sao để lần chạy sau không cần thực thi lại từ đầu
- Bảo mật: Giới hạn quyền cho user nào sử dụng, user nào không
- Giảm Bandwidth: Với các gói transaction lớn (vài ngàn lệnh) thì dùng store procedure sẽ đảm bảo

CÚ PHÁP TẠO PROCEDURE
	CREATE PROC <Tên stored procedure> -- PROC hoặc PROCEDURE
	<Parameter nếu có>
	AS
	BEGIN
		<Code xử lý>
	END

	-- BEGIN END dùng khi có nhiều hơn 1 dòng code
		
CÚ PHÁP SỬ DỤNG PROCEDURE ĐÃ TẠO
	EXEC <Tên stored procedure> -- EXEC hoặc EXECUTE
	<Parameter và giá trị tương ứng nếu có>

CÚ PHÁP XÓA PROCEDURE
	DROP PROC <Tên stored procedure>
*/

-------------------------------------------------------------------------------------------------------------------------
-- Ví dụ: Tạo Procedure nhập vào mã giáo viên và lấy ra thông tin giáo viên
CREATE PROC UP_GetGV 
@MaGV NVARCHAR(10)
AS SELECT * FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
GO
--Các cách gọi hàm EXEC
EXEC dbo.UP_GetGV @MaGV = N'001' -- nvarchar(10)
EXEC dbo.UP_GetGV N'001' -- nvarchar(10)
EXECUTE dbo.UP_GetGV @MaGV = N'001' -- nvarchar(10)
EXECUTE dbo.UP_GetGV N'001' -- nvarchar(10)
GO 

DROP PROC dbo.UP_GetGV
GO 
-------------------------------------------------------------------------------------------------------------------------
-- Ví dụ: Tạo Procedure nhập vào mã giáo viên và lương -> sửa lương của giáo viên đó
CREATE PROC UP_EditLuongGV
@MaGV NVARCHAR(10), @luong INT 
AS UPDATE dbo.GIAOVIEN SET LUONG = @luong WHERE MAGV = @MaGV
GO 

EXEC dbo.UP_EditLuongGV @MaGV = N'002', -- nvarchar(10)
                        @luong = 2500   -- int
GO 

SELECT * FROM dbo.GIAOVIEN WHERE MAGV = '002'

DROP PROC dbo.UP_EditLuongGV



