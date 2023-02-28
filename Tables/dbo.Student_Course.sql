CREATE TABLE [dbo].[Student_Course] (
  [Stu_id] [int] NOT NULL,
  [Crs_id] [int] NOT NULL,
  [grade] [int] NULL,
  [percentageGrade] [varchar](50) NULL,
  CONSTRAINT [PK_Student_Course] PRIMARY KEY CLUSTERED ([Stu_id], [Crs_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student_Course]
  ADD CONSTRAINT [FK_Student_Course_Courses] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO

ALTER TABLE [dbo].[Student_Course]
  ADD CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY ([Stu_id]) REFERENCES [dbo].[Student] ([Stu_id])
GO