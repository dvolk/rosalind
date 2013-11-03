module Main where


main :: IO ()
main = do
  [n, m] <- (map read . words :: String -> [Int]) `fmap` getLine
  
  print $ sum $ filter odd [n..m]
  
  return ()
