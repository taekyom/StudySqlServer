use sqlDB;
go

create trigger trg_testtbl
on testtbl
after insert, delete, update --�����ϰ� ������ �� Ʈ���Ű� �ߵ�
as 
	print '�� Ʈ���� �߻�!';

insert into testtbl values ('BTS');
select * from testTBL where txt = '������';
update testTBL set txt = '������ new!' where id = 4;
delete testTBL where id = 3;