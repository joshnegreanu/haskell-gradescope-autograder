module TestUtils where

-- Data structure to represent a test case
type Test = (String, Int, Bool, String)

-- Function to render the test results in JSON format
renderJSON :: Int -> Int -> [Test] -> String
renderJSON score maxScore ts =
  "{\n"
  ++ "  \"score\": " ++ show score ++ ",\n"
  ++ "  \"max_score\": " ++ show maxScore ++ ",\n"
  ++ "  \"tests\": [\n"
  ++ renderTests ts
  ++ "  ]\n"
  ++ "}"

-- Helper function to render individual tests
renderTests :: [Test] -> String
renderTests ts =
  concat $
    zipWith3 renderTest ts [1 :: Int ..] (replicate (length ts) (length ts))

-- Function to render a single test case
renderTest :: Test -> Int -> Int -> String
renderTest (name, pts, pass, output) i n =
  "    {\n"
  ++ "      \"name\": " ++ show name ++ ",\n"
  ++ "      \"score\": " ++ show (if pass then pts else 0) ++ ",\n"
  ++ "      \"max_score\": " ++ show pts ++ ",\n"
  ++ "      \"output\": " ++ show output ++ "\n"
  ++ "    }"
  ++ if i < n then ",\n" else "\n"