SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
ALTER PROC [dbo].[instructorCourses] @ins_id INT
AS
IF EXISTS(SELECT ins_id FROM Instructor  WHERE Ins_id=@ins_id)
BEGIN
SELECT c.name AS 'course name' , COUNT(sc.stu_id) AS 'students number' FROM Student_Course sc, Courses c,Instructor_Course ic
WHERE c.Crs_id=sc.Crs_id AND c.Crs_id=ic.Crs_id AND ic.Ins_id=@ins_id
GROUP BY c.name 
END
ELSE
SELECT 'instructor does not exist'
GO