SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[updateInstructorCourse]  @ins_id INT  ,@crs_id INT, @eval NVARCHAR(70)='', @ins_new INT =-1, @crs_new INT =-1
as
begin try 
if(@ins_new!=-1)
	BEGIN
		IF EXISTS(SELECT * FROM Instructor_Course ic WHERE Ins_id=@ins_id  AND Crs_id=@crs_id)
		BEGIN
		update Instructor_Course set Ins_id=@ins_new where  Ins_id=@ins_id  AND Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'

	END
if(@crs_new!=-1 )
	BEGIN
	IF EXISTS(SELECT * FROM Instructor_Course ic WHERE Ins_id=@ins_id  AND Crs_id=@crs_id)
		BEGIN
		update Instructor_Course set Crs_id=@crs_new where  Ins_id=@ins_id  AND Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'

	END
if( @eval !='')
	BEGIN
	IF EXISTS(SELECT * FROM Instructor_Course ic WHERE Ins_id=@ins_id  AND Crs_id=@crs_id)
		BEGIN
		update Instructor_Course set Evaluation=@eval  where Ins_id=@ins_id  AND Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'

	END

end try
begin catch
select 'Error'
end CATCH
GO