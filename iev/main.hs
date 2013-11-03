{-
Sample Dataset

1 0 0 1 0 1

Sample Output

3.5
-}

module Main where

main :: IO ()
main = do
  pops <- (fmap (map read . words)) getLine
  let probs = [1.0, 1.0, 1.0, 0.75, 0.5, 0 :: Double]

  print (sum (zipWith (\n p -> fromIntegral n * 2 * p) pops probs))

