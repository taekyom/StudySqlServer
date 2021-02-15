use sqlDB;
go

create or alter procedure usp_error
	@userid char(8),
	@username nvarchar(10),
	@birthyear int = 1990,
	@addr nchar(2) = '����',
	@mobile1 char(3) = null,
	@mobile2 char(8) = null,
	@height smallint = 170,
	@mdate date = '2021-02-15'
as
	declare @err int;
    BEGIN TRY
		BEGIN TRAN
			INSERT INTO userTbl values
			   (@userID
			   ,@username
			   ,@birthyear
			   ,@addr
			   ,@mobile1
			   ,@mobile2
			   ,@height
			   ,@mDate);
		COMMIT;
	END TRY
	BEGIN CATCH
		select @err = ERROR_NUMBER();
		ROLLBACK;
	END CATCH

	if @err != 0
	begin
		print '###' + @username + '��/�� insert�� �����߽��ϴ�'
	end

	print concat('������ȣ : ', @err); --������ȣ ������

GO

go

exec usp_error 'WDT', '�����', 1988, '�λ�', '019', '99999990', 190, '2021-02-14';
exec usp_error 'WDD', '����';
