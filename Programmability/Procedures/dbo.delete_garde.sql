SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[delete_garde] @StuId INT , @crsId INT 
WITH ENCRYPTION
AS
	BEGIN TRY
			DELETE grade FROM Student_Course sc
			WHERE sc.Stu_id = @StuId AND sc.Crs_id = @crsId
	END TRY 

	BEGIN CATCH 
			SELECT 'Error'
	END CATCH 
GO