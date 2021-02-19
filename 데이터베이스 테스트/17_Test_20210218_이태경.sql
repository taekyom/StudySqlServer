use bookrentalshop;
go
--문항 1-1
select lower(email) as 'email'
      ,mobile
	  ,names
	  ,addr
	from dbo.membertbl
order by names desc;


--문항 1-2
select names
	  ,author
      ,releasedate as 'releaseDate'
      ,price
  from bookstbl;


--문항 2-1
select TOP 10 
	   concat(right(names, 2), ', ', left(names, 1)) as '변경이름'
	  ,levels
	  ,left(addr, 2) as '도시'
	  ,lower(email) as '이메일'
  from membertbl;


--문항 2-2
select idx
	  ,concat('제목 : ', names) as 'Names'
	  ,concat('저자 > ', author) as 'Author'
	  ,format(releasedate, 'yyyy년 MM월 dd일') as '출판일'
	  ,isbn as 'ISBN'
	  ,format(price, '#,#원') as '가격'
  from bookstbl
 order by idx desc;


--문항 3-1
select TOP 10
	   b.idx as '번호'
	  ,d.division as '장르번호'
	  ,d.names as '장르'
      ,b.names as '책제목'
      ,b.author as '저자'
  from bookstbl as b
inner join dbo.divtbl as d
   on b.division = d.division
Where d.division = 'B002';


--문항 3-2
select m.names as 'Names'
      ,m.levels as 'Levels'
      ,m.addr as 'Addr'
	  ,r.rentaldate
  from membertbl as m
  left outer join rentaltbl as r
    on m.idx = r.memberidx
 where rentaldate is null;


--문항 4-1
begin tran;

select * from divtbl;

insert into dbo.divtbl
values('I002', '자기계발서');

rollback;
commit;


--문항 4-2
begin tran;

select * from membertbl;

  update membertbl 
     set addr = '부산 해운대구'
	    ,mobile = '010-6683-7732'
   where names = '성명건'

rollback;
commit;


--문항 5
select d.names 
	  ,sum(b.price) as '총합계금액' 
  from divtbl as d 
 inner join bookstbl as b
    on d.division = b.division
 group by rollup(d.names);









   


