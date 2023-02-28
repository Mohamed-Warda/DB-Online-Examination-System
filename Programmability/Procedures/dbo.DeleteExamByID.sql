SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[DeleteExamByID]  @ExamID INT
AS
BEGIN

    IF EXISTS (SELECT Exm_id FROM Exams WHERE Exm_id = @ExamID)
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION;

            DELETE FROM Student_Exam_Question WHERE Exm_id = @ExamID;

            DELETE FROM Exam_Questions WHERE Exm_id = @ExamID;

            DELETE FROM Exams WHERE Exm_id = @ExamID;

            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
            SELECT'Error happend while deleting';
        END CATCH
    END
    ELSE
    BEGIN
        SELECT 'Exam does not exist'
    END
END
GO