-- Title: NumericTextFields
-- Name: Alex De Meo
-- Course: ICS2O/3C
-- This program asks the user a random addition question, if the
-- user enters the correct answer into the numeric text field, 
--the program says correct, otherwise the program says incorrect. 
--then it asks the user another random addition question
---------------------------------------------------------------------

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- set the background color
display.setDefault ("background", 225/255, 255/255, 255/255)

-----------------------------------------------------------------
--Local VARIABLES
-----------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField 
local randomNumber1
local correctAnswer 
local randomNumber2
local userAnswer
local checkmark
local red_X
local dingSound
local buzzSound
local youWin
local gameOver
local pointsCount = 0
local livesCount = 3

----------------------------------------------------------------
--Local Functions
----------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between 1 and 20
	randomNumber1 = math.random (1, 20)
	randomNumber2 = math.random (1, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create the question
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="	
end

local function HideCorrectObject() 
	correctObject.isVisible = false
	AskQuestion()
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideCheckmark()
	checkmark.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideRed_X( ... )
	red_X.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event)
	-- User begins editing "numericField"
	if (event.phase == "began") then
		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then
		-- when the answer is submitted (enter Key gets pressede) set user input to users answer
		userAnswer = tonumber(event.target.text)


		-- if the users answer and the correct answer are the same then
		if (userAnswer == correctAnswer) then
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
			if (livesCount == 0) then 
				gameOver.isVisible = true
				pointsText.isVisible = false
				livesText.isVisible = false
				numericField.isVisible = false
				questionObject.isVisible = false
				audio.play (buzzSound)
			else
			
				incorrectObject.isVisible = true
				red_X.isVisible = true
				audio.play (buzzSound)
				livesCount = livesCount - 1
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
end



------------------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------------

-- displays a question and sets color of the questionObject
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (0, 0, 0)

-- create the correct text object and make it  invisible
correctObject = display.newText ("Correct!", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
correctObject:setTextColor (0, 204/255, 0)
correctObject.isVisible = false

-- create the incorrect object and make it invisible 
incorrectObject = display.newText ("     Not Quite! \n " , display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
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
checkmark.y = display.contentHeight*2/3
checkmark.isVisible = false

--create the red_X
red_X = display.newImageRect ("Images/red_x.png", 150, 150)
red_X.x = display.contentWidth*2/3
red_X.y = display.contentHeight/3
red_X.isVisible = false

--create the audio for the correct
dingSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")

-- create the audio for incorrect
buzzSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")

-- create numeric field 
numericField = native.newTextField (display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listeners for numeric field
numericField:addEventListener ("userInput", NumericFieldListener)

--------------------------------------------------------------------
--Function Calls
-----------------------------------------------------------------

--call the function to ask question
AskQuestion(230/255, 0, 0)