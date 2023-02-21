SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[selectCourse] @id INT=-1, @columns varchar(50)
AS BEGIN 
IF @id!=-1
EXECUTE ('SELECT '+@columns+' from courses where crs_id='+@id)
ELSE 
EXECUTE ('SELECT '+@columns+' from courses')
END
GO