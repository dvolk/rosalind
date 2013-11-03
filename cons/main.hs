{- Sample Dataset

>Rosalind_1
ATCCAGCT
>Rosalind_2
GGGCAACT
>Rosalind_3
ATGGATCT
>Rosalind_4
AAGCAACC
>Rosalind_5
TTGGAACT
>Rosalind_6
ATGCCATT
>Rosalind_7
ATGGCACT

Sample Output

ATGCAACT
A: 5 1 0 0 5 5 0 0
C: 0 0 1 4 2 0 6 1
G: 1 1 6 3 0 1 0 0
T: 1 5 0 0 0 1 1 6 -}

module Main where

import Control.Monad
import Data.List
import Data.Ord
import FASTA

extractCodes = map (\(FASTA _ c _) -> c) . parseFASTA

nthcol n = map (\s -> s !! n)

countSymb c = length . filter (==c)

mostCommonSym ss = foldl1 (\a b -> if length a > length b then a else b) 
                    ((group . sort) ss)

main = do
	cs <- (fmap (reverse . extractCodes)) getContents
	let code_length = length (cs !! 0)

	let mostCommonSyms = map (\col ->
		((head . mostCommonSym . nthcol col) cs)) [0..code_length-1]

	putStrLn mostCommonSyms

	let syms = ["ACGT"]
	forM_ syms $ \sym -> do
		putStr (sym : ": ")
		forM_ [0..code_length-1] $ \n -> do
			putStr ((show (countSymb sym (nthcol n cs))) ++ " ")
		putStr "\n"

	return ()
