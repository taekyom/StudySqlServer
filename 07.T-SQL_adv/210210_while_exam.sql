declare @i int, @hap bigint=0; --1~100까지
set @i=0;

while(@i <= 100) --'@변수'만 while문 안에 넣으면 데이터베이스에서는 null로 인식, 바로 while문 빠져나가서 @hap 값만 실행 = 0
begin
	if (@i % 7 = 0) --7로 나눠서 나머지 0 = 7의 배수
	begin 
		print concat('7의 배수, ', @i);
		set @i += 1;
		continue;
	end

	set @hap += @i;
	if (@hap > 1000) break;
	set @i += 1;
end

print @hap;