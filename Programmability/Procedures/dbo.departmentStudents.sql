SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[departmentStudents] @dept_id INT
AS
IF EXISTS(SELECT did FROM department WHERE did = @dept_id)
BEGIN 
IF EXISTS(SELECT s.did,D.did FROM student s, department D WHERE s.did=D.did AND D.did=@dept_id)
BEGIN
SELECT s.* FROM student s, department d 
WHERE s.did=D.did AND D.did=@dept_id
END--end of secont if
ELSE
SELECT 'no students in this department'
END --end of first if
ELSE
SELECT 'department does not exist' AS 'result'
GO