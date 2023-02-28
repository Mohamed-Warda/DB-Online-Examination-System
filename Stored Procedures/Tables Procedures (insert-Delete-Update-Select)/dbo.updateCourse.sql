SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[updateCourse] @crs_id INT, @name NVARCHAR(5)='', @duration INT=-1,@description VARCHAR(50)=''
AS 
BEGIN TRY 
IF @name!=''
UPDATE courses SET Name=@name WHERE crs_id=@crs_id
IF @duration!=-1
UPDATE courses SET Duration=@duration WHERE Crs_id=@crs_id
IF @description!=''
UPDATE courses SET Description=@description WHERE Crs_id=@crs_id
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE()
END CATCH
GO