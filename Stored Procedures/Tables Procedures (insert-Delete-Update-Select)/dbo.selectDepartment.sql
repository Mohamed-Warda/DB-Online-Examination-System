SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROC [dbo].[selectDepartment] @id INT=-1, @columns varchar(50)
AS BEGIN 
IF @id!=-1
EXECUTE ('SELECT '+@columns+' from department where did='+@id)
ELSE 
EXECUTE ('SELECT '+@columns+' from department')
END
GO