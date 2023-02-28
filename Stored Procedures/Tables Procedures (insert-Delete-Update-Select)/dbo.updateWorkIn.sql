SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[updateWorkIn] (@insId INT=-1 , @depId INT=-1 , @WorkingHours INT=-1,@newInsId INT=-1 , @newDepId INT=-1)
WITH ENCRYPTION
AS
BEGIN TRY
	IF(@newInsId!=-1)
		BEGIN
			UPDATE Work_In SET Ins_id=@newInsId
			WHERE @insId=Ins_id AND @depId=Did
		END

	 IF(@newDepId!=-1)
		BEGIN
			UPDATE Work_In SET Did=@newDepId
			WHERE @insId=Ins_id AND @depId=Did
		END

	 IF(@WorkingHours!=-1)
		BEGIN
			UPDATE Work_In SET Working_Hours=@WorkingHours
			WHERE( @insId=Ins_id AND @depId=Did )
		END

END TRY
BEGIN CATCH
	SELECT 'Error'
END CATCH
GO