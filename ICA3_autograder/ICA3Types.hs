module ICA3Types where

type Number = Int
type Point = (Number, Number)

-- a line segment is represented by the end points
-- a circle is represented by the center point and radius
-- a rectangle is represented by the bottom left point, width and length
--        ********
--        w      *   width=4 length=8 p=(x,y)
--        *      *
--        p**l****

data Shape = Line Point Point
   | Circle Point Number
   | Rect Point Number Number
     deriving Show

instance Eq Shape where
    (Line p1 p2) == (Line q1 q2) = (p1 == q1 && p2 == q2) || (p1 == q2 && p2 == q1)
    (Circle center1 radius1) == (Circle center2 radius2) = center1 == center2 && radius1 == radius2
    (Rect p1 w1 l1) == (Rect p2 w2 l2) = p1 == p2 && w1 == w2 && l1 == l2
    _ == _ = False

type Figure = [Shape]
type Box = (Point, Point)

c1 :: Shape
c1 = Circle (1,1) 10
l1 :: Shape
l1 = Line (1,2) (1,4)
r1 :: Shape
r1 = Rect (3,3) 5 10
f :: Figure
f = [Line (2,10) (5,1), Line (5,-1) (3,4), Circle (0,0) 3, Circle (1,2) 1, Rect (1,1) 2 10, Rect (-2,1) 3 4]

c2 :: Shape
c2 = Circle (2,3) 5
l2 :: Shape
l2 = Line (-1,9) (-1,0)
r2 :: Shape
r2 = Rect (1,1) 7 2