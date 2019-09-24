-- Title: AreaOfRectangleAndCircle
-- Name: Alex De Meo
-- Course: ICS2O/3C
-- This program...

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle
local radiusOfCircle = 100
local areaOfCircle
local PI = 3.141592653589793238
local circleAreaText
-- set background colour of screen. Remember that colours are between 1 and 0
display.setDefault ("background", 204/255, 255/255, 255/255)

-- remove status bar
display.setStatusBar (display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect (0, 0, widthOfRectangle, heightOfRectangle)

-- Anchor the rectangle in the top left corner of the screen and set x/y position
myRectangle.anchorX = 0
myRectangle.AnchorY = 0
myRectangle.x = 20
myRectangle.y = 120

-- set width of border
myRectangle.strokeWidth = 10

--set rectangle color
myRectangle:setFillColor (66/255, 184/255, 131/255)

-- set color of border
myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration the size of the front when positioning it on the screen.
areaText = display.newText ("The area of this rectangle with a width of \n " ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is "  ..
	areaOfRectangle .. " pixels².", 400, 500, Arial, 50)

--anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.AnchorY = 0
areaText.x = 20
areaText.y = 300

-- Set the colour of the newText
areaText:setTextColor (0, 0, 0)

-- Create the circle
myCircle = display.newCircle (0, 0, radiusOfCircle)

-- Anchor the Circle to the top left corner of the screen.
myCircle.anchorX = 0
myCircle.AnchorY = 0
myCircle.x = 20
myCircle.y = 500

-- set width of border
myCircle.strokeWidth = 10

--set rectangle color
myCircle:setFillColor (66/255, 184/255, 131/255)

-- set color of border
myCircle:setStrokeColor(0, 0, 0)

--Calculate area of the circle
areaOfCircle = radiusOfCircle * radiusOfCircle * PI

-- Write the area of the circle on the screen.
circleAreaText = display.newText ("The area of this Circle with a radius of \n" ..
	radiusOfCircle .. " is " .. 
	areaOfCircle .. "pixels².", 400, 500, Arial, 50)


-- Change the text color
circleAreaText:setTextColor (0, 0, 0)

-- Anchor the Circle to the top left corner of the screen.
circleAreaText.AnchorX = 0
circleAreaText.AnchorY = 0
circleAreaText.x = 450
circleAreaText.y = 700