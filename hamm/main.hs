{-Sample Dataset

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT

Sample Output

7-}

hamming_distance a b = foldr (\(a,b) n -> if a==b then n else n+1) 0 (zip a b)

main = do
	l1 <- getLine
	l2 <- getLine

	print (hamming_distance l1 l2)
