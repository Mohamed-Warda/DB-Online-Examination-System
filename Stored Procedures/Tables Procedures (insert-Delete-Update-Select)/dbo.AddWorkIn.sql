SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[AddWorkIn] @insId INT , @depId INT , @WorkingHours INT
WITH ENCRYPTION
AS
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM Work_In wi WHERE wi.Ins_id=@insId AND wi.Did=@depId)
		INSERT INTO Work_In (Ins_id,Did,Working_Hours)
		VALUES	(@insId,@depId,@WorkingHours)
	ELSE
		SELECT'Duplicted ID'
END TRY
BEGIN CATCH
	SELECT 'Error'
END CATCH
GO