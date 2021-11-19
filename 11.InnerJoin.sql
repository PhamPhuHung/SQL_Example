USE Test8_TruyVanCoBan
GO

-- Truy vấn có điều kiện
SELECT * FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MABM = BM.MABM

--Inner Join
-- SELECT <Danh sách column>
-- FROM <TABLE A> INNER JOIN <TABLE B>
-- ON <Điều kiện JOIN B>
SELECT * FROM dbo.GIAOVIEN AS GV INNER JOIN dbo.BOMON AS BM
ON BM.MABM = GV.MABM

-- Inner Join trả về kết quả giống như truy vấn có điều kiện
-- Truy vấn có điều kiện là Inner Join kiều cũ, có thể ko hỗ trợ nữa trong tương lai
-- Truy vấn có điều kiện sẽ tạo bảng tổng hợp trước (vd: 10 record * 10 record = 100), sau đó xét điều kiện và show ra. Nên sẽ chậm hơn Inner Join kiểu mới
-- Inner Join có thể viết tắt là Join. 
-- Inner Join có nhắc lệnh (bằng các khóa ngoại)


-- Xuất ra tên giáo viên và tên người thân tương ứng
SELECT GV.HOTEN AS N'Giáo viên', NT.TEN AS N'Người thân' 
FROM dbo.GIAOVIEN AS GV INNER JOIN dbo.NGUOITHAN AS NT
ON NT.MAGV = GV.MAGV
-- Xuất ra thông tin đề tài (mã DT, tên DT) và tên chủ đề của đề tài đó
SELECT DT.MADT, DT.TENDT, CD.TENCD FROM dbo.DETAI AS DT INNER JOIN dbo.CHUDE AS CD
ON CD.MACD = DT.MACD
-- Xuất ra thông tin đề tài (mã DT, tên DT) và tên giáo viên chủ nhiệm đề tài đó
SELECT DT.MADT, DT.TENDT, GV.HOTEN AS 'GVCNDT' FROM dbo.DETAI AS DT INNER JOIN dbo.GIAOVIEN AS GV
ON GV.MAGV = DT.GVCNDT

-- Inner Join nhiều table
-- Select <Danh sách Column
-- From <Table A>
-- INNER JOIN <Table B> ON <Điều kiện JOIN B>
-- INNER JOIN <Table C> ON <Điều kiện JOIN C>

-- Xuất ra thông tin giáo viên (mã GV, tên GV) và tên khoa mà giáo viên đó giảng dạy
SELECT GV.MAGV, GV.HOTEN, TENKHOA 
FROM dbo.GIAOVIEN AS GV
INNER JOIN dbo.BOMON ON BOMON.MABM = GV.MABM
INNER JOIN dbo.KHOA ON KHOA.MAKHOA = BOMON.MAKHOA

-- Có thể kết hợp INNER JOIN với các điều kiện khác (không phải khóa ngoại) bằng cách kết hợp với WHERE
-- Xuất ra thông tin giáo vien nam, bộ môn và khoa mà giáo viên đó giảng dạy
SELECT GV.MAGV, GV.HOTEN, GV.PHAI, TENBM, TENKHOA 
FROM dbo.GIAOVIEN AS GV
INNER JOIN dbo.BOMON ON BOMON.MABM = GV.MABM
INNER JOIN dbo.KHOA ON KHOA.MAKHOA = BOMON.MAKHOA
WHERE GV.PHAI = 'Nam'
-- Xuất ra thông tin đề tài (Mã DT, tên DT) và tên GVCNDT của đề tài có ngày kết thúc trước năm 2009
SELECT MADT, TENDT, YEAR(NGAYKT) AS N'Năm kết thúc', HOTEN AS 'GVCNDT'
FROM dbo.DETAI
INNER JOIN dbo.GIAOVIEN ON GIAOVIEN.MAGV = DETAI.GVCNDT
WHERE YEAR(NGAYKT) < 2009