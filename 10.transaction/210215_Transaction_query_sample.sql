USE [sqlDB]
GO

BEGIN TRY
	Begin tran

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'������'
			   , 1988
			   ,'����'
			   ,'010'
			   ,'98989898'
			   , 175
			   ,GETDATE	())

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[productName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GJY'
			   ,'���۶�'
			   ,NULL
			   ,80000000
			   ,1)

	Commit --Ȯ��/������ �Էµ�
	--Rollback --�������Է� �ȵ�
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH
GO


