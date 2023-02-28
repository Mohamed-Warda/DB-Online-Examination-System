--Proc that takes ( course name -Number of Questions (MCQ+T/F) =10 Q -Exam Duration (Optional-Default 60 M) - Exam Date (Optional-Default Current Date)
alter PROC CreateExam @crs_name VARCHAR(50) , @N_mcq INT=0 ,@N_tf INT=0 , @duration INT = 60 , @date DATE =NULL 
WITH ENCRYPTION
AS
BEGIN TRY
--Check if the Course Exists and The Number OF Questions =10
	IF NOT EXISTS (SELECT * FROM Courses C WHERE Name =@crs_name)
	BEGIN
		SELECT 'This Course Does Not Exists'
	END
	ELSE IF (@N_mcq +@N_tf !=10 OR @N_mcq< 0 OR @N_tf<0 )
	BEGIN
		SELECT 'Enter Valid Number Of Question'
	END
	-- Else (Our Code)
	ELSE
	BEGIN
		---1- Get Course ID
		DECLARE @crs_id INT 
		SELECT @crs_id= Crs_id FROM Courses WHERE Name=@crs_name
		-- insert in exam ( exm id - duration- crs id -date )
		if @date is null set @date =getDate()
		INSERT INTO Exams
		VALUES (@duration,@crs_id,@date)
	

	-- get the latest add identity value
		DECLARE @new_exam_id int = @@IDENTITY
		

	
	
		INSERT INTO Exam_Questions
		SELECT TOP (@N_mcq) @new_exam_id,Qst_id FROM Questions WHERE Crs_id = @crs_id and type ='mcq' ORDER BY NEWID()
	
		Insert Into Exam_Questions
		SELECT TOP (@N_tf) @new_exam_id, Qst_id FROM Questions WHERE Crs_id = @crs_id and type = 't/f' ORDER BY NEWID()
	
		SELECT 'Exam Created'
	END
END TRY
BEGIN CATCH
SELECT 'Error'
END CATCH


CreateExam 'DB',3,7
