local incorrectObject
local numericField 
local randomNumber1
local correctAnswer 
local randomNumber2
local userAnswer
local correctAnswer
local checkmark
local red_X
local dingSound
local buzzSound
local youWin
local gameOver
local pointsCount = 0
local livesCount = 3
local randomOperator
local divMultiAns

----------------------------------------------------------------
--Local Functions
local function AskQuestion()
	randomNumber1 = math.random (1, 10)
	randomNumber2 = math.random (1, 10)
	randomOperator = math.random (1, 4)
	-- if randomOperator ==1 then do addition
	if (randomOperator == 1) then
		-- create correct Answer
		correctAnswer = randomNumber1 + randomNumber2
		--create questionObject
		questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
	--if randomOperator == 2 then do multiplication
	elseif (randomOperator == 2) then	
		--recreate coorectAnswer
		correctAnswer = randomNumber1 * randomNumber2

		--create questionObject
		questionObject = randomNumber1 .. " x " .. randomNumber2 .. " ="
	-- if randomOperator == 3 then do subtraction
	elseif (randomOperator == 3) then 
		if (randomNumber2 > randomNumber1) then
			-- create correctAnswer
			correctAnswer = randomNumber2 - randomNumber1
			
			--  create questionObject
			questionObject = randomNumber2 .. " - " .. randomNumber1 .. " ="
		else
			--create correctAnswer
			correctAnswer = randomNumber1 - randomNumber2
			
			-- create questionObject
			questionObject = randomNumber1 .. " - " .. randomNumber2 .. " ="
		end
	elseif (randomOperator == 4) then
		divMultiAns = randomNumber1 * randomNumber2
		--create Correct answer
		correctAnswer = divMultiAns / randomNumber1

		-- create questionObject
		questionObject = divMultiAns .. " / " .. randomNumber1 .. " ="
	end 
end

local function HideCorrectObject() 
	correctObject.isVisible = false
	AskQuestion()
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event)
	-- when the answer is submitted (enter Key gets pressede) set user input to users answer
	userAnswer = tonumber(event.target.text)


	-- if the users answer and the correct answer are the same then
	if (userAnswer == correctAnswer) then
		correctObject.isVisible = true
		checkmark.isVisible = true
		audio.play (dingSound)
		timer.performWithDelay (2000, HideCorrect)
		timer.performWithDelay(2000, HideCheckmark)
		event.target.text = ""
			if (pointsCount == 4) then
				youWin.isVisible = true
				pointsText.isVisible = false
				livesText.isVisible = false
				numericField.isVisible = false
				questionObject.isVisible = false
				audio.play (dingSound)
			else
				correctAnswer = tostring(correctAnswer)
				correctObject.isVisible = true
				checkmark.isVisible = true
				audio.play (dingSound)
				pointsCount = pointsCount + 1
				pointsText.text = "Points: " .. pointsCount
				timer.performWithDelay (2000, HideCorrect)
				timer.performWithDelay(2000, HideCheckmark)
				event.target.text = ""
			end
		else 
		incorrectObject.isVisible = true
		red_X.isVisible = true
		audio.play (buzzSound)
		timer.performWithDelay (2000, HideRed_X)
		timer.performWithDelay (2000, HideIncorrect)
		event.target.text = ""

		if (livesCount == 0) then 
			gameOver.isVisible = true
			pointsText.isVisible = false
			livesText.isVisible = false
			numericField.isVisible = false
			questionObject.isVisible = false
			audio.play (buzzSound)
		else
			incorrectObject = display.newText ("     Not Quite! \n the correct answer is ".. correctAnswer , display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
			incorrectObject.text = "     Not Quite! \n the correct answer is ".. correctAnswer 
			incorrectObject.isVisible
			red_X.isVisible = true
			audio.play (buzzSound)
			livsCount = livesCount - 1
			correctObject.text = "The right answer is " .. correctAnswer
			correctObject.isVisible = true
			correctObject:setTextColor (230/255, 0, 0)
			correctObject.y = correctObject.y + 30		
			livesText.text = "lives remaining: " .. livesCount
			timer.performWithDelay (2000, HideRed_X)
			timer.performWithDelay (2000, HideIncorrect)
			timer.performWithDelay (2000, HideCorrectObject)
			event.target.text = ""
		end
	end			
end



------------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------------
correctObject = display.newText ("Correct!", display.contentWidth/2, display.contentHeight*2/3)
correctObject:setTextColor (0, 204/255, 0)
correctObject.isVisible = false

-- create the incorrect object and make it invisible 

incorrectObject:setTextColor (230/255, 0, 0)
incorrectObject.isVisible = false

--create points text 
pointsText = display.newText ("Points: " .. pointsCount, 100, 50, Arial, 40)
pointsText:setTextColor (0, 0 ,0)

-- create lives text 
livesText = display.newText ("lives remaining: ".. livesCount, 178, 100, Arial, 40)
livesText:setTextColor (0, 0, 0)

--  create livesCount
livesCount = 3

-- create correctAnswer
correctAnswer = 0

-- create pointsCount
pointsCount = 0

-- create game over 
gameOver = display.newImageRect ("Images/gameOver.png", 800, 700)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/3
gameOver.isVisible = false

-- create you youWin
youWin = display.newImageRect ("Images/youWin.png", 800, 400)
youWin.x = display.contentWidth/2 + 30
youWin.y = display.contentHeight/3
youWin.isVisible = false

--create the checkmark
checkmark = display.newImageRect ("Images/checkmark.png", 150, 150)
checkmark.x = display.contentWidth*2/3
heckmark.isVisible = false

-- create ding Sound
dingSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")

--create the red_X
red_X = display.newImageRect ("Images/red_x.png", 150, 150)
red_X.x = display.contentWidth*2/3
red_X.y = display.contentHeight*2/3
red_X.y = display.contentHeight/3
red_X.isVisible = false

--create the audio for the incorrect
buzzSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")

----------------------------------------------------------
--funtion Calls
---------------------------------------------------------------
AskQuestion()