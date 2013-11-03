{-Sample Dataset

>Rosalind_0498
AAATAAA
>Rosalind_2391
AAATTTT
>Rosalind_2323
TTTTCCC
>Rosalind_0442
AAATCCC
>Rosalind_5013
GGGTGGG

Sample Output

Rosalind_0498 Rosalind_2391
Rosalind_0498 Rosalind_0442
Rosalind_2391 Rosalind_2323-}

module Main where

import Control.Monad
import FASTA

isAdjacent :: Int -> FASTA -> FASTA -> Bool
isAdjacent k (FASTA _ s1 _) (FASTA _ s2 _) =
  let s1k = drop (length s1 - k) s1
      s2k = take k s2
  in s1k == s2k

name :: FASTA -> String
name (FASTA n _ _ ) = n

main :: IO ()
main = do 
  gs <- (fmap parseFASTA) getContents
  
  forM_ gs $ \g1 -> do
    forM_ gs $ \g2 -> do
    if isAdjacent 3 g1 g2 && g1 /= g2
      then putStrLn $ (name g1) ++ " " ++ (name g2)
      else return ()

  return ()
