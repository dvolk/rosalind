{-Sample Dataset

GATATATGCATATACTT
ATAT

Sample Output

2 4 10 -}

module Main where

import Data.List

findindexes l s i acc =
	if length (drop i l) > length s
	 then if s `isPrefixOf` (drop i l)
	  then findindexes l s (i+1) (i+1:acc)
	  else findindexes l s (i+1)      acc
         else reverse acc

main = do
	l <- getLine
	s <- getLine

	print (findindexes l s 0 [])	

	return ()
