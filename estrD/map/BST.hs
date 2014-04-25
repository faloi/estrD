module BST where

data BST a = EmptyT | NodeT a (BST a) (BST a) deriving (Show, Eq)

leaf :: a -> BST a
leaf x = NodeT x EmptyT EmptyT

list2bst :: Ord k => [(k, v)] => BST (k, v)
list2bst [] = EmptyT
list2bst (x:xs) = list2bst xs `agregar` x

agregar :: Ord k => BST (k, v) -> (k, v) -> BST (k, v)
agregar EmptyT x = leaf x
agregar (NodeT root@(k, _) ls rs) x@(xk, xv)
  | xk <= k = NodeT root (agregar ls x) rs
  | otherwise = NodeT root ls (agregar rs x)

lookupT :: (Ord k, Eq k) => BST (k, v) -> k -> Maybe v
lookupT EmptyT _ = Nothing
lookupT (NodeT (k, v) ls rs) x
  | x == k  = Just v
  | x < k   = lookupT ls x
  | x > k   = lookupT rs x
