use sqlDB;
go

create view uv_userTBL
AS 
	select userID, userName, addr from userTBL;
GO

select * from uv_userTbl;

create view uv_stdclubTBL
AS
	select s.id, s.stdName, c.clubName, c.buildingNum
		from stdTBL as s
		inner join clubRegTBL as r
		on s.id = r.std_id
		inner join clubTBL as c
		on r.club_id = c.id;
go
		select * from uv_stdclubTBL;