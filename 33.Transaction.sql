USE Test8_TruyVanCoBan
GO

/*
TRANSACTION: Chuyển đổi saction
- Phân vùng saction, vd saction1, saction2, ...
- Mỗi khi thực hiện 1 saction, kiểm tra điều kiện, nếu ko thỏa, sẽ quay lại saction trước (UNDO)

CÚ PHÁP
- 1 mốc thời gian để quay lại

	BEGIN TRANSACTION -- Bắt đầu transaction 
	<Code xử lý>
	ROLLBACK -- Kết thúc transaction, hủy bỏ các thao tác đã thực hiện

	BEGIN TRANSACTION -- Bắt đầu transaction 
	<Code xử lý>
	COMMIT -- Kết thúc transaction, chấp nhận các thao tác đã thực hiện

- Đặt tên cho TRANSACTION 

	DECLARE @Trans NVARCHAR(10)
	SET @trans = 'Trans1'
	BEGIN TRANSACTION @Trans
	ROLLBACK TRANSACTION @Trans

	DECLARE @Trans NVARCHAR(10)
	SET @trans = 'Trans1'
	BEGIN TRANSACTION @Trans
	COMMIT TRANSACTION @Trans

- Nhiều mốc thời gian để quay lại
	
	BEGIN TRANSACTION
	SAVE TRANSACTION Trans1
	<Code xử lý 1 >
	SAVE TRANSACTION Trans2
	<Code xử lý 2>
	ROLLBACK Trans1 -> UNDO code xử lý 1 và code xử lý 2
			 Trans2 -> UNDO code xử lý 2
*/


