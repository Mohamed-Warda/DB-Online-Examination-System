SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create proc [dbo].[addInstructorCourse] @ins_id int ,@crs_id INT ,@eval NVARCHAR(70)
as
begin try
insert into Instructor_Course values(@ins_id, @crs_id,@eval)
end try
begin catch
select 'Error'
end catch
GO