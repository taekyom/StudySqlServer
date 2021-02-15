--사용자 정의 함수 사용하지 않은 것
select 
	  *,
	  year(getdate()) - birthyear + 1 as '나이'
from userTbl;


--사용자 정의 함수 사용한 것
select *,
		dbo.ufn_getAge(birthyear) as '나이',
		dbo.ufn_getZodia(birthyear) as '띠'
  from userTbl;