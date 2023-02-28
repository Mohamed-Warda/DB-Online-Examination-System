SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[updateTopic] 
(@topId INT=-1 , @topName VARCHAR(50)='', @crsId INT=-1)

WITH ENCRYPTION

AS
IF EXISTS (SELECT Top_id FROM Topic t WHERE @topId=t.Top_id)
BEGIN TRY 

BEGIN
	IF (@topName!='')
		BEGIN
			UPDATE Topic SET Top_Name=@topName WHERE Top_id = @topId
		END

	 IF (@crsId!=-1)
		BEGIN
			UPDATE Topic SET Crs_id=@crsId WHERE Top_id = @topId		
		END
	IF (@topName!='') AND (@crsId!=-1)
	UPDATE Topic SET Top_Name=@topName,Crs_id=@crsId WHERE Top_id = @topId
END
END TRY

BEGIN CATCH
	SELECT 'error'
END CATCH

ELSE
	select'Topic does not exist'
GO