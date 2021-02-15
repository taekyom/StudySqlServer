use tempdb;
go

create table bankbook(
	uName nvarchar(10),
	uMoney int,
		constraint CK_money
		check (uMoney >= 0)
);
go 
insert into bankbook values (N'������', 1000);
insert into bankbook values (N'�Ǹ���', 0);

--BEGIN TRAN
	Update bankbook set uMoney = uMoney - 500 where uName = N'������';
--COMMIT TRAN
--BEGIN TRAN
	Update bankbook set uMoney = uMoney + 500 where uName = N'�Ǹ���';
--COMMIT TRAN
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'������'; --�����߻����� �۾� ���� X
update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���'; --���� ����
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'�Ǹ���';

BEGIN TRAN
	update bankbook set uMoney = uMoney - 600 where uName = N'������'; 
	update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���'; 
COMMIT TRAN
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'�Ǹ���';

BEGIN TRY
	BEGIN TRAN
		update bankbook set uMoney = uMoney - 600 where uName = N'������'; 
		update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���'; 
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN	
END CATCH
	select * from bankbook;