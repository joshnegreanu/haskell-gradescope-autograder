module Main where

-- Necessary utility imports
import System.IO
import TestUtils

-- Homework-specific imports
import ICA3Types

import ICA3Shapes as Teacher
import Submission as Student

main :: IO ()
main = do
  -- Ensure nothing gets buffered
  hSetBuffering stdout NoBuffering

  -- Create test suite
  let tests =
        [ ("map minX f", 2, map Student.minX f == map Teacher.minX f, show (map Student.minX f))
        , ("map area f", 2, map Student.area f == map Teacher.area f, show (map Student.area f))
        , ("map (\\x -> move x (2,2)) f", 2, map (\x->Student.move x (2,2)) f == map (\x->Teacher.move x (2,2)) f, show (map (\x->Student.move x (2,2)) f))
        , ("map bbox f", 2, map Student.bbox f == map Teacher.bbox f, show (map Student.bbox f))
        , ("minX c2", 2, Student.minX c2 == Teacher.minX c2, show (Student.minX c2))
        , ("move c2 (-1,3)", 2, Student.move c2 (-1,3) == Teacher.move c2 (-1,3), show (Student.move c2 (-1,3)))
        ]

      -- Score bookkeeping
      maxScore = sum [p | (_, p, _, _) <- tests]
      score = sum [p | (_, p, pass, _) <- tests, pass]

  -- Output results to JSON for Gradescope
  putStrLn (renderJSON score maxScore tests)