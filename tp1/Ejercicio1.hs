module Ejercicio1 where

-- 1
mapSucesor :: [Int] -> [Int]
mapSucesor [] = []
mapSucesor (x:xs) = (x + 1) : mapSucesor xs

-- 2
filterPositivos :: [Int] -> [Int]
filterPositivos [] = []
filterPositivos (x:xs) = if x > 0 then x : filterPositivos xs else filterPositivos xs

-- 3
esDivisible :: Int -> Int -> Bool
esDivisible x y = mod x y == 0

esDivisiblePorAlguno :: Int -> [Int] -> Bool
esDivisiblePorAlguno _ [] = False
esDivisiblePorAlguno n (x:xs) = esDivisible n x || esDivisiblePorAlguno n xs

esPrimo :: Int -> Bool
esPrimo 1 = False
esPrimo n = not (esDivisiblePorAlguno n [2..n-1])

filterPrimos :: [Int] -> [Int]
filterPrimos [] = []
filterPrimos (x:xs) = if esPrimo x then x : filterPrimos xs else filterPrimos xs

-- 4
zipMaximos1 :: [Int] -> [Int] -> [Int]
zipMaximos1 [] _ = []
zipMaximos1 (x:xs) (y:ys) = max x y : zipMaximos1 xs ys

-- 5
zipMaximos2 :: [Int] -> [Int] -> [Int]
zipMaximos2 [] _ = []
zipMaximos2 _ [] = []
zipMaximos2 (x:xs) (y:ys) = max x y : zipMaximos2 xs ys

-- 6
zipSort :: [Int] -> [Int] -> [(Int, Int)]
zipSort [] _ = []
zipSort (x:xs) (y:ys) = (min x y, max x y) : zipSort xs ys

-- 7
mapLongitudes :: [[a]] -> [Int]
mapLongitudes [] = []
mapLongitudes (x:xs) = length x : mapLongitudes xs

-- 8
longitudMayorA :: [[a]] -> Int -> [[a]]
longitudMayorA [] _ = []
longitudMayorA (x:xs) n = if length x > n then x : longitudMayorA xs n else longitudMayorA xs n

-- 9
mapCuadrados :: [Int] -> [Int]
mapCuadrados [] = []
mapCuadrados (x:xs) = if x > 0 then (x * x) : mapCuadrados xs else mapCuadrados xs

-- 10
sumaPar :: [(Int, Int)] -> [Int]
sumaPar [] = []
sumaPar (x:xs) = (fst x + snd x) : sumaPar xs

-- 11
data Fecha = Fecha Int Int Int deriving (Show, Eq)

data Persona = Persona {
	nombre :: String,
	apellido :: String,
	nacimiento :: Fecha
} deriving (Show, Eq)

esMenor :: Fecha -> Fecha -> Bool
esMenor (Fecha dia1 mes1 anio1) (Fecha dia2 mes2 anio2)
	| anio1 < anio2 = True
	| anio1 == anio2 && mes1 < mes2 = True
	| anio1 == anio2 && mes1 == mes2 && dia1 < dia2 = True
	| otherwise = False

takePersonas :: [Persona] -> Fecha -> [Persona]
takePersonas [] _ = []
takePersonas (p:ps) fecha
	| esMenor (nacimiento p) fecha = p : takePersonas ps fecha
	| otherwise = []

-- 12
data Pizza = Pizza {
	ingredientes :: [String],
	precio :: Int
} deriving (Show, Eq)

dropPrecio :: [Pizza] -> [Pizza]
dropPrecio [] = []
dropPrecio (p:ps)
	| precio p <= 30 = dropPrecio ps
	| otherwise = p : dropPrecio ps

-- 13
map' :: (a -> b) -> [a] -> [b]
map' _ []= []
map' f (x:xs) = f x : map' f xs

takeNombresPersonas :: [Persona] -> Fecha -> [String]
takeNombresPersonas ps fecha = map' (nombre) (takePersonas ps fecha)

-- 14
data Color = Rojo | Verde | Azul deriving (Show, Eq)
type ParColor = (Color, Int)

color :: ParColor -> Color
color x = fst x

sumPar :: ParColor -> ParColor -> ParColor
sumPar (col, cant1) (_, cant2) = (col, cant1 + cant2)

findPar :: Color -> [ParColor] -> ParColor
findPar col [] = (col, 0)
findPar col (p:ps)
	| color p == col = p
	| otherwise = findPar col ps

paresMenos :: Color -> [ParColor] -> [ParColor]
paresMenos col [] = []
paresMenos col (p:ps)
	| color p == col = paresMenos col ps
	| otherwise = p : paresMenos col ps

sumParesColor :: [ParColor] -> [ParColor] -> [ParColor]
sumParesColor [] ys = ys
sumParesColor (x:xs) ys = sumPar x (findPar (color x) ys) : sumParesColor xs (paresMenos (color x) ys)

-- 15
reversa :: [Int] -> [Int]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]

-- 16 
aplanar :: [[Int]] -> [Int]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs