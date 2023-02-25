CREATE TABLE [dbo].[Exam_Questions] (
  [Exm_id] [int] NOT NULL,
  [Qst_id] [int] NOT NULL,
  CONSTRAINT [PK_Exam_Questions] PRIMARY KEY CLUSTERED ([Exm_id], [Qst_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exam_Questions]
  ADD CONSTRAINT [FK_Exam_Questions_Exams] FOREIGN KEY ([Exm_id]) REFERENCES [dbo].[Exams] ([Exm_id])
GO

ALTER TABLE [dbo].[Exam_Questions]
  ADD CONSTRAINT [FK_Exam_Questions_Questions] FOREIGN KEY ([Qst_id]) REFERENCES [dbo].[Questions] ([Qst_id])
GO