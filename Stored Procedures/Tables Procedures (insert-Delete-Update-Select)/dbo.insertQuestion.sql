SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[insertQuestion] 
(@crsId INT
,@qstContent VARCHAR(200)
,@type VARCHAR(10)
,@ModelAns VARCHAR(10)
,@Qstgrd INT
,@choiceA VARCHAR(200) = NULL
,@choiceB VARCHAR(200) = NULL
,@choiceC VARCHAR(200) = NULL
,@choiceD VARCHAR(200) = NULL
)
as
begin TRY
	DECLARE @qstId INT
	SET @qstId = (SELECT TOP 1 Qst_id FROM Questions ORDER BY Qst_id DESC)
	SET @qstId += 1

	INSERT INTO Questions 
	VALUES (@qstId, @crsId, @qstContent, @type, @ModelAns, @Qstgrd)

	IF @type = 'mcq'
		BEGIN  
    		INSERT INTO Question_Choice
			VALUES(@qstId,@choiceA,'a'),(@qstId,@choiceB,'b'),(@qstId,@choiceC,'c'),(@qstId,@choiceD,'d')
		END
	ELSE
		BEGIN
			INSERT INTO Question_Choice
			VALUES(@qstId,'false','f'),(@qstId,'true','t')
		END
end try
begin catch
	select 'error'
end CATCH
GO