CREATE TABLE [dbo].[Student] (
  [Stu_id] [int] NOT NULL,
  [Fname] [varchar](50) NULL,
  [Lname] [varchar](50) NULL,
  [Phone] [int] NULL,
  [Email] [varchar](50) NULL,
  [Address] [varchar](50) NULL,
  [Leader_id] [int] NULL,
  [Did] [int] NULL,
  CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([Stu_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student]
  ADD CONSTRAINT [FK_Student_Department] FOREIGN KEY ([Did]) REFERENCES [dbo].[Department] ([Did])
GO

ALTER TABLE [dbo].[Student]
  ADD CONSTRAINT [FK_Student_Leader] FOREIGN KEY ([Leader_id]) REFERENCES [dbo].[Student] ([Stu_id])
GO