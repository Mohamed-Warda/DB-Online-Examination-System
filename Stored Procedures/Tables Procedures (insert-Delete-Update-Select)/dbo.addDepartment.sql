SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[addDepartment] @did INT , @name VARCHAR(20),@location NVARCHAR(200), @description VARCHAR(50)=NULL,@mgr_id INT=NULL
AS 
BEGIN try
INSERT INTO department VALUES (@did,@name,@description,@location,@mgr_id)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
END catch
GO