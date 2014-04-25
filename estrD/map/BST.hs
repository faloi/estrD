module BST where

data BST a = EmptyT | NodeT a (BST a) (BST a) deriving (Show, Eq)

leaf :: a -> BST a
leaf x = NodeT x EmptyT EmptyT

list2bst :: Ord k => [(k, v)] => BST (k, v)
list2bst [] = EmptyT
list2bst (x:xs) = list2bst xs `addT` x

addT :: Ord k => BST (k, v) -> (k, v) -> BST (k, v)
addT EmptyT x = leaf x
addT tree@(NodeT root@(k, _) ls rs) x@(xk, _)
  | xk == k   = tree
  | xk < k    = NodeT root (addT ls x) rs
  | otherwise = NodeT root ls (addT rs x)

lookupT :: (Ord k, Eq k) => BST (k, v) -> k -> Maybe v
lookupT EmptyT _ = Nothing
lookupT (NodeT (k, v) ls rs) x
  | x == k  = Just v
  | x < k   = lookupT ls x
  | x > k   = lookupT rs x
