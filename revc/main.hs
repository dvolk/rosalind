{- Sample Dataset

AAAACCCGGT

Sample Output

ACCGGGTTTT -}

module Main where

complement c = case c of
	'A' -> 'T'
	'T' -> 'A'
	'C' -> 'G'
	'G' -> 'C'

main = do
	ls <- getLine

	putStrLn ((map complement . reverse) ls)
