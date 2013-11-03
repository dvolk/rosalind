{-Sample Dataset

>Rosalind_6404
CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC
TCCCACTAATAATTCTGAGG
>Rosalind_5959
CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT
ATATCCATTTGTCAGCAGACACGC
>Rosalind_0808
CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC
TGGGAACCTGCGGGCAGTAGGTGGAAT

Sample Output

Rosalind_0808
60.919540 -}

module Main where

import Data.List
import Data.Ord
import FASTA

compare_cg :: FASTA -> FASTA -> Ordering
compare_cg = comparing cg
	where cg (FASTA _ _ x) = x

main = do
	fs <- (fmap parseFASTA) getContents
	let (FASTA m_name _ m_cg) = (maximumBy compare_cg) fs

	putStrLn m_name
	print (m_cg * 100)
