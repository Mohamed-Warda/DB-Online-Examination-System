CREATE TABLE [dbo].[Instructor_Course] (
  [Ins_id] [int] NOT NULL,
  [Crs_id] [int] NOT NULL,
  [Evaluation] [varchar](150) NULL,
  CONSTRAINT [PK_Instructor_Course] PRIMARY KEY CLUSTERED ([Ins_id], [Crs_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor_Course]
  ADD CONSTRAINT [FK_Instructor_Course_Courses] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO

ALTER TABLE [dbo].[Instructor_Course]
  ADD CONSTRAINT [FK_Instructor_Course_Instructor] FOREIGN KEY ([Ins_id]) REFERENCES [dbo].[Instructor] ([Ins_id])
GO