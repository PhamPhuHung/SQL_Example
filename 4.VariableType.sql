-- Các kiểu dữ liệu hay dùng

-- int: kiểu số nguyên
-- bigint: kiểu long
-- float: kiểu số thực
-- char: kiểu ký tự. Bộ nhớ cấp phát cứng. vd: A, a, b, char(10)-> 10 ô nhớ
-- varchar: kiểu ký tự. Bộ nhớ cấp phát động. vd: varchar(10)-> 10 ô nhớ chỉ được lấy khi có dữ liệu bên trong
-- nchar: kiểu kí tự cấp phát cứng, cho phép unicode (lưu tiếng việt)
-- nvarchar: kiểu kí tự cấp phát động, cho phép unicode (lưu tiếng việt)
-- date: lưu ngày tháng năm
-- time: lưu trữ giờ phút giây
-- text: lưu văn bản lớn
-- ntext: lưu trữ văn bản lớn, cho phép unicode (lưu tiếng việt)
-- bit: Lưu giá trị 0 hoặc 1

CREATE DATABASE VariableTest

CREATE TABLE VariableTest
(
	Doc NVARCHAR(50), -- khai báo trường Doc kiểu nvarchar cấp phát động 50 ô nhớ
	MaSV CHAR(10), -- Khai báo trường MaSV kiểu char cấp phát cứng 10 ô nhớ
	Birthdate DATE,
	Sex BIT, -- lưu giá trị 0 hoặc 1
)
GO
