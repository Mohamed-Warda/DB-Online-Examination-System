CREATE TABLE [dbo].[Questions] (
  [Qst_id] [int] NOT NULL,
  [Crs_id] [int] NULL,
  [Question] [varchar](200) NULL,
  [Type] [varchar](50) NULL,
  [Model_Answer] [char](1) NULL,
  [Qst_Grade] [int] NULL,
  CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED ([Qst_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Questions]
  ADD CONSTRAINT [FK_Questions_Courses] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO