{-Sample Dataset

>Rosalind_1
GATTACA
>Rosalind_2
TAGACCA
>Rosalind_3
ATACA

Sample Output

AC-}

module Main where

import Data.List
import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.Set (Set)
import qualified Data.Set as Set
import Control.Parallel.Strategies
import Control.DeepSeq

import FASTA

substrings :: B.ByteString -> [B.ByteString]
substrings = filter (not . B.null) . concatMap B.inits . B.tails

extractCodes :: [FASTA] -> [String]
extractCodes = map (\(FASTA _ c _) -> c)

longestElement :: Set ByteString -> ByteString
longestElement = Set.foldl' 
  (\x y -> if B.length x > B.length y then x else y) B.empty

main :: IO ()
main = do
  cs <- (extractCodes . parseFASTA) `fmap` getContents

  let sc = map (Set.fromList . substrings . B.pack) cs
      
      (as,bs) = splitAt (length sc `div` 2) sc
      (a1,a2) = splitAt (length as `div` 2) as
      (a3,a4) = splitAt (length bs `div` 2) bs
      
      matches = runEval $ do
        a1' <- rpar (force (foldl1' Set.intersection) a1)
        a2' <- rpar (force (foldl1' Set.intersection) a2)
        a3' <- rpar (force (foldl1' Set.intersection) a3)
        a4' <- rpar (force (foldl1' Set.intersection) a4)
        rseq a1'
        rseq a2'
        rseq a3'
        rseq a4'
        r1  <- rpar (force (a1' `Set.intersection` a2'))
        r2  <- rpar (force (a3' `Set.intersection` a4'))
        rseq r1
        rseq r2
        return $ r1 `Set.intersection` r2

  print (longestElement matches)
