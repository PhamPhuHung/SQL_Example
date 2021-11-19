USE Test8_TruyVanCoBan
GO

/*
Kiểu dữ liệu tự định nghĩa, CÚ PHÁP:
EXEC sp_addtype 'Tên kiểu dữ liệu tự định nghĩa', 'Kiểu dữ liệu thực tế', 'NOT NULL' (có thể có/ko)
*/
EXEC sp_addtype 'NNAME', 'NVARCHAR(100)', 'NOT NULL'
CREATE TABLE TestType
(	
	Name NName,
	Address NVARCHAR(500)
)
GO

EXEC sp_addtype 'NADDRESS', 'NVARCHAR(500)'

-- xÓA 
EXEC sp_droptype 'NADDRESS'