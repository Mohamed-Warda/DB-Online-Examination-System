SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[Update_Student_By_Id] @id INT, @fname VARCHAR(20), @lName VARCHAR(20),
	@phone INT, @email VARCHAR(20),@address VARCHAR(20), @leaderId INT, @departmentId INT 
WITH ENCRYPTION 
AS
	BEGIN TRY
			UPDATE Student
			SET 
				Fname = @fname,
				Lname = @lName,
				Phone = @phone,
				Email = @email,
				ADDRESS = @address,
				Leader_id = @leaderId,
				Did = @departmentId
			WHERE 
				Stu_id = @id
	END TRY

	BEGIN CATCH
			SELECT 'Error'
	END CATCH
GO