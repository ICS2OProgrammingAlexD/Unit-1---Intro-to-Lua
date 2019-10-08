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
local randomNumber2
local userAnswer
local correctAnswer
local checkmark
local red_X
local dingSound
local buzzSound

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
		correctObject.isVisible = true
		checkmark.isVisible = true
		audio.play (dingSound)
		timer.performWithDelay (2000, HideCorrect)
		timer.performWithDelay(2000, HideCheckmark)
		event.target.text = ""
		else 
		incorrectObject.isVisible = true
		red_X.isVisible = true
		audio.play (buzzSound)
		timer.performWithDelay (2000, HideRed_X)
		timer.performWithDelay (2000, HideIncorrect)
		event.target.text = ""
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
incorrectObject = display.newText ("Not Quite!", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
incorrectObject:setTextColor (230/255, 0, 0)
incorrectObject.isVisible = false

--create the checkmark
checkmark = display.newImageRect ("Images/checkmark.png", 150, 150)
checkmark.x = display.contentWidth*2/3
checkmark.y = display.contentHeight*2/3
checkmark.isVisible = false

--create the red_X
red_X = display.newImageRect ("Images/red_x.png", 150, 150)
red_X.x = display.contentWidth*2/3
red_X.y = display.contentHeight*2/3
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