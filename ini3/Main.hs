module Main where

{-Sample Dataset

HumptyDumptysatonawallHumptyDumptyhadagreatfallAlltheKingshorsesandalltheKingsmenCouldntputHumptyDumptyinhisplaceagain.
22 27 97 102

Sample Output

Humpty Dumpty
-}

dropTake :: Int -> Int -> String -> String
dropTake n m = take (m - n + 1) . drop n

main :: IO ()
main = do
  line <- getLine
  [n1, m1, n2, m2] <- (map read . words :: String -> [Int]) `fmap` getLine
  
  putStrLn (dropTake n1 m1 line)
  putStrLn (dropTake n2 m2 line)
  
  return ()
