SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[studentGrades] @std_id INT
AS 
IF EXISTS(SELECT stu_id from Student WHERE stu_id=@std_id)
BEGIN
SELECT c.name ,sc.grade FROM courses c,Student_Course sc
WHERE c.Crs_id=sc.Crs_id AND sc.Stu_id=@std_id
END
ELSE
SELECT 'Student does not exist' AS 'result'
GO