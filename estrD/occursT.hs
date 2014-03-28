data Tree a = EmptyT | NodeT a (Tree a) (Tree a)

occursT :: Eq a => a -> Tree a -> Bool
occursT x EmptyT = False
occursT x (NodeT r ti td)
	| x == r 	= True
	| otherwise	= occursT x ti || occursT x td