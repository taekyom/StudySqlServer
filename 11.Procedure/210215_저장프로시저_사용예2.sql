use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)
as
	declare @birthyear int; --출생연도 저장변수
	select @birthyear = birthyear
	  from userTbl
	 where userName = @userName;

	 IF	(@birthyear >= 1980)
	 begin
		print '아직 젊군요';
	 end
	 else
	 begin
		print '나이가 지긋하네요';
	 end

go

exec usp_ifelse '이승기';
