--����ڷ��� �������ִ� �Լ�
create or alter function dbo.ufn_getLevel(@levels char(1))
 returns nvarchar(5) 
 as 
 begin
	declare @result nvarchar(5); --�÷�Ƽ��, ���, �ǹ�, ����� ȸ�� �� ����
	set @result = case @levels
					when 'A' then '�÷�Ƽ�� ȸ��'
					when 'B' then '��� ȸ��'
					when 'C' then '�ǹ� ȸ��'
					when 'D' then '����� ȸ��'
					when 'S' then '������'
			       else '��ȸ��'
	              end;
	return @result;
 end
 go