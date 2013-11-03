module Main where
import Data.Foldable

countWords :: [(Int, String)] -> [String] -> [(Int, String)]
countWords acc [] = acc
countWords acc s@(w:_) =
  countWords (freq:acc) (filter (/=w) s)
    where freq = (length (filter (==w) s), w)

main :: IO ()
main = do
  ws <- words `fmap` getLine
  
  forM_ (countWords [] ws) $ \(n,w) ->
    putStrLn (w ++ " " ++ (show n))

