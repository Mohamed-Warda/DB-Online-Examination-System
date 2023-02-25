CREATE TABLE [dbo].[Exams] (
  [Exm_id] [int] IDENTITY,
  [Duration] [int] NULL,
  [Crs_id] [int] NULL,
  [Date] [date] NULL,
  CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED ([Exm_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exams]
  ADD CONSTRAINT [FK_Exams_Courses] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO