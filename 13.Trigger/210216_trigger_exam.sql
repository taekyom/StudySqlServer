USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [userName] = '°ü¿îÀå'
 WHERE [userID] = 'JKW';
GO

delete from userTbl
where userID = 'JKW';

