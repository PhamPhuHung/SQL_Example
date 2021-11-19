USE Test8_TruyVanCoBan
GO

/*
TRIGGER: được gọi mỗi khi có thao tác thay đổi thông tin bảng (insert, update, delete) (như Event)

Khi tạo trigger cho 1 bảng, thì cũng đồng thời tạo thêm 2 bảng
	Inserted: chứa những trường đã insert / update vào bảng
	Deleted: Chứa những trường đã delete khỏi bảng

CÚ PHÁP TẠO TRIGGER
	CREATE TRIGGER <Tên trigger> on <Tên bảng>
	FOR INSERT -- hoặc UPDATE, hoặc DELETE (có thể tạo trigger đồng thời cho 2, 3 thao tác bằng cách ngăn cách bởi dấu <,>)
	AS
	BEGIN
		<Các dòng code xử lý>
	END

Trả lại tình trạng trước khi thay đổi
ROLLBACK TRAN -- Bảng trở về trạng thái ban đầu bằng cách lấy dữ liệu trong bảng Inserted, Deleted
*/
----------------------------------------------------------------------------------------------
-- Tạo trigger không cho phép xóa giáo viên từ 50 tuổi
CREATE TRIGGER UT_Abort_Delete50 ON dbo.GIAOVIEN
FOR DELETE AS
BEGIN
	DECLARE @count INT = 0
	SELECT @count = COUNT(*) FROM Deleted WHERE YEAR(GETDATE()) - YEAR(Deleted.NGSINH) >= 50
	IF @count > 0 
		BEGIN
			PRINT N'Không thể xóa giáo viên từ 50 tuổi'
			ROLLBACK TRAN
		END
	ELSE PRINT N'Xóa thành công'
END

SELECT MAGV, dbo.UF_AgeOfYear(NGSINH) FROM dbo.GIAOVIEN

INSERT dbo.GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM,MABM)
VALUES(N'011',N'Giáo viên 11',0.0,N'Nam','1950-05-02',N'dd',null,N'CNTT')

INSERT dbo.GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM,MABM)
VALUES(N'012',N'Giáo viên 12',0.0,N'Nam','1990-05-02',N'dd',null,N'CNTT')

DELETE dbo.GIAOVIEN WHERE MAGV = '012'
GO 
----------------------------------------------------------------------------------------------
-- Tạo trigger không cho phép thêm hoặc sửa giáo viên nam
CREATE TRIGGER UT_Abort_ModifyMale ON dbo.GIAOVIEN
FOR INSERT, UPDATE AS
BEGIN
    DECLARE @count INT
	SELECT @count = COUNT(*) FROM Inserted WHERE Inserted.PHAI = N'Nam'
	IF @count > 0
		BEGIN
		    PRINT N'Không thể thêm / sửa giáo viên nam'
			ROLLBACK TRAN
		END
	ELSE PRINT N'Thêm / sửa giáo viên thành công'
END
GO 

SELECT MAGV, HOTEN, PHAI FROM dbo.GIAOVIEN

INSERT dbo.GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM,MABM)
VALUES(N'013',N'Giáo viên 13',0.0,N'Nam','1950-05-02',N'dd',null,N'CNTT')

INSERT dbo.GIAOVIEN(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM,MABM)
VALUES(N'014',N'Giáo viên 14',0.0,N'Nữ','1990-05-02',N'dd',null,N'CNTT')

UPDATE dbo.GIAOVIEN SET LUONG = 10000 WHERE MAGV = '001'
UPDATE dbo.GIAOVIEN SET LUONG = 10000 WHERE MAGV = '014'

DELETE dbo.GIAOVIEN WHERE MAGV = '011' OR MAGV = '014'
