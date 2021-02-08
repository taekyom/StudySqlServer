use sqlDB;
go

--�̸��� ���ȣ�� ��� ��ȸ
select * from userTbl
where userName = '���ȣ';


--����⵵�� 1970�� �����̰�, Ű�� 182 �̻��� ����� ���̵�, �̸�, Ű ��ȸ(AND)
select userID, userName, height
	from userTbl
where birthYear >= 1970
  and height >=182;
  


--����⵵�� 1970�� �����̰ų�, Ű�� 182 �̻��� ����� ���̵�, �̸�, Ű ��ȸ(OR)
select userID, userName, height
	from userTbl
where birthYear >= 1970
   or height >=182;


--Ű�� 180~183 ������ ����� ��ȸ
select userID, userName, height
	from userTbl
where height >= 180
  and height<=183;
--Ű�� 180~183 ������ ����� ��ȸ(Between And)
select userID, userName, height
	from userTbl
where height between 180 and 183;
  

--������ �泲, ����, ����� ����� ��ȸ
select userID, userName, addr
  from userTbl
 where addr = '�泲'
	or addr = '����'
	or addr = '���';
--������ �泲, ����, ����� ����� ��ȸ(or��� in ���)
select userID, userName, addr
  from userTbl
 where addr in('�泲', '����', '���');


--like ��
 select userID, userName, addr
  from userTbl
 where userName like '��%';

 select userID, userName, addr
  from userTbl
 where userName like '_����';


--SUBQUERY
 select userName, height
   from userTbl
  where height > 177;

select userName, height
  from userTbl
 where height > 
	 ( select height from userTbl where userName = '���ȣ' );
  -- ( select userName, height from userTbl where userName = '���ȣ' ); �����߻�/where ���� ���� ���Ǹ� �־�� ��--

 select userName, height
   from userTbl
  where height >= ANY
	 ( select height from userTbl where addr = '�泲' ); -- ()�� ������ 170, 173�� ����� ����


--Order by ����
select userName, mDate
  from userTbl
 order by mDate desc;

select *
  from userTbl
 order by userID desc;


--distinct
 select distinct addr
   from userTbl;


--top()
select top(5)* 
 from userTbl
order by mDate desc;


--offset�� ���Ǹ�ŭ �ǳʶٰ� ��ȸ
select userID, userName, birthYear
  from userTbl
order by birthYear offset 4 rows;


--select into : ����/PK�� ����� ���̺� ����
select * into buyTBL2 from buyTbl;
select userID, productName into buyTBL3 from buyTbl;
	  

--Group by
select * from buyTbl;

select userID, amount
  from buyTbl
order by userID;

select userID, sum(amount) as '�����հ�'
  from buyTbl
group by userID;


--min, max
select min(height) as '���� Ű'
from userTbl;

select max(height) as 'ū Ű'
from userTbl;

select userID, userName, min(height) as '�ּ�Ű', max(height) as 'ū Ű'
  from userTbl
group by userID, userName;

select userID, userName, height
  from userTbl
 where height=(select min(height) from userTbl)
    or height=(select max(height) from userTbl);


--�� �������� ����
select count(*) as 'ȸ����' from userTbl; --10
select count(*) as '���ų��� ��' from buyTbl; --12