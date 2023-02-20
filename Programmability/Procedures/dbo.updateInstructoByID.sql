SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[updateInstructoByID] @id INT, @fname nvarchar(70)='',@lname nvarchar(70) ='',@degree NVARCHAR(70)='', @sal INT=-1 , @address nvarchar(70)='',@phone int=-1,@supervisor INT=-1
as
if exists(select Ins_id from Instructor where Ins_id = @id)
begin
begin try 

if @fname != ''
update Instructor set Fname=@fname where Ins_id = @id

if @lname != ''
update Instructor set Lname=@lname where Ins_id = @id

if @degree != ''
update Instructor set Academics_Degree=@degree where Ins_id = @id
if @sal != -1
update Instructor set Salary=@sal where Ins_id = @id
if @phone != 0
update Instructor set Phone=@phone where Ins_id = @id

if @address != ''
update Instructor set Address=@address where Ins_id = @id
if @supervisor != -1
update Instructor set Super_id=@supervisor where Ins_id = @id

end try
begin catch
select 'Error'
end catch
end
else select 'Instructor Does Not Exists'
GO