SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[courseTopics] @course_id INT
AS 
IF EXISTS(SELECT crs_id FROM Courses  WHERE Crs_id=@course_id)
BEGIN 
SELECT topic.top_name 
FROM Topic , courses 
WHERE topic.Crs_id=Courses.Crs_id AND Courses.Crs_id=@course_id
END 
ELSE
SELECT 'there is no course with this id' AS 'result'
GO