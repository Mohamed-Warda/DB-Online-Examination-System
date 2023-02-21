SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[addTopic] @id INT , @name VARCHAR(50), @crs INT
AS
	IF NOT EXISTS (SELECT t.Top_id FROM Topic t WHERE @id = t.Top_id)
		INSERT INTO Topic (Top_id,Top_Name,Crs_id)
		VALUES	(@id,@name,@crs)
	ELSE
		SELECT'Duplicted ID'
GO