module Main where

-- Necessary utility imports
import System.IO
import TestUtils

-- Homework-specific imports
import ...

import ... as Teacher
import Submission as Student

main :: IO ()
main = do
  -- Ensure nothing gets buffered
  hSetBuffering stdout NoBuffering

  -- Create test suite
  let tests =
        [ ]

      -- Score bookkeeping
      maxScore = sum [p | (_, p, _, _) <- tests]
      score = sum [p | (_, p, pass, _) <- tests, pass]

  -- Output results to JSON for Gradescope
  putStrLn (renderJSON score maxScore tests)