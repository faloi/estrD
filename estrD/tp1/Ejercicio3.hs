module Ejercicio3 where

-- precond: length xs >= 1
init' :: [a] -> [a]
init' [x] = []
init' (x:xs) = x : init' xs

-- precond: length xs >= 1
last' :: [a] -> a
last' [x] = x
last' (x:xs) = last xs

-- precond: que s este en xs
lookUp :: [String] -> String -> Int
lookUp [] _ = undefined