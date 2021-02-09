use sqlDB;
go
declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10, 6);
declare @myVar4 char(20);

set @myVar1 = 5;
set @myVar2 = 3;
set @myVar3 = 3.141592;
set @myVar4 = '가수이름==>';

select @myVar1;
select @myVar2 + @myVar3;
select @myVar4, userName from userTbl where height >180;

declare @myVar5 tinyint; --~255
set @myVar5 = 3;

select top(@myVar5) userName, height from userTbl order by height desc;--set @myVar5=3으로 줬기 때문에 top(3)과 같은 것


--형 변환함수
select convert(float, amount)as amount from buyTbl;
select TRY_CONVERT(float, amount) as amount from buyTbl;
select avg(convert(float, amount)) as '평균구매개수' from buyTbl;--'평균구매개수'=[평균구매개수] 문자열로 인식

select price, amount, price/amount as [단가/수량] from buyTbl;


--'2000'=>숫자로 변환
select PARSE('2021년 2월 9일' as date);
select try_PARSE('2021년 2월 39일' as date);

select PARSE('123.45' as int);
select try_parse('123.45' as int);



--스칼라함수(단일 리턴함수)
select getdate() as '현재날짜';

select year(getdate()) as '올해';
select month(getdate()) as '이번달';
select day(getdate()) as '오늘 날짜';

select abs(-100);
select round(3.1415, 3);
select round(1236.5678, -1);
select round(1234.5678, -1);
select cast((rand()*100) as int); --로또 번호 생성기

select iif(200>100, '참', '거짓');
select iif(200<100, '참', '거짓');


--문자열 함수
select ascii('a'), ascii('A');
select char(98), char(66);
select UNICODE('가');
select nchar(45909);


-->진짜 많이 사용되는 함수
--문자열 결합 함수
select concat('Microsoft ','SQL ', 'Server ', 2019); --넣고 싶은 만큼 계속 넣을 수 있음

--문자열 시작위치 리턴
select CHARINDEX('Server', 'SQL Server 2019'); --5번째부터 Server가 시작이라는 말(데이터베이스는 1부터 카운트)

--left, right
select left('SQL Server 2019', 3), right('SQL Server 2019', 4); --left : 왼쪽부터 3자리 자르고, right : 오른쪽부터 4자리 잘라서 보여줌

--substring
select SUBSTRING('Hello World!', 7, 5);
select SUBSTRING('안녕하세요, SQL서버입니다!', 11, 2);

--len : 뒤에 여백은 길이에서 무시
select len('안녕하세요'), len('Hello World!');

--lower, upper : 소문자, 대문자 변환
select lower('abcdefg'), upper('abcdefg');

--ltrim, rtirm, trim : 앞에 여백 제거, 뒤에 여백 제거, 앞뒤 여백 제거
select LTRIM('    Hello World!    '), 
	   RTRIM('    Hello World!    '), 
	    trim('    Hello World!    ');

--replace
select REPLACE('SQL Server 2016', '2016', '2019');

--format : 가장 사용빈도 높은 함수
select format(getdate(), ''); --기본
select format(getdate(), 'dd/MM/yyyy'); --일/월(대문자)/연도
select format(getdate(), 'yyyy-MM-dd hh:mm:ss'); --한국에서 가장 많이 쓰는 데이터 포맷 : 연도/월/일/시/분(소문자mm)/초
select format(getdate(), 'yyyy-MM-dd'); --연도/월/일
select format(getdate(), 'hh:mm:ss'); --시/분/초
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');
select format(getdate(), '');

