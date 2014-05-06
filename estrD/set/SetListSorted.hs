module SetListSorted where
import SetInterface

data SetListSorted = SLS [Int] Int deriving (Show)

instance Set SetListSorted where
  empty                 = SLS [] 0
  size (SLS _ n)        = n
  belongs (SLS xs _) y  = elemOrd xs y
  
  add (SLS [] _) y = SLS [y] 1
  add set@(SLS (x:xs) n) y
    | x == y        = set
    | y < x         = SLS (y:x:xs) (n + 1)
    | otherwise     = consSLS x (add (SLS xs (n - 1)) y)
    where consSLS x (SLS xs n) = SLS (x:xs) (n + 1)

setFromList :: [Int] -> SetListSorted
setFromList [] = empty::SetListSorted
setFromList (x:xs) = add (setFromList xs) x

elemOrd :: [Int] -> Int -> Bool
elemOrd [] _ = False
elemOrd (x:xs) y
  | x == y    = True
  | y < x     = False
  | otherwise = elemOrd xs y

