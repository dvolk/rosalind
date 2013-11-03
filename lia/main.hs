{-Sample Dataset

2 1

Sample Output

0.684-}

module Main where

main = do
--  [k, n] <- (fmap (map read . words)) getLine
  let k = 2
      n = 1
  
  print (k,n)
  
  return ()
