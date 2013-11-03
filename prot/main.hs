{-
UUU F      CUU L      AUU I      GUU V
UUC F      CUC L      AUC I      GUC V
UUA L      CUA L      AUA I      GUA V
UUG L      CUG L      AUG M      GUG V
UCU S      CCU P      ACU T      GCU A
UCC S      CCC P      ACC T      GCC A
UCA S      CCA P      ACA T      GCA A
UCG S      CCG P      ACG T      GCG A
UAU Y      CAU H      AAU N      GAU D
UAC Y      CAC H      AAC N      GAC D
UAA Stop   CAA Q      AAA K      GAA E
UAG Stop   CAG Q      AAG K      GAG E
UGU C      CGU R      AGU S      GGU G
UGC C      CGC R      AGC S      GGC G
UGA Stop   CGA R      AGA R      GGA G
UGG W      CGG R      AGG R      GGG G 
-}

module Main where

import Data.Maybe

readPattern :: IO [(String, String)]
readPattern = do
  ws <- (fmap words) (readFile "patt.txt")
  let ws' = map (\w -> if w == "Stop" then [] else w) ws
  let pairUp ps (a:b:xs) =
        if null xs
           then ps
           else pairUp ((a,b):ps) xs
  return $ pairUp [] ws'
  
encodeProt :: [(String, String)] -> [(String, String)] -> String -> [(String, String)]
encodeProt     _ ps             [] = reverse ps
encodeProt table ps rna@(a:b:c:rs) = 
  let r = a:b:[c] in
  if null rna then ps
              else encodeProt table ((r, fromJust (lookup r table)):ps) rs

main :: IO ()
main = do
  rna <- getLine
  table <- readPattern
  let ps = encodeProt (("GGG","G"):table) [] rna
  print (concatMap snd ps)   
   
