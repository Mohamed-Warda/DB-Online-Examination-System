SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[deleteExamByCrsId] @crsId INT
WITH ENCRYPTION
AS

BEGIN 
	IF EXISTS(SELECT e.Crs_id FROM Exams e WHERE e.Crs_id=@crsId)
	BEGIN
        BEGIN TRY
            BEGIN TRANSACTION;

				DELETE FROM Student_Exam_Question WHERE Exm_id IN (SELECT Exm_id FROM Exams WHERE Crs_id = @crsId)

				DELETE FROM Exam_Questions WHERE Exm_id IN (SELECT Exm_id FROM Exams WHERE Crs_id = @crsId)

				DELETE FROM Exams WHERE Crs_id=@crsId

            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
				SELECT'Error happend while deleting'
        END CATCH
    END
    ELSE
    BEGIN
        SELECT 'Exam does not exist'
    END
END
GO