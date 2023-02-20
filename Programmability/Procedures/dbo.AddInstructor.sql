SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[AddInstructor]  @id int, @fname nvarchar(70),@lname nvarchar(70) ,@degree NVARCHAR(70), @sal int , @address nvarchar(70)=null,@phone int=null,@supervisor int
as
begin try
insert into Instructor values(@id,@fname,@lname,@degree,@sal,@address,@phone,@supervisor)
end try
begin catch
select 'Error'
end CATCH
GO