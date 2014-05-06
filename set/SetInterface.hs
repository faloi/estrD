module SetInterface where

class Set s where
  empty :: s
  size :: s -> Int
  belongs :: s -> Int -> Bool  
  add :: s -> Int -> s
