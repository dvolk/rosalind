{- Sample Dataset

GATGGAACTTGACTACGTAAATT

Sample Output

GAUGGAACUUGACUACGUAAAUU -}

module Main where

main = do
{-	ls <- getLine

	putStrLn (map (\c -> if c == 'T' then 'U' else c) ls)
-}
	getLine >>= putStrLn . map (\c -> if c == 'T' then 'U' else c)
