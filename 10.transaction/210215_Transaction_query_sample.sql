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
			   ,'권지용'
			   , 1988
			   ,'서울'
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
			   ,'선글라스'
			   ,NULL
			   ,80000000
			   ,1)

	Commit --확정/데이터 입력됨
	--Rollback --데이터입력 안됨
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH
GO


