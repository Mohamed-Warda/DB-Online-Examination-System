CREATE TABLE [dbo].[Student_Exam_Question] (
  [Stu_id] [int] NOT NULL,
  [Exm_id] [int] NOT NULL,
  [Qst_id] [int] NOT NULL,
  [Student_Answer] [char](1) NULL,
  CONSTRAINT [PK_Student_Exam_Question] PRIMARY KEY CLUSTERED ([Stu_id], [Exm_id], [Qst_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student_Exam_Question]
  ADD CONSTRAINT [FK_Student_Exam_Question_Exams] FOREIGN KEY ([Exm_id]) REFERENCES [dbo].[Exams] ([Exm_id])
GO

ALTER TABLE [dbo].[Student_Exam_Question]
  ADD CONSTRAINT [FK_Student_Exam_Question_Questions] FOREIGN KEY ([Qst_id]) REFERENCES [dbo].[Questions] ([Qst_id])
GO

ALTER TABLE [dbo].[Student_Exam_Question]
  ADD CONSTRAINT [FK_Student_Exam_Question_Student] FOREIGN KEY ([Stu_id]) REFERENCES [dbo].[Student] ([Stu_id])
GO