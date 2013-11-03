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
import Debug.Trace
import Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.Set (Set)
import Data.Sequence (Seq)
import qualified Data.Sequence as Seq
import qualified Data.Set as Set
import FASTA

substrings :: B.ByteString -> [B.ByteString]
substrings = filter (not . B.null) . concatMap B.inits . B.tails

extractCodes :: [FASTA] -> [String]
extractCodes = map (\(FASTA _ c _) -> c)

longestElement :: Set ByteString -> ByteString
longestElement = Set.foldl' (\x y -> if B.length x > B.length y then x else y) B.empty

sortByLength = Seq.unstableSortBy (\x y ->
  if B.length x > B.length y then GT else LT)

main = do
  cs <- (fmap (extractCodes . parseFASTA)) getContents

  let sc = map (Set.fromList . substrings . B.pack) cs
{-      
  let (as,bc) = splitAt (length sc `div` 2) sc
      
  matches <- runEval $ do
-}  

  let matches = foldl1' (Set.intersection) sc

  print (longestElement matches)
  
  -- let as = (sc !! 0) `Set.intersection` (sc !! 1)
      
  -- print $ (\(_ Seq.:> e) -> e) (Seq.viewr (sortByLength (sc !! 0)))
	
  return ()
