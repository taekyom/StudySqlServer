--실제 회원정보 불러오기 레벨 내림차순, 이름순
select memberID, memberName, levels, mobile, email 
  from memberTBL
  where levels <> 'S' --<> : ~가 아니다 = !=
  order by levels asc ,memberName asc;


--책정보
select cateidx, bookName, author, interpreter, company, price 
  from booksTBL
 order by price desc;

select * from cateTBL;


--시스템 함수 사용 쿼리
select memberID, 
       concat(right(memberName, 2), ' ', left(membername, 1)) as '미국식 이름',  
	   case levels
			when 'A' then '플레티넘 회원'
			when 'B' then '골드 회원'
			when 'C' then '실버 회원'
			when 'D' then '브론즈 회원'
			when 'S' then '관리자'
			else '비회원'
	   end as '회원등급', 
	   mobile, 
	   upper(email) as 이메일
  from memberTBL
 where levels <> 'S' 
 order by levels asc ,memberName asc;


--사용자 정의 함수 사용하는 쿼리
select memberID, 
       concat(right(memberName, 2), ' ', left(membername, 1)) as '미국식 이름',  
	   dbo.ufn_getLevel(levels), 
	   mobile, 
	   upper(email) as 이메일
  from memberTBL
 where levels <> 'S' 
 order by levels asc ,memberName asc;


 --책정보, 시스템 함수, 포맷 함수 쿼리
 SELECT bookidx
      , cateidx
      , concat(N'책제목> ', bookName) as bookName
      , author
      , isnull(interpreter, '(엮은이 없음)') as '엮은이' --출력에서 null값이 들어있는 경우 다른 것으로 바꿔주는 것
      , company
      , format(releaseDate, 'yyyy년 MM월 dd일') as '출판일'
      , format(price, '#,#원') as '가격' --천단위에서 끊는 것 : #,# / 소수점까지 표현 .0 .00 등
   FROM booksTBL;


--책정보
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


--대여된 책의 정보 쿼리 조인/ 책을 빌린 회원 조회 : inner join
SELECT r.rentalidx
      --, r.memeberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      , format(r.returnDt, 'yyyy-MM-dd') as '반납일'
      , dbo.ufn_getState(r.rentalState) as '대여상태'
   FROM dbo.rentalTBL as r
  inner join booksTBL as b
     on r.bookidx = b.bookidx
  inner join memberTBL as m
     on r.memeberidx =m.memberidx; 


--책을 안 빌린 회원 조회 : outer join
SELECT r.rentalidx
      --, r.memeberidx
	  , m.memberName
      --, r.bookidx
	  , b.bookName
	  , b.author
      , format(r.rentalDt, 'yyyy-MM-dd') as '대여일'
      , dbo.ufn_getState(r.rentalState) as '대여상태'
   FROM dbo.rentalTBL as r
  left outer join booksTBL as b
     on r.bookidx = b.bookidx
  right outer join memberTBL as m	--오른쪽 테이블 기준 outer join 
     on r.memeberidx =m.memberidx
  where r.rentalidx is null; --null은 =안 씀, is or not으로 구분


--우리 책 대여점에 없는 소설장르
select c.cateidx
	 , c.cateName
	 , b.bookName
  from cateTBL as c
  left outer join booksTBL as b
    on c.cateidx = b.cateidx;

 
 