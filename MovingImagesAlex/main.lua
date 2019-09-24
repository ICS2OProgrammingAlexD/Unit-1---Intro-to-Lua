-- Title: MovingObjects
-- Name: Alex De Meo
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- Hide the status Bar
display.setStatusBar (display.HiddenStatusBar)

-- Global Variables
scrollSpeed = 3

-- background Image with width and height
local backgroundImage = display.newImageRect ("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect ("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the intial x/y positioning of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

--Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip (event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	--change the transparency of the ship every time it moves so that it fades out.
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener ("enterFrame", MoveShip)