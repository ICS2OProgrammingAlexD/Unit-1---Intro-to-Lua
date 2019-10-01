-- Title: MovingObjects
-- Name: Alex De Meo
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out.

-- Hide the status Bar
display.setStatusBar (display.HiddenStatusBar)

-- Global Variables
scrollSpeed = 6 - 14

-- First Character
-- background Image with width and height
local backgroundImage = display.newImageRect ("Images/background.png", 2048, 1536)

-- character image with width and height
local ferrari = display.newImageRect ("Images/ferrari.png", 300, 100)

-- set the image to be transparent
ferrari.alpha = 1

--set the ferrrari size to 100%
ferrari.xScale = 0.01
ferrari.yScale = 0.01

-- set the intial x/y positioning of ferrari
ferrari.x = 1000
ferrari.y = display.contentHeight/3

--Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip (event)
	-- add the scroll speed to the x-value of the ferrari
	ferrari.x = ferrari.x + scrollSpeed
	--change the transparency of the ferrari every time it moves so that it fades in.
	ferrari.alpha = ferrari.alpha - 0.01
	-- Change the size of the ferrari to get bigger
	ferrari.xScale = ferrari.xScale + 0.01
	ferrari.yScale = ferrari.yScale + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener ("enterFrame", MoveShip)

--------------------------------------------------------------
-- Second character

-- Make new global variable
scrollSpeed2 =  15

-- second character image. Change the image at school
local f1 = display.newImageRect ("Images/f1.png", 200, 100)

-- Set the image to be transparent
f1.alpha = 0

--set the size of the f1 car
f1.xScale = 2
f1.yScale = 2

--set the intial x/y positioning of the f1 car
f1.x = 0
f1.y = display.contentHeight/2

-- Function: MoveCar
-- Input: this funtion accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the car
local function MoveCar(event)
	-- add the scroll speed to the x value of car
	f1.x = f1.x + scrollSpeed2
	--change the transparency of the f1 car after every time it moves so that it fades out.
	f1.alpha = f1.alpha + 0.01
	--Change the size of the f1 car
	f1.xScale = f1.xScale - 0.03
	f1.yScale = f1.yScale - 0.03
end

--MoveCar will be called over and over again
Runtime:addEventListener ("enterFrame", MoveCar)