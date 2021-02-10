declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = GETDATE();
set @curYear = year(@curDate); --@curYear�� @curDate���� year�� ������
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
/*print replicate('0', 2 - len(@curMonth)) + @curMonth; --�� ǥ���� �� �տ� 0�� ���̴� �� ex> 02, 03*/
print right(('00' + @curMonth), 2); --�� ǥ���� �� �տ� 0�� ���̴� �� ex> 02, 03
print format(@curDate, 'yyyy-MM-dd'); --���� ���� ���
Print @curDay;

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bNam nvarchar(100) not null); ';

exec(@sql);
