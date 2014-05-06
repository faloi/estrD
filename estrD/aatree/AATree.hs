module AATree where

-- INVARIANTE:
--
-- Niveles:
-- Las hojas tienen nivel 1
-- Si el hijo izquierdo tiene nivel N, la raiz tiene nivel N + 1
-- Si el hijo izquierdo tiene nivel N, la raiz puede tener nivel N (horizontal link) o N + 1. No puede pasar que 2 hijos derechos consecutivos tengan el mismo nivel
--
-- Los de nivel >= 2 tienen que tener si o si 2 hijos
data AATree a b = Nil | Node Int a b (AATree a b) (AATree a b) deriving (Show, Eq)

-- Devuelve el nivel de la raiz del arbol dado
level :: AATree a b -> Int
level Nil = 0
level (Node n _ _ _ _) = n

nil :: AATree a b -> Bool
nil t = level t == 0

maximumT :: AATree a b -> (a, b)
maximumT (Node _ k v _ rt) = if nil rt then (k, v) else maximumT rt

lookupT :: Ord a => AATree a b -> a -> Maybe b
lookupT Nil x = Nothing
lookupT (Node n k v lt rt) x
  | x < k = lookupT lt x
  | x > k = lookupT rt x
  | otherwise = Just v

insert :: Ord a => AATree a b -> a -> b -> AATree a b
insert Nil x y = Node 1 x y Nil Nil
insert (Node n k v lt rt) x y
  | x < k = fix (Node n k v (insert lt x y) rt)
  | x > k = fix (Node n k v lt (insert rt x y))
  | otherwise = Node n k y lt rt
  where fix t = split (skew t)

skew :: AATree a b -> AATree a b
skew (Node n k v (Node ln lk lv llt lrt) rt)
  | n == ln = Node ln lk lv llt (Node n k v lrt rt)

skew t = t  

split :: AATree a b -> AATree a b
split (Node n k v lt (Node rn rk rv rlt rrt@(Node rrn _ _ _ _)))
  | n == rrn = Node (rn + 1) rk rv (Node n k v lt rlt) rrt

split t = t

remove :: Ord a => AATree a b -> a -> b -> AATree a b
remove Nil x = Nil
remove node@(Node n k v lt rt) x
  | x < k = fix (Node n k v (remove lt x y) rt)
  | x > k = fix (Node n k v lt (remove rt x y))
  | isLeaf node = Nil
  | nil l = let (sk, sv) = minimumT rt in
      fix (Node n sk sv lt (remove rt sk))
  | otherwise = let (pk, pv) = maximumT lt in
      fix (Node n pk pv (remove lt pk) rt)
  where isLeaf (Node _ _ _ lt rt) = nil lt && nil rt
  where fix t = splitn 2 (skewn 3 (decrease t))

decrease :: AATree a b -> AATree a b
decrease (Node n k v lt rt) = let lvl = min (level lt) (level rt) + 1 in
  Node lvl k v lt (case rt of 
        Nil -> Nil
        Node rn rk rv rlt rrt -> Node (min lvl rn) rk rv rlt rrt)

splitn :: Int -> AATree a b -> AATree a b
splitn i t 
  | i == 0 = t
  | otherwise = case split t of 
      Nil -> Nil
      Node n k v lt rt -> Node n k v lt (splitn (i - 1) rt)

skewn :: Int -> AATree a b -> AATree a b
skewn i t 
  | i == 0 = t
  | otherwise = case skew t of 
      Nil -> Nil
      Node n k v lt rt -> Node n k v lt (skewn (i - 1) rt)
