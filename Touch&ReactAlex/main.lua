-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program 

-- set background color
display.setDefault ("background", 0.79,0.95,1.00)

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- create the orange button, set position make invisible
local orangeButton = display.newImageRect ("Images/Fast Button Active@2x.png", 150,100)
orangeButton.x = display.contentWidth/2
orangeButton.y = display.contentHeight/2
orangeButton.isVisible = true

-- create the Yelllow button, set position make invisible
local yellowButton = display.newImageRect ("Images/Fast Button Inactive@2x.png", 150, 100)
yellowButton.x = display.contentWidth/2
yellowButton.y = display.contentHeight/2
yellowButton.isVisible = false

-- create text object, set position make invisible
local textObject = display.newText ("Got me!", 0, 0, Arial, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0, 0, 0)
textObject.isVisible = false

--function: OrangeButtonListener
-- Input: this function accepts a touch listener
-- output none
-- Description: when the orange button is clicked, it will make the text appear 
--with the yellow button, and make the orange button disappear
local function OrangeButtonListener(touch)
	if (touch.phase == "began") then
		orangeButton.isVisible = false
		yellowButton.isVisible = true
		textObject.isVisible = true
	end
	
	if (touch.phase == "ended")	then
		orangeButton.isVisible = true
		yellowButton.isVisible = false
		textObject.isVisible = false
	end	
end

--function: YellowButtonListener
-- Input: this function accepts a touch listener
-- output: none
-- Description:  when the yellow button is clicked, it will make the text appear 
--with the orange button, and make the yellow button disappear
--local function YellowButtonListener( touch)
--	if (touch.phase == "began") then
--		yellowButton.isVisible = false
--		orangeButton.isVisible = true
--		textObject.isVisible = true
--	end
--
--	if (touch.phase == "ended") then
--		yellowButton.isVisible = true
--		orangeButton.isVisible = false
--		textObject.isVisible = false
--	end	
--end

-- add the touch listeners to the objects
orangeButton:addEventListener("touch", OrangeButtonListener)
--yellowButton:addEventListener("touch", YellowButtonListener)