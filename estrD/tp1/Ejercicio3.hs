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
dondeEsta :: [String] -> String -> Int -> Int
dondeEsta (x:xs) s i
	| x == s = i
	| otherwise = dondeEsta xs s i+1

lookUp :: [String] -> String -> Int
lookUp xs s = dondeEsta xs s 1

-- 4
takeN :: [a] -> Int -> [a]
takeN _ 0 = []
takeN [] _ = []
takeN (x:xs) n = x : takeN xs (n-1)

-- 5
dropN :: [a] -> Int -> [a]
dropN xs 0 = xs
dropN [] _ = []
dropN (x:xs) n = dropN xs (n-1)

-- 6
-- precond: que la clave este en la lista
valorParaClave :: Eq a => [(a, b)] -> a -> b
valorParaClave (p:ps) x
	| fst p == x = snd p
	| otherwise = valorParaClave ps x

-- 7
-- precond: length ns >= 1
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) = max x (maximo xs)