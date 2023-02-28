SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[deleteInstructorByID]  @id int
AS
BEGIN TRY
if exists(select Ins_id from Instructor i where i.Ins_id = @id)
BEGIN

UPDATE Instructor  SET Super_id=NULL WHERE Super_id=@id

delete from Instructor where Ins_id = @id

end
else select 'Not Found'
END TRY
BEGIN CATCH
 select 'Error'
END CATCH
GO