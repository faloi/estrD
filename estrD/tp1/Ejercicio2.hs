module Ejercicio2 where

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

snocAlt :: [Int] -> Int -> [Int]
snocAlt xs i = append xs [i]

digs2Num10 :: [Int] -> Int
digs2Num10 = digs2NumB 10

digs2NumB :: Int -> [Int] -> Int
digs2NumB _ [] = 0
digs2NumB b (x:xs) = b ^ (length xs) * x + digs2NumB b xs