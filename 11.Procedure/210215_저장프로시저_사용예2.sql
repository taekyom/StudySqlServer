use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)
as
	declare @birthyear int; --������� ���庯��
	select @birthyear = birthyear
	  from userTbl
	 where userName = @userName;

	 IF	(@birthyear >= 1980)
	 begin
		print '���� ������';
	 end
	 else
	 begin
		print '���̰� �����ϳ׿�';
	 end

go

exec usp_ifelse '�̽±�';
