SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[getExams] @ExmId INT=-1, @crsId INT =-1,@date DATE ='1600-01-01'

WITH ENCRYPTION
AS
BEGIN TRY

	IF (@ExmId!=-1)
		BEGIN
			IF EXISTS(	SELECT * FROM Exams e WHERE e.Exm_id=@ExmId)
			BEGIN
    			SELECT *
				FROM Exams e  
				WHERE e.Exm_id=@ExmId
			END
			else
			SELECT 'Exam does not exist'	
	 END	

	 
	IF(@crsId!=-1)
	BEGIN
		IF EXISTS(	SELECT * FROM Exams e WHERE e.Crs_id=@crsId)
		BEGIN
    		SELECT * 
			FROM Exams e 
			WHERE e.Crs_id=@crsId
		END
		else
		SELECT 'Exam does not exist'	
    END

	IF(@date!='1600-01-01')
	BEGIN
		IF EXISTS(	SELECT * FROM Exams e WHERE e.Date=@date)
			BEGIN
    			SELECT * 
				FROM Exams e 
				WHERE e.Date=@date
			END
		else
		SELECT 'Exam does not exist'	
    END

END TRY
BEGIN CATCH
	SELECT 'error'	
END CATCH
GO