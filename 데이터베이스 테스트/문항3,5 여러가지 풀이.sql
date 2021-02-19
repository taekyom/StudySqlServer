--문항 3-1 정석 풀이
select TOP 10
	   b.idx as '번호'
	  ,b.division as '장르번호'
	  ,d.names as '장르'
      ,b.names as '책제목'
      ,b.author as '저자'
  from bookstbl as b
inner join dbo.divtbl as d
   on b.division = d.division
Where d.division = 'B002';


--문항 3-1 다르게 푸는 방법 (1)
select b.idx 번호
      ,b.division '장르 번호'
	  ,d.names 장르
	  ,b.names 책제목
	  ,b.author 저자
  from bookstbl as b
      ,divtbl as d
 where b.division = d.division
   and b.division = 'B002'; --inner join과 on 생략하고 where로 대신하는 방법


--문항 3-1 다르게 푸는 방법 (2)
select b.idx as '번호'
	  ,b.division as '장르번호'
	  --,d.names as '장르'
	  ,(select names from divtbl where division = b.division) as '장르'
      ,b.names as '책제목'
      ,b.author as '저자'
  from bookstbl as b
Where b.division = 'B002'; --join 사용하지 않고 subquery 사용하는 방법


--문항 3-1 다르게 푸는 방법 (3)
select m.names
      ,m.levels
	  ,m.addr
	  ,m.idx
	  ,null as rentalDate
  from membertbl as m
 where m.idx not in (select memberidx from rentaltbl as r); --outer join 사용하지 않고 subquery 사용하는 방법


--문항 5번 다르게 푸는 방법 : outer join 사용하지 않고 subquery 사용하는 방법
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