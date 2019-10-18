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
local bkgMusic = audio.loadStream ("Sounds/formula-1-theme-song.mp3")
local bkgMusicChannel

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
-- add physics
physics.addBody(beam2, "static", {friction= 0.4, bounce= 0.3})

----------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------
local function BKGMusic(event)
	bkgMusicChannel = audio.play(bkgMusic, {loops= -1})
end

-- create ball1
local function Ball1()
	ball1 = display.newImage("Images/ball.png", 50, 50)
	-- add physics
	physics.addBody(ball1, {density= 1, friction= 0.7, bounce= 0.5, radius= 25})
end

-- create ball2 
local function Ball2()
	ball2 = display.newImage("Images/ball.png", 50, 50)

	-- add physics
	physics.addBody(ball2, {density= 0.75, friction= 0.3, bounce= 0.3, radius= 12.5})

	-- scale ball2
	ball2:scale (0.5, 0.5)
end

-- create ball3
local function Ball3()
	ball3 = display.newImage("Images/ball.png", 100, 100)

	-- add physics
	physics.addBody(ball3, {density = 0.2, friction= 0.2, bounce= 0.7, radius= 50})
	ball3:scale (2, 2)
end

-- create ball4
local function Ball4()
	ball4 = display.newImage("Images/ball.png", 150, 150)

	-- add physics
	physics.addBody(ball4, {density= 0.01, friction= 0.01, bounce= 0.99, radius= 75})
	ball4:scale(3, 3)
end

----------------------------------------------------------
--TIMER DELAYS - FOR EACH FUNCTION
-------------------------------------------------------------
timer.performWithDelay(0, Ball1)
timer.performWithDelay(500, Ball2)
timer.performWithDelay(1350, Ball3)
timer.performWithDelay(2200, Ball4)

--------------------------------------------------------
--FUNCTION CALLS
---------------------------------------------------------
Runtime:addEventListener("enterFrame", BKGMusic)