CREATE TABLE [dbo].[Topic] (
  [Top_id] [int] NOT NULL,
  [Top_Name] [varchar](50) NULL,
  [Crs_id] [int] NULL,
  CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED ([Top_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Topic]
  ADD CONSTRAINT [FK_Topic_Courses1] FOREIGN KEY ([Crs_id]) REFERENCES [dbo].[Courses] ([Crs_id])
GO