SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[update_student_grade] @stuId INT , @crsId INT , @Grade INT 
WITH ENCRYPTION

AS
	BEGIN TRY
			UPDATE Student_Course 
			SET grade = @Grade
			WHERE Stu_id = @stuId AND Crs_id = @crsId
	END TRY

	BEGIN CATCH
			SELECT 'Error'
	END CATCH
GO