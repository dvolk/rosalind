module FASTA where

import Data.List
import Data.Ord

data FASTA = FASTA String String Double deriving Show

parseFASTA :: String -> [FASTA]
parseFASTA = parseFASTA' []

parseFASTA' :: [FASTA] -> String -> [FASTA]
parseFASTA' acc [] = acc
parseFASTA' acc  l =
        let (a, b) = break (== '\n') l
            (c, d) = break (== '>') b
            name   = tail a
            code   = filter (/='\n') c
            f_code = filter (`elem` "GC") code
            gc_c   = fromIntegral (length f_code) / fromIntegral (length code)
         in parseFASTA' (FASTA name code gc_c : acc) d

