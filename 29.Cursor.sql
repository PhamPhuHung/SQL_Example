USE Test8_TruyVanCoBan GO

/*
Khi có nhu cầu duyệt từng record của bảng, với mỗi record có kết quả xử lý riêng thì dùng cursor

CÚ PHÁP:
-- DECLARE <Tên con trỏ> CURSOR FOR <Câu select> -- Tạo con trỏ trỏ đến bảng tạo ra từ câu select (trỏ vào vị trí trống đầu tiên của bảng)
-- OPEN <Tên con trỏ> -- Mở con trỏ

-- FETCH NEXT FROM <Tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn> -- Chuyển con trỏ đến vị trí tiếp theo
-- @@FETCH_STATUS = 0 -- Con trỏ chưa đi đến cuối bảng

-- CLOSE <Tên con trỏ> -- Đóng con trỏ
-- DEALLOCATE <Tên con trỏ> - Xóa con trỏ
*/

-----------------------------------------------------------------------------------------------------------------------------------------------

-- Ex1: Từ tuổi của GV, nếu > 50 thì cho lương là 2500, <50 & > 45 thì cho lương là 2000, nếu ko thì lương là 1500
SELECT * INTO CloneGV FROM dbo.GIAOVIEN

DECLARE GVCursor CURSOR FOR SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.CloneGV
OPEN GVCursor

DECLARE @MaGV NCHAR(3)
DECLARE @Tuoi INT 

FETCH NEXT FROM GVCursor INTO @MaGV, @Tuoi
WHILE @@FETCH_STATUS=0
BEGIN
    IF @Tuoi > 50
		UPDATE dbo.CloneGV SET LUONG = 5500 WHERE MAGV = @MaGV
	ELSE IF @Tuoi >45
		UPDATE dbo.CloneGV SET LUONG = 4000 WHERE MAGV = @MaGV
	ELSE
		UPDATE dbo.CloneGV SET LUONG = 3500 WHERE MAGV = @MaGV
	FETCH NEXT FROM GVCursor INTO @MaGV, @Tuoi
END
CLOSE GVCursor
DEALLOCATE GVCursor

SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH), LUONG FROM dbo.CloneGV
SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH), LUONG FROM dbo.GIAOVIEN