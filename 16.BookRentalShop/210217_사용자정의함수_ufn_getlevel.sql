--사용자레벨 리턴해주는 함수
create or alter function dbo.ufn_getLevel(@levels char(1))
 returns nvarchar(5) 
 as 
 begin
	declare @result nvarchar(5); --플레티넘, 골드, 실버, 브론즈 회원 등 변수
	set @result = case @levels
					when 'A' then '플레티넘 회원'
					when 'B' then '골드 회원'
					when 'C' then '실버 회원'
					when 'D' then '브론즈 회원'
					when 'S' then '관리자'
			       else '비회원'
	              end;
	return @result;
 end
 go