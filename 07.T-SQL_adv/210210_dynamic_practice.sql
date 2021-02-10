declare @curDate date;
declare @curYear varchar(4);
declare @curMonth varchar(2);
declare @curDay varchar(2);
declare @sql varchar(2000);

set @curDate = GETDATE();
set @curYear = year(@curDate); --@curYear는 @curDate에서 year만 가져옴
set @curMonth = month(@curDate);
set @curDay = day(@curDate);

print @curYear;
/*print replicate('0', 2 - len(@curMonth)) + @curMonth; --월 표시할 때 앞에 0을 붙이는 것 ex> 02, 03*/
print right(('00' + @curMonth), 2); --월 표시할 때 앞에 0을 붙이는 것 ex> 02, 03
print format(@curDate, 'yyyy-MM-dd'); --제일 쉬운 방법
Print @curDay;

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += ' (id int not null primary key, bNam nvarchar(100) not null); ';

exec(@sql);
