use sqlDB;
go

select rank() over(partition by addr order by height desc) as '키 큰 순위', 
       userName, addr, height
  from userTbl;


--PIVOT 함수
/*create table pivotTBL
(
	userName nvarchar(10),
	season nvarchar(2),
	amount int
);

insert into pivotTBL values ('김범수', '겨울', 10),
							('윤종신', '여름', 15),
							('김범수', '가을', 25),
							('김범수', '봄', 3),
							('김범수', '봄', 37),
							('윤종신', '겨울', 40),
							('김범수', '여름', 14),
							('김범수', '겨울', 22),
							('윤종신', '여름', 64);
go*/

select * from pivotTBL;
select * from pivotTBL
pivot (sum(amount)
	   for season
	   in ([봄], [여름], [가을], [겨울])) as resultPivot;


--JSON
select userName, userID, addr, height
  from userTbl
  where height >=180
   for json auto;


select * from userTbl where USERID = 'JYP';
select * from buyTbl where userid = 'JYP';
select * from buyTbl where userid = 'BBK';


--inner join
select *
  from buyTbl
  inner join userTbl
		  on buyTbl.userID = userTbl.userID
  where buyTbl.userID = 'JYP';

select u.userName, u.addr, 
	   CONCAT(u.mobile1,'-', left(u.mobile2, 4), '-', right(u.mobile2, 4)) as 'mobile', --휴대폰번호 사이에 하이픈(-)넣는 방법
	   b.productName, b.price, b.amount
  from buyTbl as b
 inner join userTbl as u
	     on b.userID = u.userID
  where b.userID = 'JYP'; -- where문 없어도 조인은 됨, where절 써서 JYP만 특정화한 것