{-Sample Dataset

2 2 2

Sample Output

0.78333-}

module Main where

data GT = D | H | R deriving Show

mate :: (GT, GT) -> Double
mate pair = case pair of
	(D, D) -> 1
	(D, H) -> 1
	(H, D) -> 1
	(H, H) -> 0.75
	(R, R) -> 0
	(H, R) -> 0.5
	(R, H) -> 0.5
	(D, R) -> 1
	(R, D) -> 1

mendel1 :: [Int] -> Double
mendel1 [d, h, r] = 
	let gs = zip [1..]
		(concat [ replicate d D
		        , replicate h H
		        , replicate r R ])
	    ph' = concat (map (\(n1,g1) -> map (\(n2,g2) -> 
                  if n1 == n2 then -1 else mate (g2, g1)) gs) gs)
	    ph  = filter (/=(-1)) ph'
	 in sum ph / (fromIntegral (length ph))

main = getLine >>= print . (mendel1 . map read) . words
