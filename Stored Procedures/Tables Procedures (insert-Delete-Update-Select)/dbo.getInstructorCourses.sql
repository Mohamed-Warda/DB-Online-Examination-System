SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
 CREATE proc [dbo].[getInstructorCourses] @ins_id int=-1 ,@crs_id int =-1
as 
BEGIN TRY
if(@ins_id=-1 and @crs_id<>-1)
	BEGIN
		if exists(select ic.Crs_id from Instructor_Course ic  WHERE ic.Crs_id = @crs_id)
		BEGIN
		SELECT i.Fname+' '+i.Lname AS [Full Name] , c.Name ,ic.Evaluation
		FROM Courses c ,Instructor i,Instructor_Course ic
		WHERE c.Crs_id=ic.Crs_id AND ic.Ins_id=i.Ins_id AND ic.Crs_id=@crs_id
		END
		ELSE SELECT 'Not Found'
	END
ELSE if(@ins_id<>-1 and @crs_id=-1)
	BEGIN
		if exists(select ic.Ins_id from Instructor_Course ic  WHERE ic.Ins_id  = @ins_id)
		BEGIN
		SELECT i.Fname+' '+i.Lname AS [Full Name] , c.Name ,ic.Evaluation
		FROM Courses c ,Instructor i,Instructor_Course ic
		WHERE c.Crs_id=ic.Crs_id AND ic.Ins_id=i.Ins_id AND ic.Ins_id  = @ins_id
		END
		ELSE SELECT 'Not Found'
	END
ELSE IF (@ins_id<>-1 and @crs_id<>-1)
	BEGIN	
		if exists (select ic.Crs_id from Instructor_Course ic  WHERE ic.Crs_id = @crs_id) AND EXISTS (select ic.Ins_id from Instructor_Course ic  WHERE ic.Ins_id  = @ins_id)
		BEGIN
        SELECT i.Fname+' '+i.Lname AS [Full Name] , c.Name ,ic.Evaluation
		FROM Courses c ,Instructor i,Instructor_Course ic
		WHERE c.Crs_id=ic.Crs_id AND ic.Ins_id=i.Ins_id AND ic.Ins_id  = @ins_id AND ic.Crs_id=@crs_id
        END
		ELSE SELECT 'Not Found'
	END

ELSE 
	BEGIN	
		SELECT i.Fname+' '+i.Lname AS [Full Name] , c.Name ,ic.Evaluation
		FROM Courses c ,Instructor i,Instructor_Course ic
		WHERE c.Crs_id=ic.Crs_id AND ic.Ins_id=i.Ins_id 
	END
END TRY
BEGIN CATCH
SELECT 'Error'
END CATCH
GO