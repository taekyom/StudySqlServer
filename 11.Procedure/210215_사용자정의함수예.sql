--����� ���� �Լ� ������� ���� ��
select 
	  *,
	  year(getdate()) - birthyear + 1 as '����'
from userTbl;


--����� ���� �Լ� ����� ��
select *,
		dbo.ufn_getAge(birthyear) as '����'
  from userTbl;