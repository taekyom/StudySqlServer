declare @year int;
set @year=1980;

if @year >=1980
begin
	select * from userTbl where birthYear >= @year;
end
else
begin
	print '검색을 할 수 없습니다';
end
