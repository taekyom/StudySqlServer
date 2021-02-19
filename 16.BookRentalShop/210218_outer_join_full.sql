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
	  ,dbo.ufn_getState(r.rentalState) as '대여상태'
  from rentaltbl as r
 right outer join memberTBL as m
    on r.memeberidx = m.memberidx
 left outer join booksTBL as b
    on r.bookidx = b.bookidx
 left outer join cateTBL as c
    on c.cateidx = b.cateidx
 where r.rentalidx is null;


 --데이터 입력
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
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
 );


 --책 테이블에서 위에 있는 정보 중, 설명과 등록일자를 추가
 begin tran;

 select * from booksTBL;

 update booksTBL
	set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석. 교육자 부모 아래서 보수적이고 모범적으로 자랐지만, 원하는
						건 무조건 손에 넣어야 하는 집요한 남자. 그런 그를 자꾸 낯선 충동에 시달리게 하는 여자가 나타났다. 그녀는 바로 협력사
						KJ 신기주 대표의 유능한 비서, 임정은.'
	  , regDate = '2021-02-18'
  where bookidx = 20    --전체 변경을 할 것 아니면 무조건! where절이 있어야한다(범위 특정)
 rollback;
 commit;


 --카테고리 입력
begin tran; 

insert into cateTBL /*(cateidx, cateName)*/ values('I0001', '대화/협상'), --전체 데이터에 대한 값을 전부 입력할 때는 values 앞 컬럼명 생략 가능
												  ('I0002', '성공/처세'),
												  ('I0003', '시간관리');

select * from cateTBL;

rollback;
commit;

delete from cateTBL where cateidx = 'I0003';							  --여러개 삭제할 때 : delete from cateTBL where cateidx in('', '', ...)