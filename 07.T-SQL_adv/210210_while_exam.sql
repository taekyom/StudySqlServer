declare @i int, @hap bigint=0; --1~100����
set @i=0;

while(@i <= 100) --'@����'�� while�� �ȿ� ������ �����ͺ��̽������� null�� �ν�, �ٷ� while�� ���������� @hap ���� ���� = 0
begin
	if (@i % 7 = 0) --7�� ������ ������ 0 = 7�� ���
	begin 
		print concat('7�� ���, ', @i);
		set @i += 1;
		continue;
	end

	set @hap += @i;
	if (@hap > 1000) break;
	set @i += 1;
end

print @hap;