SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[Add_Student] @id INT, @fname VARCHAR(20), @lName VARCHAR(20),
	@phone INT, @email VARCHAR(20),@address VARCHAR(20), @leaderId INT, @departmentId INT 

WITH ENCRYPTION
AS 
	BEGIN TRY
			INSERT INTO  Student 
			VALUES (@id,@fname,@lName,@phone,@email,@address,@leaderId,@departmentId)
	END TRY
	BEGIN CATCH
			SELECT 'Error'
	END CATCH
GO