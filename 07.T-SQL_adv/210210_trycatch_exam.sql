begin
	--waitfor delay '00:00:03';
	waitfor time '11:10:30';
	print '3�� ���� �� ����';
end

begin try
    insert into userTbl values ('LSG', '�̻�', 1988, '���', null, null, 170, getdate());
	print '���� ����';
end try

begin catch
	print '���� ����, �����ڿ��� ���� ���';
end catch