USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:28 ******/
create or ALTER   procedure usp_users4
	--@userName nvarchar(10) --파라미터(매개변수 1개)
	@txtValue nvarchar(10),
	@outValue int output -- return받는 파라미터
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); --testTBL의 현재 identity값 리턴
go


declare @pout int;
exec usp_users4 '새로운 텍스트', @pout output;

print concat('현재 입력된 값은 ==>', @pout);
select @pout as '현재값';
