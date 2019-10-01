-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program 

-- set background color
display.setDefault ("background", 0.79,0.95,1.00)

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- create the orange button, set position make invisible
local orangeButton = display.newImageRect ("Images/Orange button.png", 150,150)
orangeButton.x = display.contentWidth/2
orangeButton.y = display.contentHeight/2
orangeButton.isVisible = false

-- create the Yelllow button, set position make invisible
local yellowButton = display.newImageRect ("Images/Yellow Button.png", 150, 150)
yellowButton.x = display.contentWidth/2
yellowButton.y = display.contentHeight/2
yellowButton.isVisible = false

-- create text object, set position make invisible
local textObject