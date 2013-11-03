module Main (main) where

nextgen :: [Int] -> [Int]
nextgen gs = sum (tail gs) : (init gs)

main :: IO ()
main = do
  [m,n] <- (fmap (map read . words)) getLine
  let gs = iterate nextgen (1:(replicate (n-1) 0))
  print $ sum $ last $ take m gs
