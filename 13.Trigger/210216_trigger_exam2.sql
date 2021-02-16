USE [sqlDB]
GO


CREATE TABLE [dbo].[backup_userTBL](
	[userID] [char](8) NOT NULL primary key,
	[userName] [nvarchar](10) NOT NULL,
	[birthYear] [int] NOT NULL,
	[addr] [nchar](2) NOT NULL,
	[mobile1] [char](3) NULL,
	[mobile2] [char](8) NULL,
	[height] [smallint] NULL,
	[mDate] [date] NULL,
	modType nchar(2),		--����� Ÿ�� '����', '����'
	modDate date,			--����� ��¥
	modUser nvarchar(200)	--����� �����
)
GO


