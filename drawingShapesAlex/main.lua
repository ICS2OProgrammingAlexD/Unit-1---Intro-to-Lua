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
trapezoidText:setTextColor (1, 0, 0)

-- fill the trapezoid
trapezoid.fill =  {type="image", filename="Images/beachFill.png"}

-------------------------- Pentagon -----------------------------

-------------------------- Hexagon ------------------------------
