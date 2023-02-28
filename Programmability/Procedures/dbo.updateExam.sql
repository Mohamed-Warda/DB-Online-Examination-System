SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[updateExam] @ExmId INT=-1,@date DATE ='1600-01-01',@duration INT =-1
WITH ENCRYPTION

AS
BEGIN
IF EXISTS (SELECT e.Exm_id FROM Exams e WHERE e.Exm_id=@ExmId)
BEGIN TRY 

BEGIN
	
	IF(@date!='1600-01-01')
		BEGIN
    		UPDATE Exams SET Date=@date WHERE @ExmId = Exm_id
		END
	
	IF(@duration!=-1)
	BEGIN
		IF EXISTS(	SELECT * FROM Exams e WHERE e.Duration=e.Duration)
			BEGIN
    			UPDATE Exams SET Duration=@duration WHERE @ExmId = Exm_id
			END
			
    END

END
END TRY

BEGIN CATCH
	SELECT 'error'
END CATCH

ELSE
	select'Exam does not exist'
END
GO