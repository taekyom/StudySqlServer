--outer join query
select r.rentalidx
      --,r.memeberidx
	  ,m.memberName
      --,r.bookidx
	  --,b.cateidx
	  ,c.cateName
	  ,b.bookName
	  ,b.author
      ,format(r.rentaldt, 'yyyy-MM-dd') as rentalDt
	  ,format(r.returndt, 'yyyy-MM-dd') as returndt
      ,r.rentalstate
	  ,dbo.ufn_getState(r.rentalState) as '�뿩����'
  from rentaltbl as r
 right outer join memberTBL as m
    on r.memeberidx = m.memberidx
 left outer join booksTBL as b
    on r.bookidx = b.bookidx
 left outer join cateTBL as c
    on c.cateidx = b.cateidx
 where r.rentalidx is null;


 --������ �Է�
 insert into booksTBL
 (
	cateidx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
 ) 
 values 
 (
	'N0002',
	'�������� ���� ����',
	'��ȳ�',
	'������',
	'2019-10-02',
	'9791135445705',
	12500
 );


 --å ���̺��� ���� �ִ� ���� ��, ����� ������ڸ� �߰�
 begin tran;

 select * from booksTBL;

 update booksTBL
	set descriptions = '�θ�׷��� �극������ �ٽ� TF�� ����, ���¿� ����. ������ �θ� �Ʒ��� �������̰� ��������� �ڶ�����, ���ϴ�
						�� ������ �տ� �־�� �ϴ� ������ ����. �׷� �׸� �ڲ� ���� �浿�� �ô޸��� �ϴ� ���ڰ� ��Ÿ����. �׳�� �ٷ� ���»�
						KJ �ű��� ��ǥ�� ������ ��, ������.'
	  , regDate = '2021-02-18'
  where bookidx = 20    --��ü ������ �� �� �ƴϸ� ������! where���� �־���Ѵ�(���� Ư��)
 rollback;
 commit;


 --ī�װ� �Է�
begin tran; 

insert into cateTBL /*(cateidx, cateName)*/ values('I0001', '��ȭ/����'), --��ü �����Ϳ� ���� ���� ���� �Է��� ���� values �� �÷��� ���� ����
												  ('I0002', '����/ó��'),
												  ('I0003', '�ð�����');

select * from cateTBL;

rollback;
commit;

delete from cateTBL where cateidx = 'I0003';							  --������ ������ �� : delete from cateTBL where cateidx in('', '', ...)