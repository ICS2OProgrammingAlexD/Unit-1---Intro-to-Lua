-- Title: TouchAndReact
-- Name: Alex De Meo
-- Course: ICS2O/3C
-- This program displays a button on-screen. when the user clicks on the button, 
--it disapears and a different screen takes its place. the word clicked appears 
--along with an image and a ding sound.  when user releases mouse, the orginal 
--button reappears and the text and image dissapears.

-- set background color
display.setDefault ("background", 0.79,0.95,1.00)

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- create the red button, set position make invisible
local redButton = display.newImageRect ("Images/Fast Button Active@2x.png", 150,100)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = true

-- create the Yelllow button, set position make invisible
local blueButton = display.newImageRect ("Images/Fast Button Inactive@2x.png", 150, 100)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = false

-- create text object, set position make invisible
local textObject = display.newText ("Got me!", 0, 0, Arial, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 0, 0)
textObject.isVisible = false

-- create checkmark vars
local checkmark = display.newImageRect ("Images/checkmark.png", 150, 150)
checkmark.x = display.contentWidth/3
checkmark.y = display.contentHeight/2
checkmark.isVisible = false

-- make the sound
local dingSound = audio.loadSound ("Sounds/Correct Answer Sound Effect.mp3")
--function: redButtonListener
-- Input: this function accepts a touch listener
-- output none
-- Description: when the red button is clicked, it will make the text appear 
--with the blue button, and make the red button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		audio.play (dingSound)
	end
	
	if (touch.phase == "ended")	then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end	
end

--function: RedButtonListener2
-- Input: this function accepts a touch listener
-- output: none
-- Description:  when the blue button is clicked, it will make the text appear 
--with the red button, and make the blue button disappear
local function RedButtonListener2( touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = false
		checkmark.isVisible = false
	end	
end

-- add the touch listeners to the objects
redButton:addEventListener("touch", RedButtonListener)
blueButton:addEventListener("touch", RedButtonListener2)