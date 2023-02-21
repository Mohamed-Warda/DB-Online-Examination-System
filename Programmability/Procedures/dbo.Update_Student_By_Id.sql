SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[Update_Student_By_Id] @id INT=-1, @fname VARCHAR(20)='', @lName VARCHAR(20)='',
	@phone INT=-1, @email VARCHAR(20)='',@address VARCHAR(20)='', @leaderId INT=-1, @departmentId INT =-1
WITH ENCRYPTION 
AS
	BEGIN TRY
		IF @fname!=''
			BEGIN
				UPDATE Student SET Fname = @fname WHERE Stu_id = @id
			END

		IF @lname!=''
			BEGIN
				UPDATE Student SET Lname = @lName WHERE Stu_id = @id
			END

		IF @phone!=-1
			BEGIN
				UPDATE Student SET Phone = @phone WHERE Stu_id = @id
			END

		IF @email!=''
			BEGIN
				UPDATE Student SET Email = @email WHERE Stu_id = @id
			END

		IF @address!=''
			BEGIN
				UPDATE Student SET Address = @address WHERE Stu_id = @id
			END

		IF @leaderId!=-1
			BEGIN
				UPDATE Student SET Leader_id = @leaderId WHERE Stu_id = @id
			END

		IF @departmentId!=-1
			BEGIN
				UPDATE Student SET Did = @departmentId WHERE Stu_id = @id
			END
		
	END TRY

	BEGIN CATCH
			SELECT 'Error'
	END CATCH
GO