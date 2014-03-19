sumR :: [Int] -> Int
sumR xs = 
	if null xs
	then 0
	else head xs + sumR (tail xs)