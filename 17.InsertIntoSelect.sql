﻿USE Test8_TruyVanCoBan
GO

-- INSERT INTO SELECT: Copy dữ liệu vào trong bảng đã tồn tại
SELECT * INTO CLoneGV
FROM dbo.GIAOVIEN
WHERE 1=0

INSERT INTO CloneGV
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM CloneGV