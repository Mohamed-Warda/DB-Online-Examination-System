SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[getInstructor] @id int=-1 ,@fname nvarchar(70)=' '
as
if @id = -1 and @fname !=' '
begin
		if exists(select * from Instructor i where i.Fname = @fname)
		begin
		select i.Ins_id ID , i.Fname +' '+i.Lname [Full name], i.Academics_Degree ,i.Salary , i.Address, i.Phone 
		FROM Instructor i
		WHERE i.Fname=@fname
		end
		else select 'Not Found'	    
end
else if  @id != -1 and @fname =' '
begin 
			if exists(select * from Instructor i where i.Ins_id = @id)
		begin
		select i.Ins_id ID , i.Fname +' '+i.Lname [Full name], i.Academics_Degree ,i.Salary , i.Address, i.Phone 
		FROM Instructor i
		WHERE i.Ins_id=@id
		end
		else select 'Not Found'	    
END

else /*For the First If */
begin
	select i.Ins_id ID , i.Fname +' '+i.Lname [Full name], i.Academics_Degree ,i.Salary , i.Address, i.Phone 
	FROM Instructor i
end
GO