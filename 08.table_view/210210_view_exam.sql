create view uv_buyTBL
AS
	select num, productName, groupName from buyTbl where groupName = '����';
go

select * from uv_buyTBL;
insert into uv_buyTBL values ('KKH', '��Ÿ', '�Ǳ�', 4000, 1);
begin tran; --Ʈ�����

delete from uv_buyTBL;

rollback --����