use sqlDB;
go

--exec sp_helpdb;

declare @sql varchar(100);
set @sql = 'select * from userTBL where userID = ''EJW'';';
exec(@sql); --파라미터 값 입력할 때는 exec()로 입력 : 동적 쿼리 실행

