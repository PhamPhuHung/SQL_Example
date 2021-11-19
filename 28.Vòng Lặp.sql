USE Test8_TruyVanCoBan GO

/*
WHILE (<Điều kiện>)
BEGIN
--Các câu lệnh
END
*/

-- Thêm 10000 hàng vào bảng BoMon
-- Ten BoMon tăng dần
SELECT * INTO CloneBM FROM dbo.BOMON
DECLARE @i INT = 0
WHILE @i<10000
BEGIN
    SET @i+=1
	INSERT dbo.CloneBM
	(
	    MABM,
	    TENBM,
	    PHONG,
	    DIENTHOAI,
	    TRUONGBM,
	    MAKHOA,
	    NGAYNHANCHUC
	)
	VALUES
	(   @i+100,      -- MABM - nchar(4)
	    @i+100,      -- TENBM - nchar(50)
	    'b15',       -- PHONG - char(3)
	    '0000000',       -- DIENTHOAI - char(11)
	    NULL,      -- TRUONGBM - nchar(3)
	    N'CNTT',      -- MAKHOA - nchar(4)
	    GETDATE() -- NGAYNHANCHUC - date
	    )
END
SELECT * FROM dbo.CloneBM
DROP TABLE dbo.CloneBM