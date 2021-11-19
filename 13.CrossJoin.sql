-- CROSS JOIN trả kết quả như khi tìm kiếm 2 bảng không có điều kiện


USE Test13_CHIANHOM
GO

-- Tạo danh sách chia nhóm cho môn học mà mỗi cá nhân ở nhóm A 
-- đều phải lần lượt chung nhóm với 1 cá nhân của nhóm B
SELECT * FROM dbo.NHOM_A
CROSS JOIN dbo.NHOM_B

-- Tạo danh sách mà mỗi hs nhóm A đều phải tham gia tất cả các môn
SELECT * FROM dbo.NHOM_A
CROSS JOIN dbo.MONTHI

-- CROSS JOIN kết hợp điều kiện
-- Xuất 1 danh sách thi mà mỗi học sinh có họ Trần ở nhóm A đều phải tham gia tất cả các môn
SELECT * FROM dbo.NHOM_A
CROSS JOIN dbo.MONTHI
WHERE TENHS LIKE N'Trần%'
