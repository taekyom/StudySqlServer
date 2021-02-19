--���� 3-1 ���� Ǯ��
select TOP 10
	   b.idx as '��ȣ'
	  ,b.division as '�帣��ȣ'
	  ,d.names as '�帣'
      ,b.names as 'å����'
      ,b.author as '����'
  from bookstbl as b
inner join dbo.divtbl as d
   on b.division = d.division
Where d.division = 'B002';


--���� 3-1 �ٸ��� Ǫ�� ��� (1)
select b.idx ��ȣ
      ,b.division '�帣 ��ȣ'
	  ,d.names �帣
	  ,b.names å����
	  ,b.author ����
  from bookstbl as b
      ,divtbl as d
 where b.division = d.division
   and b.division = 'B002'; --inner join�� on �����ϰ� where�� ����ϴ� ���


--���� 3-1 �ٸ��� Ǫ�� ��� (2)
select b.idx as '��ȣ'
	  ,b.division as '�帣��ȣ'
	  --,d.names as '�帣'
	  ,(select names from divtbl where division = b.division) as '�帣'
      ,b.names as 'å����'
      ,b.author as '����'
  from bookstbl as b
Where b.division = 'B002'; --join ������� �ʰ� subquery ����ϴ� ���


--���� 3-1 �ٸ��� Ǫ�� ��� (3)
select m.names
      ,m.levels
	  ,m.addr
	  ,m.idx
	  ,null as rentalDate
  from membertbl as m
 where m.idx not in (select memberidx from rentaltbl as r); --outer join ������� �ʰ� subquery ����ϴ� ���


--���� 5�� �ٸ��� Ǫ�� ��� : outer join ������� �ʰ� subquery ����ϴ� ���
select (select names from divtbl where division = a.division) as names
	   ,a.sum_price
  from 
	   (select b.division
		      ,sum(b.price) as sum_price
		  from bookstbl as b
	     group by b.division) as a
union all
select null, sum(price)
  from bookstbl;