use sqlDB;
go

create or alter procedure usp_buyproduct
	@userID char(8) --�Ķ����
as
	select num, userID, productName, (price * amount) as '���űݾ�'
	  from buyTbl
	  where userID = @userID;
go

exec usp_buyproduct 'BBK';


