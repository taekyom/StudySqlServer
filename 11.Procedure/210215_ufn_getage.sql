use sqlDB;
go

create or alter function ufn_getage
(@birthyear int)
returns int 
as
	begin
		declare @age int;
		set @age = (year(getdate()) - @birthyear) + 1 ;
		return @age;
	end
go
