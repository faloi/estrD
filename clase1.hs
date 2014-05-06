-- Funciones sobre tuplas
first :: (a, b) -> a
first (x, _) = x

second :: (a, b) -> b
second (_, y) = y

max' :: (Int, Int) -> Int
max' (x, y) = if x > y then x else y

min' :: (Int, Int) -> Int
min' (x, y) = if x < y then x else y

-- Funciones sobre listas
null' :: [a] -> Bool
null' [] = True
null' (_:_) = False

head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' n (_:xs) = drop' (n-1) xs

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' n (x:xs) = x : take' (n-1) xs

split :: Int -> [a] -> ([a], [a])
split n xs = (take' n xs, drop' n xs)

append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : append xs ys

snoc :: [a] -> a -> [a]
snoc xs x = append xs [x]

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = snoc (reverse' xs) x

last' :: [a] -> a
last' xs = (head.drop (length' xs - 1)) xs

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

-- Reescribir head, tail, drop, take, split, last usando Maybe