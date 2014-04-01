module Tree where

data Tree a = EmptyT | NodeT a (Tree a) (Tree a)

occursT :: Eq a => a -> Tree a -> Bool
occursT x EmptyT = False
occursT x (NodeT r ti td)
	| x == r 	= True
	| otherwise	= occursT x ti || occursT x td

leaf :: a -> Tree a
leaf x = NodeT x EmptyT EmptyT

isLeaf :: Tree a -> Bool
isLeaf (NodeT _ EmptyT EmptyT) = True
isLeaf _ = False

countLeaves :: Tree a -> Int
countLeaves EmptyT = 0
countLeaves (NodeT _ EmptyT EmptyT) = 1
countLeaves (NodeT _ ti td) = countLeaves ti + countLeaves td

heightT :: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT _ ti td) = 1 + max (heightT ti) (heightT td)

minT :: Tree Int -> Int
minT EmptyT = error "No tiene"
minT (NodeT x EmptyT EmptyT) = x
minT (NodeT x t1 EmptyT) = min x (minT t1)
minT (NodeT x EmptyT t2) = min x (minT t2)
minT (NodeT x t1 t2) = min x (min (minT t1) (minT t2))

tree2list :: Tree a -> [a]
tree2list EmptyT = []
tree2list (NodeT x t1 t2) = x : tree2list t1 ++ tree2list t2

levelT :: Tree a -> Int -> [a]
levelT _ 0 = []
levelT EmptyT _ = []
levelT (NodeT x t1 t2) n
  | n == 1    = [x] 
  | otherwise = levelT t1 (n-1) ++ levelT t2 (n-1)

levels :: Tree a -> [[a]]
levels EmptyT = [[]]
levels t = map (levelT t) [1..heightT t]
