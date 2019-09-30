--Title: Drawing Shapes 
-- Name: Alex De Meo
-- Course : ICS2OR
--This program displays Shapes with their corresponding names

-- remove status bar
display.setStatusBar (display.HiddenStatusBar)

-- Set teh background colour 
display.setDefault ("background", 204/255, 255/255, 255/255)

-------------------------- Triangle -----------------------------

-- Create local triangle variables
local triangle 
local triangleText
local triangleVertices = {0,-50, -50,50, 50,50}
local triangleX = 130 
local triangleY = 100

-- Draw the triangle
triangle = display.newPolygon (triangleX, triangleY, triangleVertices)

-- Make Border
triangle.strokeWidth = 10

-- Set border colour
triangle:setStrokeColor (1, 1, 1)

triangle:setFillColor (0, 0, 0)

-- Write "Triangle" on the screen
triangleText = display.newText ("Triangle", 130, 190, Times, 40)

-- Change the text colour
triangleText:setTextColor (0, 0, 0)
 

-------------------------- Trapezoid ----------------------------

--Create the local "Trapezoid" variables
local trapezoid
local trapezoidText
local trapezoidVertices = {-50,-50, -100,50, 100,50, 50,-50}
local trapezoidX = 130
local trapezoidY = 300

-- Create teh trapezoid
trapezoid = display.newPolygon (trapezoidX, trapezoidY, trapezoidVertices)

--create the border
trapezoid.strokeWidth = 10

--set the border colour
trapezoid:setStrokeColor (0, 0, 0)

-- Write "trapezoid" on-screen
trapezoidText = display.newText ("Trapezoid", 130, 380, Arial, 40 )

-- set the text colour
trapezoidText:setTextColor (1, .9, 0)

-- fill the trapezoid
trapezoid.fill =  {type="image", filename="Images/beachFill.png"}

-------------------------- Pentagon -----------------------------

-- create local "pentagon vars"
local pentagon
local pentagonText 
local pentagonVertices = {50,50, -50,50, -100,-50, -0,-150, 100,-50}
local pentagonX = 130
local pentagonY = 530
local pentagonPaint = {
	type="gradient",
	color1 = {178/255, 102/255, 255/255},
	color2 = {255/255, 102/255, 255/255},
	direction="down"
}
-- draw the pentagon
pentagon = display.newPolygon (pentagonX, pentagonY, pentagonVertices)

--make border
pentagon.strokeWidth = 10

-- make border colour
pentagon:setStrokeColor (0, 0, 0)

-- Make the fill gradient 
pentagon.fill = pentagonPaint

-- write pentagon on-screen
pentagonText = display.newText ("Pentagon", 130, 655, Arial, 40 )

-- Change the text color 
pentagonText:setTextColor (60/255, 112/255, 164/255)
-------------------------- Hexagon ------------------------------

-- create the local "hexagon" variables
local hexagon
local hexagonText
local hexagonX = 440
local hexagonY = 120
local hexagonVertices = {-50,-85, 50,-85, 100,0, 50,90, -50,90, -100,0}

-- draw the hexagon
hexagon = display.newPolygon (hexagonX, hexagonY, hexagonVertices)

-- make the border
hexagon.strokeWidth = 10

-- make the border color
hexagon:setStrokeColor (0, 0, 0)

-- change the color of the hexagon
hexagon:setFillColor (1.00,0.39,0.39)

--display hexagon under the hexagon
hexagonText = display.newText ("Hexagon", 440, 240, Arial, 40)

-- change the text color
hexagonText:setTextColor (1.00, 0.39, 0.39)

-------------------------- Parallelogram --------------------------

-- create local Parallelogram variables
local parallelogram
local parallelogramText
local parallelogramX = 440 
local parallelogramY = 340
local parallelogramVertices = {0,0, 180,0, 90,90, -90,90}

-- draw the parallelogram 
parallelogram = display.newPolygon (parallelogramX, parallelogramY, parallelogramVertices)

--make border
parallelogram.strokeWidth = 10

--change the border color
parallelogram:setStrokeColor (0, 0, 0)

-- display parallelogram under the parallelogram
parallelogramText = display.newText ("Parallelogram", 440, 430, Arial, 40)

-- change the text color
parallelogramText:setTextColor (0.20, 0.09, 0.47)

-- put image inside the parallelogram
parallelogram.fill = {type="image", filename="Images/milky way.png"}

-------------------------- Heptagon -------------------------------
--create local Heptagon variables
local heptagon 
local heptagonText
local heptagonX 
local heptagonY
local heptagonVertices

-------------------------- Octagon --------------------------------
-- create local "Octagon variables"
local octagon
local octagonText
local octagonX 
local octagonY 
local octagonVertices

-------------------------- Nonagon --------------------------------
--create local octagon variables
local nonagon 
local nonagonText
local nonagonX 
local nonagonY
local nonagonVertices

-------------------------- Decagon --------------------------------
--create local Decagon variables
local decagon 
local decagonText
local decagonX 
local decagonY
local decagonVertices