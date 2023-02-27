SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[getExam] @id int	=-1
AS
if  @id != -1
BEGIN
	IF exists(select * from Exam_Questions eq where eq.Exm_id = @id)
		BEGIN
			DECLARE @getexam TABLE (qstID int,question varchar(200),answer varchar(200),a varchar(200),b VARCHAR(200),c VARCHAR(200),d VARCHAR(200));
			DECLARE c1 CURSOR
			FOR SELECT eq.Qst_id FROM Exam_Questions eq WHERE eq.Exm_id = @id
			for read ONLY 
			declare @qstID int
			open c1
			fetch c1 into @qstID
			while @@fetch_Status=0
			BEGIN
				INSERT INTO @getexam 
				EXECUTE getquestion @qstID
				fetch c1 into @qstID
			end
			SELECT * FROM @getexam
			close c1
			deallocate c1
		END
	ELSE
	BEGIN
		SELECT 'not found'
	END
END
ELSE
	BEGIN 
		SELECT 'enter an id'
	END
GO