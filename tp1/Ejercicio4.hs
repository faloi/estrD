module Ejercicio4 where

import Ejercicio3

-- 1
mDondeEsta :: [String] -> String -> Int -> Maybe Int
mDondeEsta [] _ _ = Nothing
mDondeEsta (x:xs) s i
	| x == s = Just i
	| otherwise = mDondeEsta xs s (i+1)

mLookUp :: [String] -> String -> Maybe Int
mLookUp xs s = mDondeEsta xs s 1

-- 2
mInit :: [a] -> Maybe [a]
mInit [] = Nothing
mInit xs = Just (init' xs)

-- 3
mLast :: [a] -> Maybe a
mLast [] = Nothing
mLast xs = Just (last' xs)

---- 4
--takeN :: [a] -> Int -> [a]
--takeN _ 0 = []
--takeN [] _ = []
--takeN (x:xs) n = x : takeN xs (n-1)

---- 5
dropExactlyN :: [a] -> Int -> Maybe [a]
dropExactlyN xs 0 = Just xs
dropExactlyN [] _ = Nothing
dropExactlyN (x:xs) n = dropExactlyN xs (n-1)

---- 6
mValorParaClave :: Eq a => [(a, b)] -> a -> Maybe b
mValorParaClave [] _ = Nothing
mValorParaClave (p:ps) x 
	| fst p == x = Just (snd p)
	| otherwise = mValorParaClave ps x

-- 7
mMaximo :: [Int] -> Maybe Int
mMaximo [] = Nothing
mMaximo xs = Just (maximo xs)