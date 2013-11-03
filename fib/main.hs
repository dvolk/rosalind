{-Sample Dataset

5 3

Sample Output

19-}

module Main where

fibg 1 _ = 1
fibg 2 _ = 1
fibg n k = fibg (n - 1) k + (k * fibg (n - 2) k)

main = do 
	[n,k] <- (fmap (map read . words)) getLine
	print (fibg n k)
