use sqlDB;
go

create or alter function ufn_getZodia(@birthyear int)
returns nchar(3)
as
	begin
		declare @result nchar(3);
		set @result = 
			case
				when (@birthyear % 12 =0) then '������'
				when (@birthyear % 12 =1) then '��'
				when (@birthyear % 12 =2) then '��'
				when (@birthyear % 12 =3) then '����'
				when (@birthyear % 12 =4) then '��'
				when (@birthyear % 12 =5) then '��'
				when (@birthyear % 12 =6) then 'ȣ����'
				when (@birthyear % 12 =7) then '�䳢'
				when (@birthyear % 12 =8) then '��'
				when (@birthyear % 12 =9) then '��'
				when (@birthyear % 12 =10) then '��'
				else '��'
			end;
		return @result;
	end

go