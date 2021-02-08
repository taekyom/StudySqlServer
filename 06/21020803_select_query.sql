use sqlDB;
go

--이름이 김경호인 사람 조회
select * from userTbl
where userName = '김경호';


--출생년도가 1970년 이후이고, 키가 182 이상인 사람의 아이디, 이름, 키 조회(AND)
select userID, userName, height
	from userTbl
where birthYear >= 1970
  and height >=182;
  


--출생년도가 1970년 이후이거나, 키가 182 이상인 사람의 아이디, 이름, 키 조회(OR)
select userID, userName, height
	from userTbl
where birthYear >= 1970
   or height >=182;


--키가 180~183 사이인 사람만 조회
select userID, userName, height
	from userTbl
where height >= 180
  and height<=183;
--키가 180~183 사이인 사람만 조회(Between And)
select userID, userName, height
	from userTbl
where height between 180 and 183;
  

--지역이 경남, 전남, 경북인 사람만 조회
select userID, userName, addr
  from userTbl
 where addr = '경남'
	or addr = '전남'
	or addr = '경북';
--지역이 경남, 전남, 경북인 사람만 조회(or대신 in 사용)
select userID, userName, addr
  from userTbl
 where addr in('경남', '전남', '경북');


--like 문
 select userID, userName, addr
  from userTbl
 where userName like '김%';

 select userID, userName, addr
  from userTbl
 where userName like '_종신';


--SUBQUERY
 select userName, height
   from userTbl
  where height > 177;

select userName, height
  from userTbl
 where height > 
	 ( select height from userTbl where userName = '김경호' );
  -- ( select userName, height from userTbl where userName = '김경호' ); 오류발생/where 절과 같은 조건만 넣어야 함--

 select userName, height
   from userTbl
  where height >= ANY
	 ( select height from userTbl where addr = '경남' ); -- ()안 조건이 170, 173인 사람의 조건


--Order by 정렬
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


--offset은 조건만큼 건너뛰고 조회
select userID, userName, birthYear
  from userTbl
order by birthYear offset 4 rows;


--select into : 복사/PK는 복사된 테이블에 없음
select * into buyTBL2 from buyTbl;
select userID, productName into buyTBL3 from buyTbl;
	  

--Group by
select * from buyTbl;

select userID, amount
  from buyTbl
order by userID;

select userID, sum(amount) as '구매합계'
  from buyTbl
group by userID;


--min, max
select min(height) as '작은 키'
from userTbl;

select max(height) as '큰 키'
from userTbl;

select userID, userName, min(height) as '최소키', max(height) as '큰 키'
  from userTbl
group by userID, userName;

select userID, userName, height
  from userTbl
 where height=(select min(height) from userTbl)
    or height=(select max(height) from userTbl);


--총 데이터의 개수
select count(*) as '회원수' from userTbl; --10
select count(*) as '구매내역 수' from buyTbl; --12


--잘못된 필터링
select userID, sum(price *amount) as '아이디별 구매금액'
  from buyTbl
--where sum(price*amount) > 1000
  group by userID
  having sum(price*amount) >1000
  order by sum(price*amount) desc;


--rollup/cube
select num, groupName, sum(price*amount) as '비용',
	   GROUPING_ID(groupName, num)
  from buyTbl
group by rollup(groupName, num);


--userID, groupName을 가지고 cube 다차원 합계
select userID, groupName, sum(price*amount) as '비용'
  from buyTbl
group by cube(groupName, userID);

select userID, sum(price*amount) as '비용'
  from buyTbl
group by rollup(userID);

select groupName, sum(price*amount) as '비용'
  from buyTbl
group by rollup(groupName);


--without CTE(CommonTableExpression)
select userID, sum(price*amount) as 'total'
from buyTbl
group by userID
order by sum(price*amount) desc;


--with CTE
with cte_temp(userID, total) as
(	select userID, sum(price*amount) as 'total'
	  from buyTbl
	group by userID )
select * from cte_temp order by total desc;