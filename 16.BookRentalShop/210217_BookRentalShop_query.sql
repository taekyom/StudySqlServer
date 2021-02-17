--���� ȸ������ �ҷ����� ���� ��������, �̸���
select memberID, memberName, levels, mobile, email 
  from memberTBL
  where levels <> 'S' --<> : ~�� �ƴϴ� = !=
  order by levels asc ,memberName asc;


--å����
select cateidx, bookName, author, interpreter, company, price 
  from booksTBL
 order by price desc;

select * from cateTBL;


--�ý��� �Լ� ��� ����
select memberID, 
       concat(right(memberName, 2), ' ', left(membername, 1)) as '�̱��� �̸�',  
	   case levels
			when 'A' then '�÷�Ƽ�� ȸ��'
			when 'B' then '��� ȸ��'
			when 'C' then '�ǹ� ȸ��'
			when 'D' then '����� ȸ��'
			when 'S' then '������'
			else '��ȸ��'
	   end as 'ȸ�����', 
	   mobile, 
	   upper(email) as �̸���
  from memberTBL
 where levels <> 'S' 
 order by levels asc ,memberName asc;


--����� ���� �Լ� ����ϴ� ����
select memberID, 
       concat(right(memberName, 2), ' ', left(membername, 1)) as '�̱��� �̸�',  
	   dbo.ufn_getLevel(levels), 
	   mobile, 
	   upper(email) as �̸���
  from memberTBL
 where levels <> 'S' 
 order by levels asc ,memberName asc;


 --å����, �ý��� �Լ�, ���� �Լ� ����
 SELECT bookidx
      , cateidx
      , concat(N'å����> ', bookName) as bookName
      , author
      , isnull(interpreter, '(������ ����)') as '������' --��¿��� null���� ����ִ� ��� �ٸ� ������ �ٲ��ִ� ��
      , company
      , format(releaseDate, 'yyyy�� MM�� dd��') as '������'
      , format(price, '#,#��') as '����' --õ�������� ���� �� : #,# / �Ҽ������� ǥ�� .0 .00 ��
   FROM booksTBL;


--å����
SELECT b.bookidx
      --,b.cateidx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM dbo.booksTBL as b
 inner join cateTBL as c
 on b.cateidx = c.cateidx;


--�뿩�� å�� ���� ���� ����/ å�� ���� ȸ�� ��ȸ : inner join
SELECT r.rentalidx
      --, r.memeberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
      , format(r.returnDt, 'yyyy-MM-dd') as '�ݳ���'
      , dbo.ufn_getState(r.rentalState) as '�뿩����'
   FROM dbo.rentalTBL as r
  inner join booksTBL as b
     on r.bookidx = b.bookidx
  inner join memberTBL as m
     on r.memeberidx =m.memberidx; 


--å�� �� ���� ȸ�� ��ȸ : outer join
SELECT r.rentalidx
      --, r.memeberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '�뿩��'
      , dbo.ufn_getState(r.rentalState) as '�뿩����'
   FROM dbo.rentalTBL as r
  left outer join booksTBL as b
     on r.bookidx = b.bookidx
  right outer join memberTBL as m	--������ ���̺� ���� outer join 
     on r.memeberidx =m.memberidx
  where r.rentalidx is null; --null�� =�� ��, is or not���� ����


--�츮 å �뿩���� ���� �Ҽ��帣
select c.cateidx
	 , c.cateName
	 , b.bookName
  from cateTBL as c
  left outer join booksTBL as b
    on c.cateidx = b.cateidx;

 
 