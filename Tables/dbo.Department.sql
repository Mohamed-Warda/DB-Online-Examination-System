CREATE TABLE [dbo].[Department] (
  [Did] [int] NOT NULL,
  [Dname] [varchar](50) NULL,
  [Description] [varchar](200) NULL,
  [Location] [nvarchar](200) NULL,
  [Mng_id] [int] NULL,
  CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([Did])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Department]
  ADD CONSTRAINT [FK_Department_Instructor] FOREIGN KEY ([Mng_id]) REFERENCES [dbo].[Instructor] ([Ins_id]) ON DELETE SET NULL ON UPDATE CASCADE
GO