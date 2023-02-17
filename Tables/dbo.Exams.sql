CREATE TABLE [dbo].[Exams] (
  [Exm_id] [int] NOT NULL,
  [Date] [date] NULL,
  [Crs_id] [int] NULL,
  CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED ([Exm_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Exams]
  ADD CONSTRAINT [FK_Exams_Courses] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO