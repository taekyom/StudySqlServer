use tempdb;
go

create table bankbook(
	uName nvarchar(10),
	uMoney int,
		constraint CK_money
		check (uMoney >= 0)
);
go 
insert into bankbook values (N'구매자', 1000);
insert into bankbook values (N'판매자', 0);

--BEGIN TRAN
	Update bankbook set uMoney = uMoney - 500 where uName = N'구매자';
--COMMIT TRAN
--BEGIN TRAN
	Update bankbook set uMoney = uMoney + 500 where uName = N'판매자';
--COMMIT TRAN
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'구매자'; --오류발생으로 작업 수행 X
update bankbook set uMoney = uMoney + 600 where uName = N'판매자'; --정상 수행
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'판매자';

BEGIN TRAN
	update bankbook set uMoney = uMoney - 600 where uName = N'구매자'; 
	update bankbook set uMoney = uMoney + 600 where uName = N'판매자'; 
COMMIT TRAN
select * from bankbook;

update bankbook set uMoney = uMoney - 600 where uName = N'판매자';

BEGIN TRY
	BEGIN TRAN
		update bankbook set uMoney = uMoney - 600 where uName = N'구매자'; 
		update bankbook set uMoney = uMoney + 600 where uName = N'판매자'; 
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN	
END CATCH
	select * from bankbook;