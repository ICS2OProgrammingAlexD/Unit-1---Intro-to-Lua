-- Title: WhackAcoke
-- Name: Alex De Meo
-- Course: ICS2O
-- This program places a coke onscreen. if it gets clicked in time, score increases by one.
display.setStatusBar(display.HiddenStatusBar)

-- create background color
display.setDefault ("background", 29/255, 172/255, 38/255)

-- Create coke
local coke = display.newImage("Images/coke.png", 50, 100)
coke.x = display.contentCenterX
coke.y = display.contentCenterY
coke:scale(0.33, 0.33)
coke.isVisible = false

local points = 0

local bkgMusic = audio.loadStream("Sounds/bkgMusic.mp3")
local bkgMusicChannel

local thumpSound = audio.loadSound("Sounds/thump.mp3")
local thumpSoundChannel

local pointsText = display.newText("Score: " .. points, display.contentWidth/2, display.contentHeight/10, nil, 50)
pointsText:setTextColor(0, 0, 0)

-----------------------------------FUNCTIONS--------------
-- make coke appear at random x/y
function PopUp(  )
	-- choose random positioning for coke
	coke.x = math.random(50, 975)
	coke.y = math.random(100, 718)

	coke.isVisible = true
	timer.performWithDelay(500, Hide)
end

-- Timer for the popup
function PopUpDelay( )
	timer.performWithDelay(3000, PopUp)
end

-- play bkgMusic
function PlayMusic(  )
	bkgMusicChannel = audio.play(bkgMusic, {loops= -1})
end

-- Hides coke
function Hide(  )
	coke.isVisible = false

	PopUpDelay()
end

-- Starts game
function GameStart(  )
	PopUpDelay()
	PlayMusic()
end

-- makes the score go up by 1 if coke gets clicked in time
function Whacked(touch)
	-- if touche phase == started
	if (touch.phase == "began") then
		
		points = points + 1
		pointsText.text = "Score: " .. points
		thumpSoundChannel = audio.play(thumpSound)
		
	end
end

------------------------EVENT LISTENERS-----------------
coke:addEventListener("touch", Whacked)

----------------------START GAME------------------------
GameStart()