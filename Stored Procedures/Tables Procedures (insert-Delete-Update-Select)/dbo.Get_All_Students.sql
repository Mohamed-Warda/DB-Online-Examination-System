﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Get_All_Students] WITH ENCRYPTION
AS 
BEGIN 
	SELECT *
	FROM dbo.Student

END
GO