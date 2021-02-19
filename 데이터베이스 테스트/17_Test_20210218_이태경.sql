use bookrentalshop;
go
--���� 1-1
select lower(email) as 'email'
      ,mobile
	  ,names
	  ,addr
	from dbo.membertbl
order by names desc;


--���� 1-2
select names
	  ,author
      ,releasedate as 'releaseDate'
      ,price
  from bookstbl;


--���� 2-1
select TOP 10 
	   concat(right(names, 2), ', ', left(names, 1)) as '�����̸�'
	  ,levels
	  ,left(addr, 2) as '����'
	  ,lower(email) as '�̸���'
  from membertbl;


--���� 2-2
select idx
	  ,concat('���� : ', names) as 'Names'
	  ,concat('���� > ', author) as 'Author'
	  ,format(releasedate, 'yyyy�� MM�� dd��') as '������'
	  ,isbn as 'ISBN'
	  ,format(price, '#,#��') as '����'
  from bookstbl
 order by idx desc;


--���� 3-1
select TOP 10
	   b.idx as '��ȣ'
	  ,d.division as '�帣��ȣ'
	  ,d.names as '�帣'
      ,b.names as 'å����'
      ,b.author as '����'
  from bookstbl as b
inner join dbo.divtbl as d
   on b.division = d.division
Where d.division = 'B002';


--���� 3-2
select m.names as 'Names'
      ,m.levels as 'Levels'
      ,m.addr as 'Addr'
	  ,r.rentaldate
  from membertbl as m
  left outer join rentaltbl as r
    on m.idx = r.memberidx
 where rentaldate is null;


--���� 4-1
begin tran;

select * from divtbl;

insert into dbo.divtbl
values('I002', '�ڱ��߼�');

rollback;
commit;


--���� 4-2
begin tran;

select * from membertbl;

  update membertbl 
     set addr = '�λ� �ؿ�뱸'
	    ,mobile = '010-6683-7732'
   where names = '�����'

rollback;
commit;


--���� 5
select d.names 
	  ,sum(b.price) as '���հ�ݾ�' 
  from divtbl as d 
 inner join bookstbl as b
    on d.division = b.division
 group by rollup(d.names);









   


