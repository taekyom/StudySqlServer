use sqlDB;
go

create or alter function ufn_getZodia(@birthyear int)
returns nchar(3)
as
	begin
		declare @result nchar(3);
		set @result = 
			case
				when (@birthyear % 12 =0) then '¿ø¼şÀÌ'
				when (@birthyear % 12 =1) then '´ß'
				when (@birthyear % 12 =2) then '°³'
				when (@birthyear % 12 =3) then 'µÅÁö'
				when (@birthyear % 12 =4) then 'Áã'
				when (@birthyear % 12 =5) then '¼Ò'
				when (@birthyear % 12 =6) then 'È£¶ûÀÌ'
				when (@birthyear % 12 =7) then 'Åä³¢'
				when (@birthyear % 12 =8) then '¿ë'
				when (@birthyear % 12 =9) then '¹ì'
				when (@birthyear % 12 =10) then '¸»'
				else '¾ç'
			end;
		return @result;
	end

go