SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[Exam_Student_Answers] @exam_id INT, @st_id INT 
AS
SELECT seq.Exm_id  ,q.Question, q.Type, q.Model_Answer,seq.Student_Answer 
FROM Student_Exam_Question seq , Questions q
WHERE seq.Qst_id = q.Qst_id AND seq.Exm_id = @exam_id and seq.Stu_id = @st_id

GO