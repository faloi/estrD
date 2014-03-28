module Ejercicio3 where

-- 1
-- precond: length xs >= 1
init' :: [a] -> [a]
init' [x] = []
init' (x:xs) = x : init' xs

-- 2
-- precond: length xs >= 1
last' :: [a] -> a
last' [x] = x
last' (x:xs) = last xs

-- 3
-- precond: que s este en xs
lookUp :: [String] -> String -> Int
lookUp [] _ = undefined