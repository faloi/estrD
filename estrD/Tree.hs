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

-- levels

levelT :: Tree a -> Int -> [a]
levelT _ 0 = []
levelT EmptyT _ = []
levelT (NodeT x t1 t2) n
  | n == 1    = [x] 
  | otherwise = levelT t1 (n-1) ++ levelT t2 (n-1)

getLevels :: Tree a -> Int -> [[a]]
getLevels _ 0 = []
getLevels t n = getLevels t (n - 1) ++ [levelT t n]

levels :: Tree a -> [[a]]
levels t = getLevels t (heightT t)

-- inorder

inorder :: Tree a -> [a]
inorder EmptyT = []
inorder (NodeT e lt rt) = inorder lt ++ [e] ++ inorder rt

-- isBalanced

longitudRamaLarga :: Tree a -> Int
longitudRamaLarga EmptyT = 0
longitudRamaLarga (NodeT _ lt rt) = 1 + max (longitudRamaLarga lt) (longitudRamaLarga rt)

longitudRamaCorta :: Tree a -> Int
longitudRamaCorta EmptyT = 0
longitudRamaCorta (NodeT _ lt rt) = 1 + min (longitudRamaCorta lt) (longitudRamaCorta rt)

isBalanced :: Tree a -> Bool
isBalanced t = longitudRamaLarga t - longitudRamaCorta t <= 1

-- 

zipConcat :: [[a]] -> [[a]] -> [[a]]
zipConcat [] ys = ys
zipConcat xs [] = xs
zipConcat (x:xs) (y:ys) = (x ++ y) : zipConcat xs ys

tree2listPerLevel :: Tree a -> [[a]]
tree2listPerLevel EmptyT = []
tree2listPerLevel (NodeT x t1 t2) = [x] : zipConcat (tree2listPerLevel t1) (tree2listPerLevel t2)
