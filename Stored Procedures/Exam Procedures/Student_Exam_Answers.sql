-- Exam Answers
ALTER PROC StudentExamAnswers
@exam_id int, @std_id INT, @q_1 varchar(50),
@q_2 varchar(50),@q_3 varchar(50),@q_4 varchar(50),@q_5 varchar(50),@q_6 varchar(50),
@q_7 varchar(50),@q_8 varchar(50),@q_9 varchar(50),@q_10 varchar(50)

WITH ENCRYPTION
AS
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM Student  WHERE Stu_id=@std_id)
	BEGIN
	SELECT 'Student Does Not Exists'
	END
	ELSE IF NOT EXISTS(SELECT * FROM Exams e WHERE e.Exm_id=@exam_id)
	BEGIN
	SELECT 'Exam does Not Exists'
    END
	ELSE -- My Code
	BEGIN
	
			DECLARE @Answers table(answer VARCHAR(50))
			INSERT INTO @Answers VALUES(@q_1), (@q_2), (@q_3),(@q_4), (@q_5), (@q_6),(@q_7), (@q_8), (@q_9),(@q_10)

			INSERT INTO Student_Exam_Question
			SELECT s.Stu_id,eq.Exm_id,eq.Qst_id, NULL  --Must Insert Value for Every Column
			FROM Student s, Exam_Questions eq
			WHERE s.Stu_id=@std_id AND eq.Exm_id=@exam_id
			--Loop To Add the Anwers
			DECLARE c1 CURSOR 
			FOR SELECT answer FROM @Answers
			FOR READ ONLY
			DECLARE @addAnswer VARCHAR(50)
			OPEN c1 
			FETCH c1 INTO @addAnswer
			------
			DECLARE c2 CURSOR --Pointer on the Student_Exam_Question
			FOR SELECT seq.Qst_id FROM Student_Exam_Question seq
			WHERE seq.Exm_id=@exam_id AND seq.Stu_id=@std_id
			FOR UPDATE
			DECLARE @oldValue int
			OPEN c2 
			FETCH c2 INTO @oldValue


					WHILE @@FETCH_STATUS=0
					BEGIN
					UPDATE Student_Exam_Question SET Student_Answer =@addAnswer WHERE Exm_id=@exam_id and Stu_id=@std_id and Qst_id=@oldValue
					FETCH c1 INTO @addAnswer
					FETCH c2 INTO @oldValue
					END

			CLOSE c1 
			CLOSE c2
			DEALLOCATE c1
			DEALLOCATE c2

	END

END TRY
BEGIN CATCH
SELECT 'Error'
END CATCH