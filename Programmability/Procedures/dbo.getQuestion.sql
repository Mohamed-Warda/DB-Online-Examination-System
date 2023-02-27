SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[getQuestion] @id int=-1
as
if  @id != -1
	BEGIN 
	IF exists(select * from Questions where Qst_id = @id)
		DECLARE @type VARCHAR(20) =(SELECT type FROM questions WHERE qst_id = @id)
		IF @type = 'mcq'
		BEGIN	
			SELECT Questions.Qst_id, Questions.Question, Questions.Model_Answer, PivotData.a, PivotData.b, PivotData.c, PivotData.d
			FROM
			(
			SELECT *
			FROM
			(
				SELECT qst_id,choiceId , choice
				FROM question_choice
			) d
			pivot
			(
				MAX(choice)
				FOR choiceId in (a, b, c, d)
			) piv
			WHERE piv.qst_id =@id
			) as PivotData
			INNER JOIN Questions ON PivotData.qst_id = Questions.Qst_id
		END
		ELSE IF @type='t/f'
		BEGIN
			SELECT q.Qst_id, q.Question, q.Model_Answer,'true' AS a ,'false' AS b ,'' AS c , '' AS d
			FROM Questions q
			WHERE q.Qst_id=@id
		END
	ELSE 
		SELECT 'Not Found'	    
	END
ELSE  /*For the First If */
	BEGIN 
		SELECT 'enter an id'
	END
GO