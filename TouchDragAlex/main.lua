-- Title: TouchAndDrag
-- Name: Alex De Meo
-- Course: ICS2O/3C
-- This program displays two images that can be dragged around on the screen. When one image overlaps another image, they do not get stuck together.

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- local variables. 
local backgroundImage
local rocketship = display.newImageRect ("Images/rocketship.png", 200,100)

local star = display.newImageRect ("Images/star.png", 150, 150)


-- my boolean vars to keep track of which object i clicked
local alreadyTouchedRocketship = false
local alreadyTouchedStar = false

--set initial x/y
rocketship.x = 500
rocketship.y = 300

star.x = 800
star.y = 500

-- Funtion: RocketshipListener
-- Input: touch Listener
--Output: none
-- Description: when rocketship = touched, move the rocket
local function RocketshipListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedStar == false) then
			alreadyTouchedRocketship = true
	end	

	if ( (touch.phase == "moved") and (alreadyTouchedRocketship == true) ) then
		rocketship.x = touch.x
		rocketship.y = touch.y
	end
	
	if (touch.phase == "ended") then
		alreadyTouchedRocketship = false
		alreadyTouchedStar = false
	end
end

-- Funtion: StarListener
-- Input: touch listener
-- Output: none
-- Description: when star = touched, move star
local function StarListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedRocketship == false) then
			alreadyTouchedStar = true
	end	

	if ( (touch.phase == "moved") and (alreadyTouchedStar == true) ) then
		rocketship.x = touch.x
		rocketship.y = touch.y
	end
	
	if (touch.phase == "ended") then
		alreadyTouchedRocketship = false
		alreadyTouchedStar = false
	end
end

-- add the respective listeners to each object
rocketship:addEventListener ("touch", RocketshipListener)
star:addEventListener ("touch", StarListener)