SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[Delete_Student_By_Id] @id INT
WITH ENCRYPTION
AS
	
	BEGIN TRY
			if exists(SELECT s.Stu_id from Student s  where s.Stu_id = @id)

			UPDATE Student  SET Leader_id = NULL WHERE Leader_id = @id
		
			delete from Student where Stu_id = @id
	END TRY

	BEGIN CATCH
			SELECT 'Error'
	END CATCH
GO