SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[updateDepartment] @did INT , @name VARCHAR(10)='',@description VARCHAR(100)='', @location NVARCHAR(20)='',@mgr_id INT=-1
AS
BEGIN TRY
IF @name!=''
UPDATE department SET dname=@name WHERE did=@did
IF @description!='' 
UPDATE department SET Description=@description WHERE did=@did
IF @location!=''
UPDATE Department SET Location=@location
IF @mgr_id!=-1
UPDATE department SET Mng_id=@mgr_id WHERE Did=@did
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
END CATCH
GO