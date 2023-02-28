SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Exam_Correction]
    @ExamId INT,
    @StudentId INT

	WITH ENCRYPTION
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT* FROM Student_Exam_Question seq WHERE seq.Stu_id=@StudentId AND seq.Exm_id=@ExamId)
			SELECT 'Wrong student or exam'
		ELSE
			BEGIN
					DECLARE @TotalScore INT = 0;
					DECLARE @QuestionId INT;
					DECLARE @CorrectAnswer CHAR(1);
					DECLARE @StudentAnswer CHAR(1); 
					DECLARE @gradeAnswer INT ;
					DECLARE @CrsId INT;

					SELECT @CrsId=e.Crs_id
					FROM Exams e
					WHERE e.Exm_id=@ExamId
				

					DECLARE question_cursor CURSOR FOR
					SELECT q.Qst_id, q.Model_Answer,q.Qst_Grade
					FROM Questions q
					INNER JOIN Student_Exam_Question seq ON q.Qst_id = seq.Qst_id
					WHERE seq.Exm_id = @ExamId AND seq.Stu_id = @StudentId;
				

					OPEN question_cursor;
					FETCH NEXT FROM question_cursor INTO @QuestionId, @CorrectAnswer,@gradeAnswer;

					WHILE @@FETCH_STATUS = 0
						BEGIN
							SELECT @StudentAnswer = seq.Student_Answer 
							FROM Questions q , Student_Exam_Question seq
							WHERE seq.Exm_id = @ExamId AND seq.Stu_id = @StudentId AND seq.Qst_id = @QuestionId;

							IF @StudentAnswer = @CorrectAnswer
						    SET @TotalScore = @TotalScore + @gradeAnswer;


							FETCH NEXT FROM question_cursor INTO @QuestionId, @CorrectAnswer,@gradeAnswer;
						END

					UPDATE  Student_Course 
					SET grade = @TotalScore
					WHERE Stu_id=@StudentId AND Crs_id = @CrsId

					CLOSE question_cursor;
					DEALLOCATE question_cursor;

    END 



		END TRY

		BEGIN CATCH
			SELECT 'Error'
		END CATCH
END
GO