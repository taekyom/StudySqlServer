use sqlDB;
go

create trigger trg_testtbl
on testtbl
after insert, delete, update --삭제하고 수정할 때 트리거가 발동
as 
	print '새 트리거 발생!';

insert into testtbl values ('BTS');
select * from testTBL where txt = '마마무';
update testTBL set txt = '마마무 new!' where id = 4;
delete testTBL where id = 3;