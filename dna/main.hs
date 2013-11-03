{- Sample Dataset

AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC

Sample Output

20 12 17 21 -}

module Main where

import Control.Monad (forM_)

main :: IO ()
main = do
	let syms = ['A', 'C', 'G', 'T']

	ls <- getLine

	forM_ syms $ \sym -> do
		putStr (show (length (filter (== sym) ls)))
		putStr " "
