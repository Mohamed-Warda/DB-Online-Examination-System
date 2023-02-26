SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExamCorrection]
    @ExamId INT,
    @StudentId INT
WITH ENCRYPTION
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT* FROM Student_Exam_Question seq WHERE seq.Stu_id=@StudentId AND seq.Exm_id=@ExamId)
			SELECT 'Wrong student or exam'

	END TRY

	BEGIN CATCH

	END CATCH
END
GO