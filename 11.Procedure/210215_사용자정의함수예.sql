--����� ���� �Լ� ������� ���� ��
select 
	  *,
	  year(getdate()) - birthyear + 1 as '����'
from userTbl;


--����� ���� �Լ� ����� ��
select *,
		dbo.ufn_getAge(birthyear) as '����',
		dbo.ufn_getZodia(birthyear) as '��'
  from userTbl;