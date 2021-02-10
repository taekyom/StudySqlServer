create view uv_buyTBL
AS
	select num, productName, groupName from buyTbl where groupName = '전자';
go

select * from uv_buyTBL;
insert into uv_buyTBL values ('KKH', '기타', '악기', 4000, 1);
begin tran; --트랜잭션

delete from uv_buyTBL;

rollback --복귀