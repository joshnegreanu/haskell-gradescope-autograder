module Submission where
import ICA3Types
-- 
-- (1) Define the function minX that computes the minimum x coordinate of a shape 
--

minX :: Shape -> Number
minX (Line (x1, y1) (x2, y2)) = min x1 x2
minX (Circle (x, y) r) = x - r
minX (Rect (x, y) w h) = x

-- (2) Define the function area that computes the area of a Shape.
--  Note: the area of a line is 0.  You will need the function fromIntegral to convert
--  from integer to float

area :: Shape -> Float
area (Line (x1, y1) (x2, y2)) = 1.0
area (Circle (x, y) r) = pi * (fromIntegral r)^2
area (Rect (x, y) w h) = fromIntegral w * fromIntegral h

-- (3) Define the function move that moves a shape by a vector given
-- by a point as its second argument
--

move :: Shape -> Point -> Shape
move (Line (x1, y1) (x2, y2)) (dx, dy) = Line (x1+dx, y1+dy) (x2+dx, y2+dy)
move (Circle (x, y) r) (dx, dy) = Circle (x+dx, y+dy) r
move (Rect (x, y) w h) (dx, dy) = Rect (x+dx, y+dy) w h

-- (4) Define the function bbox that computes the bounding box of a shape.
-- The bounding box is given by the lower left and upper right coordinates
-- of the box
--
bbox :: Shape -> Box
bbox (Line (x1, y1) (x2, y2)) = ((min x1 x2, min y1 y2), (max x1 x2, max y1 y2))
bbox (Circle (x, y) r) = ((x-r, y-r), (x+r, y+r))
bbox (Rect (x, y) w h) = ((x, y), (x+w, y+h))