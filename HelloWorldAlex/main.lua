-- Title: HelloWorld
-- Name: Alex De Meo
-- Course: ICS2O 
-- This program displays Hello to the simulator and to the command terminal.
-- and to the command terminal

-- print to the command terminal 
print ("Hello World!")
print ("OK Goodbye")

-- Hide Status Bar
display.setStatusBar (display.HiddenStatusBar)

-- Change backround color
display.setDefault ("background", 217/255, 238/255, 236/255)

--create a local variable
local textObject

--make the text object display my name
textObject = display.newText ("Hello Alex!", display.contentWidth/2, display.contentHeight/2, "Above The Sky", 50)

--change the text color
textObject:setTextColor (60/255, 111/255, 156/255)

--new local variable (textObjectSignature)
local textObjectSignature

--Make the text display (by Alex)
textObjectSignature = display.newText ("By: Alex De Meo", display.contentWidth/2, 500, nil, 40)

--Make the text color different
textObjectSignature:setTextColor (60/255, 111/255, 156/255)
