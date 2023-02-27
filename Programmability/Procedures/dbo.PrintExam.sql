SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create proc [dbo].[PrintExam] @exam_id int
as
select eq.Exm_id ,q.Question, q.type, qc.Choice, q.Model_Answer from Exams  e
	inner join Exam_Questions  eq on e.Exm_id = eq.Exm_id
	inner join Questions  q on eq.Qst_id = q.Qst_id
	inner join Question_Choice qc on q.Qst_id = qc.Qst_id
	where e.Exm_id = @exam_id

GO