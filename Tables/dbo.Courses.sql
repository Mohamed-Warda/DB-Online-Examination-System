CREATE TABLE [dbo].[Courses] (
  [Crs_id] [int] NOT NULL,
  [Name] [varchar](50) NULL,
  [Duration] [int] NULL,
  [Description] [varchar](200) NULL,
  CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED ([Crs_id])
)
ON [PRIMARY]
GO