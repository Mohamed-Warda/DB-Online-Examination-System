﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[deleteWorkInByDepId] @depId INT
WITH ENCRYPTION
AS
BEGIN TRY
	IF EXISTS(SELECT wi.Ins_id FROM Work_In wi WHERE @depId=wi.Did)
		BEGIN 
			DELETE FROM Work_In WHERE @depId=Did
		END
	ELSE
		SELECT 'Wrong Id'
END TRY
BEGIN CATCH
	SELECT'Error'
END CATCH
GO