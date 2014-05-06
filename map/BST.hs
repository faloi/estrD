module BST where

data BST a = EmptyT | NodeT a (BST a) (BST a) deriving (Show, Eq)

-- Construccion
leaf :: a -> BST a
leaf x = NodeT x EmptyT EmptyT

list2bst :: Ord k => [(k, v)] => BST (k, v)
list2bst [] = EmptyT
list2bst (x:xs) = list2bst xs `addT` x

-- Acceso y manipulacion
lookupT :: (Ord k, Eq k) => BST (k, v) -> k -> Maybe v
lookupT EmptyT _ = Nothing
lookupT (NodeT (k, v) ls rs) x
  | x == k  = Just v
  | x < k   = lookupT ls x
  | x > k   = lookupT rs x

addT :: Ord k => BST (k, v) -> (k, v) -> BST (k, v)
addT EmptyT x = leaf x
addT tree@(NodeT root@(k, _) ls rs) x@(k', _)
  | k' == k   = tree
  | k' < k    = NodeT root (addT ls x) rs
  | otherwise = NodeT root ls (addT rs x)

removeT :: Ord k => BST (k, v) -> k -> BST (k, v)
removeT EmptyT _ = EmptyT
removeT tree@(NodeT root@(k, _) ls rs) k'
  | k == k' = let (maximo, treeSinMaximo) = splitMax ls in NodeT maximo treeSinMaximo rs
  | k' < k  = NodeT root (removeT ls k') rs
  | k' < k  = NodeT root ls (removeT ls k')

domainT :: BST (k, v) -> [k]
domainT EmptyT = []
domainT (NodeT x ls rs) = fst x : domainT ls ++ domainT rs
