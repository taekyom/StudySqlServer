USE [sqlDB]
GO

UPDATE [dbo].[userTbl]
   SET [userName] = '������'
 WHERE [userID] = 'JKW';
GO

delete from userTbl
where userID = 'JKW';

