CREATE TABLE [dbo].[Instructor] (
  [Ins_id] [int] NOT NULL,
  [Lname] [varchar](50) NULL,
  [Fname] [varchar](50) NULL,
  [Academics_Degree] [varchar](100) NULL,
  [Salary] [int] NULL,
  [Address] [varchar](200) NULL,
  [Phone] [int] NULL,
  [Super_id] [int] NULL,
  CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED ([Ins_id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor]
  ADD CONSTRAINT [FK_Instructor_Instructor1] FOREIGN KEY ([Super_id]) REFERENCES [dbo].[Instructor] ([Ins_id])
GO