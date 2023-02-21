SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[getWorkIn] @insId INT=-1 , @depId INT=-1 , @WorkingHours INT=-1
 WITH ENCRYPTION
 AS
 BEGIN TRY

	IF(@insId!=-1) AND (@depId!=-1)
	BEGIN
			IF EXISTS(	SELECT * FROM Work_In wi WHERE wi.Ins_id=@insId AND wi.Did=@depId)
			BEGIN
    			SELECT *
				FROM Work_In wi 
				WHERE wi.Ins_id=@insId AND Did=@depId
			END
			else
				SELECT ' Does not exist'	
		END

 	ELSE IF(@insId!=-1)
		BEGIN
			IF EXISTS(	SELECT * FROM Work_In wi WHERE wi.Ins_id=@insId )
			BEGIN
    			SELECT *
				FROM Work_In wi 
				WHERE wi.Ins_id=@insId
			END
			else
				SELECT ' Does not exist'	
		END

	 ELSE IF(@depId!=-1)
		BEGIN
			IF EXISTS(	SELECT * FROM Work_In wi WHERE wi.Did=@depId)
			BEGIN
    			SELECT *
				FROM Work_In wi 
				WHERE wi.Did=@depId
			END
			else
				SELECT ' Does not exist'	
		END

	ELSE  IF(@WorkingHours!=-1)
		BEGIN
			IF EXISTS(	SELECT * FROM Work_In wi WHERE wi.Working_Hours=@WorkingHours)
			BEGIN
    			SELECT *
				FROM Work_In wi 
				WHERE  wi.Working_Hours=@WorkingHours
			END
			else
				SELECT ' Does not exist'	
		END
		
 END TRY
 BEGIN CATCH
	SELECT 'Error'
 END CATCH
GO