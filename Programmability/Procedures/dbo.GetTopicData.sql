SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTopicData] @name VARCHAR(50)='',@id INT=-1, @crsId INT =-1
WITH ENCRYPTION
AS
BEGIN TRY

	IF (@id!=-1)
	BEGIN
		IF EXISTS(	SELECT * FROM Topic t WHERE Top_id=@id)
		BEGIN
    		SELECT *
			FROM Topic t 
			WHERE t.Top_id=@id
		END
		else
		SELECT 'topic does not exist'	
    END

	IF(@name!='')
	BEGIN
		IF EXISTS(	SELECT * FROM Topic t WHERE t.Top_Name=@name)
		BEGIN
    		SELECT *
			FROM Topic t 
			WHERE t.Top_Name=@name
		END
		else
		SELECT 'topic does not exist'	
    END

	IF(@crsId!=-1)
	BEGIN
		IF EXISTS(	SELECT * FROM Topic t WHERE T.Crs_id=@crsId)
		BEGIN
    		SELECT * 
			FROM Topic t 
			WHERE T.Crs_id=@crsId
		END
		else
		SELECT 'topic does not exist'	
    END
	
END TRY
BEGIN CATCH
	SELECT 'error'	
END catch

	
GO