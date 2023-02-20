CREATE TABLE [dbo].[Work_In] (
  [Ins_id] [int] NOT NULL,
  [Did] [int] NOT NULL,
  [Working_Hours] [int] NULL,
  CONSTRAINT [PK_Work_In] PRIMARY KEY CLUSTERED ([Ins_id], [Did])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Work_In]
  ADD CONSTRAINT [FK_Work_In_Department] FOREIGN KEY ([Did]) REFERENCES [dbo].[Department] ([Did])
GO

ALTER TABLE [dbo].[Work_In]
  ADD CONSTRAINT [FK_Work_In_Instructor] FOREIGN KEY ([Ins_id]) REFERENCES [dbo].[Instructor] ([Ins_id]) ON DELETE CASCADE ON UPDATE CASCADE
GO