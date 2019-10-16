-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program asks the user a random addition question, if the user 
-- enters the correct answer into the numeric text field, the program 
--says correct, otherwise the program says incorrect. then it asks 
--the user another random addition question

-- hide the status bar 
display.setStatusBar (display.HiddenStatusBar)

-- set background color
display.setDefault ("background", 0.76,0.97,1.00)

----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local divMulAns
local checkmark
local redX
local dingsound
local buzzSound
local pointsCount
local points = 0 
local livesCount
local lives = 3
local youWin
local gameOver

-----------------------------------------------------------------
-- local functions
---------------------------------------------------------------
 
local function AskQuestion()
	randomNumber1 = math.random (1, 10)
	randomNumber2 = math.random (1, 10)
	randomOperator = math.random (1, 4)
	-- if randomOperator == 1 do addition
	if (randomOperator == 1) then
		-- set correct answer
		correctAnswer = randomNumber1 + randomNumber2	

		--create questionObject
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " ="
	-- if randomOperator == 2 then do multiplication
	elseif (randomOperator == 2) then
		-- set correctAnswer
		correctAnswer = randomNumber1 * randomNumber2

		-- set the questionObject
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " ="
	-- randomOperator == 3 then do subtraction
	elseif (randomOperator == 3) then
		if (randomNumber2 > randomNumber1) then
			-- set correctAnswer
			correctAnswer = randomNumber2 - randomNumber1	

			-- set questionObject
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " ="
		else
			--set correctAnswer
			correctAnswer = randomNumber1 - randomNumber2

			-- set questionObject
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " ="
		end
	-- if randomOperator == 4 then do division
	else
		-- set divMulAns and correctAnswer
		divMulAns = randomNumber1 * randomNumber2
		correctAnswer = divMulAns / randomNumber1
		-- set questionObject
		questionObject.text = divMulAns .. " / " .. randomNumber1 .. " ="
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideCheckmark()
	checkmark.isVisible = false
	AskQuestion()
end

local function HideIncorrect(  )
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideRedX()
	redX.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing numeric field
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""
	elseif (event.phase == "submitted") then

		-- when the answer is submitted ( enter key is pressed ) set input to user's answer
		userAnswer = tonumber (event.target.text)

		-- if user answers correctly
		if  (userAnswer == correctAnswer) then
			if (points == 4) then
				youWin.isVisible = true
				audio.play (dingSound)
				numericField.isVisible = false
				questionObject.isVisible = false
				pointsCount.isVisible = false
				livesCount.isVisible = false
			else
				points = points + 1 
				pointsCount.text = "Points: " .. points
				correctObject.isVisible = true
				checkmark.isVisible = true
				audio.play (dingSound)
				timer.performWithDelay (2000, HideCheckmark)
				timer.performWithDelay (2000, HideCorrect)
				event.target.text = ""
			end 
		else
			if (lives == 0) then
				gameOver.isVisible = true
				audio.play (buzzSound)
				numericField.isVisible = false
				questionObject.isVisible = false
				pointsCount.isVisible = false
				livesCount.isVisible = false
			else
				lives = lives - 1 
				livesCount.text = "Lives Remaining: " .. lives 
				incorrectObject.text = "         Not Quite, \n the right answer is " .. correctAnswer
				incorrectObject.isVisible = true
				redX.isVisible = true
				audio.play (buzzSound)
				timer.performWithDelay (2000, HideIncorrect)
				timer.performWithDelay (2000, HideRedX)
				event.target.text = ""
			end	
		end
	end 	
end

--------------------------------------------------------------------
-- Object Creation
--------------------------------------------------------------------

-- displays a question and sets colour
questionObject = display.newText ("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (0, 0, 0)
 
-- create CorrectObject
correctObject = display.newText ("Correct!", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
correctObject:setTextColor (0.08,0.90,0.16) 
correctObject.isVisible = false

-- create incorrectObject
incorrectObject = display.newText ("Not Quite! \n The right answer is ", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
incorrectObject:setTextColor (230/255, 0, 0)
incorrectObject.isVisible = false

--create checkmark 
checkmark = display.newImageRect ("Images/checkmark.png", 150, 150)
checkmark.x = display.contentWidth*2/3
checkmark.y = display.contentHeight*2/3
checkmark.isVisible = false

--create redX
redX = display.newImageRect ("Images/red_x.png", 150, 150)
redX.x = display.contentWidth*2/3 + 60
redX.y = display.contentHeight/3
redX.isVisible = false

-- create audio for correctObject
dingSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")

--create audio for incorrect object 
buzzSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")

-- create YouWin Image
youWin = display.newImageRect ("Images/You Win.png", 1000, 500)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight/2
youWin.isVisible = false

-- create gameOver Image
gameOver = display.newImageRect ("Images/GameOver.png", 1000, 700)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

-- create the points counter
pointsCount = display.newText ("Points: " .. points, 100, 100, nil, 40)
pointsCount:setTextColor (0, 0, 0)

-- create the lives counter
livesCount = display.newText ("Lives Remaining: " .. lives, 191, 150, nil, 40)
livesCount:setTextColor (0, 0, 0)

-- create numeric field
numericField = native.newTextField (display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for numeric field
numericField:addEventListener ("userInput", NumericFieldListener)

-------------------------------------------------------------
-- funtion calls
-------------------------------------------------------------

-- call the function to ask question
AskQuestion()