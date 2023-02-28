SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE proc [dbo].[updateQuestionByID]  
(@id INT
,@qstContent VARCHAR(200) = ''
,@ModelAns VARCHAR(10)=''
,@Qstgrd INT= -1
,@choiceA VARCHAR(200) = ''
,@choiceB VARCHAR(200) = ''
,@choiceC VARCHAR(200) = ''
,@choiceD VARCHAR(200) = ''
)
as
if exists(select Qst_id from Questions where Qst_id = @id)
begin
begin  

if @qstContent != ''
update Questions set Question=@qstContent where Qst_id = @id

if @ModelAns != ''
update Questions set Model_Answer=@ModelAns where Qst_id = @id

if @Qstgrd != -1
update Questions set Qst_Grade=@Qstgrd where Qst_id = @id

DECLARE @type VARCHAR(20) =(SELECT type FROM questions WHERE qst_id = @id)

If @type = 'mcq'
BEGIN 
	if @choiceA != ''
	begin
	update Question_Choice set Choice=@choiceA 
	where choice = (SELECT choice FROM question_choice WHERE qst_id = @id
	ORDER BY qst_id OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY)
	END

	if @choiceB != ''
	BEGIN
	update Question_Choice set Choice=@choiceB 
	where choice = (SELECT choice FROM question_choice WHERE qst_id = @id
	ORDER BY qst_id OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY)
	END

	if @choiceC != ''
	BEGIN
	update Question_Choice set Choice=@choiceC 
	where choice = (SELECT choice FROM question_choice WHERE qst_id = @id
	ORDER BY qst_id OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY)
	END

	if @choiceD != ''
	BEGIN
	update Question_Choice set Choice=@choiceD 
	where choice = (SELECT choice FROM question_choice WHERE qst_id = @id
	ORDER BY qst_id OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY)
	END
END 
ELSE 
	BEGIN
		SELECT 'true & false'
	END

end 
--begin catch
	--select 'Error'
--end catch
end
else select 'no question found'
GO