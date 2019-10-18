-- Title: PhysicsAndCollisions
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays four different balls that fall 
-- from different side of the screen onto a ramp and then 
--roll along the ground. I added a ramp/wall on the other 
-- side of the screen to stop the balls from rolling off 
--the screen.
-------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

--start physics
physics.start()

--------------------------------------------------------
--LOCAL VARIABLES
--------------------------------------------------------

local ground
local bkgImage
local ball1
local ball2
local ball3
local ball4
local beam1 
local beam2

----------------------------------------------------
--OBJECT CREATION
----------------------------------------------------
bkgImage = display.newImageRect("Images/bkg.png", display.contentWidth, display.contentHeight)
bkgImage.x = display.contentWidth/2
bkgImage.y = display.contentHeight/2

-- create the ground
ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = display.contentHeight*5/5 - 30
ground.width = display.contentWidth
-- add physics to ground
physics.addBody(ground, "static", {friction= 0.5, bounce= 0.3})

-- create beam1
beam1 = display.newImage("Images/beam.png")
beam1.width = display.contentWidth/2
beam1.height = display.contentHeight/10
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
-- rotate beam to be 45 on angle
beam1:rotate(45)
-- add physics
physics.addBody(beam1, "static", {friction= 0.4, bounce= 0.3})

-- create beam2 
beam2 = display.newImage("Images/beam.png")
beam2.width = display.contentWidth/2
beam2.height = display.contentHeight/10
beam2.x = display.contentWidth*9/10
beam2.y = display.contentCenterY*1.65
-- rotate beam to be 135 degrees
beam2:rotate(135)