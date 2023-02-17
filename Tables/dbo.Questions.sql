CREATE TABLE [dbo].[Questions] (
  [Qst_id] [int] NOT NULL,
  [Top_id] [int] NOT NULL,
  [Question] [varchar](200) NULL,
  [Type] [varchar](50) NULL,
  [Model_Answer] [varchar](200) NULL,
  [Qst_Grade] [int] NULL,
  CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED ([Qst_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Questions]
  ADD CONSTRAINT [FK_Questions_Topic] FOREIGN KEY ([Top_id]) REFERENCES [dbo].[Topic] ([Top_id])
GO