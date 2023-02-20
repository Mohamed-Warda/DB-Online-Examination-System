SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[deleteInstructorCourses] @ins_id int = -1 ,@crs_id int =-1
as 
BEGIN TRY
if(@ins_id<>-1 and @crs_id =-1)
BEGIN
		IF EXISTS (SELECT Ins_id FROM Instructor_Course ic WHERE Ins_id=@ins_id)
		BEGIN
		delete from Instructor_course where Ins_id=@ins_id
		END
		ELSE SELECT 'Not Found'
END
else if (@ins_id =-1 and @crs_id <>-1)
BEGIN
		IF EXISTS (SELECT Crs_id FROM Instructor_Course ic WHERE Crs_id=@crs_id)
		begin
		delete from Instructor_course where Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'
END
else if(@ins_id<>-1 and @crs_id<>-1) 
BEGIN	
		IF EXISTS (SELECT Crs_id FROM Instructor_Course ic WHERE Crs_id=@crs_id) AND EXISTS (SELECT Ins_id FROM Instructor_Course ic WHERE Ins_id=@ins_id)
		begin
		delete from Instructor_course where Ins_id=@ins_id and Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'
END
END TRY
begin catch
select 'Error'
end CATCH
GO