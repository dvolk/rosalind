module Main where

main :: IO ()
main = do
  ls <- lines `fmap` getContents
  
  putStrLn $ unlines $ map snd $ filter (odd . fst) (zip [(2::Int)..] ls)
  
  return ()
