module Ejercicio1 where

mapSucesor :: [Int] -> [Int]
mapSucesor [] = []
mapSucesor (x:xs) = (x + 1) : mapSucesor xs

filterPositivos :: [Int] -> [Int]
filterPositivos [] = []
filterPositivos (x:xs) = if x > 0 then x : filterPositivos xs else filterPositivos xs

esPrimo :: Int -> Bool
esPrimo = undefined

filterPrimos :: [Int] -> [Int]
filterPrimos [] = []
filterPrimos (x:xs) = if esPrimo x then x : filterPrimos xs else filterPrimos xs

zipMaximos1 :: [Int] -> [Int] -> [Int]
zipMaximos1 [] _ = []
zipMaximos1 (x:xs) (y:ys) = max x y : zipMaximos1 xs ys

zipMaximos2 :: [Int] -> [Int] -> [Int]
zipMaximos2 [] _ = []
zipMaximos2 _ [] = []
zipMaximos2 (x:xs) (y:ys) = max x y : zipMaximos2 xs ys

zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort [] _ = []
zipSort (x:xs) (y:ys) = (min x y, max x y) : zipSort xs ys

mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = length x : mapLongitudes xs

longitudMayorA :: [[a]] -> Int -> [[a]]
longitudMayorA [] _ = []
longitudMayorA (x:xs) n = if length x > n then x : longitudMayorA xs n else longitudMayorA xs n

mapCuadrados :: [Int] -> [Int]
mapCuadrados [] = []
mapCuadrados (x:xs) = if x > 0 then (x * x) : mapCuadrados xs else mapCuadrados xs

sumaPar :: [(Int, Int)] -> [Int]
sumaPar [] = []
sumaPar (x:xs) = (fst x + snd x) : sumaPar xs