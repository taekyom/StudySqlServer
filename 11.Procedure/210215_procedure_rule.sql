USE sqlDB;
GO

--프로시저 생성
create procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

--프로시저 수정
alter procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

--프로시저 생성 or 수정 동시에, 가장 많이 사용
create or alter procedure usp_users
as
	select userID, userName, birthYear from userTbl;
go

exec usp_users;
