SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[deleteQuestion] @id INT
as
BEGIN TRY
if exists(select qst_id from  Questions where qst_id = @id)
	BEGIN
		UPDATE Questions  SET Crs_id=NULL WHERE qst_id=@id

		delete from Question_Choice where qst_id = @id
		delete from Questions where qst_id = @id
	end
else 
	select 'Not Found'
END TRY
BEGIN CATCH
	select 'Error'
END CATCH
GO