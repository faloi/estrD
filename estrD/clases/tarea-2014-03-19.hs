-- Implementar las funciones minimum y flatten

minimum' :: [Int] -> Int
minimum' [x] = x
minimum' (x:xs) = min x (minimum xs)

flatten :: [[a]] -> [a]
flatten [] = []
flatten (x:xs) = x ++ flatten xs

-- Volver a implementar head, tail, drop, take y last utilizando Maybe para manejar los errores

headM :: [a] -> Maybe a
headM [] = Nothing
headM (x:_) = Just x

tailM :: [a] -> Maybe [a]
tailM [] = Nothing
tailM (_:xs) = Just xs

dropM :: Int -> [a] -> Maybe [a]
dropM 0 xs = Just xs
dropM n (_:xs) = dropM (n-1) xs
dropM _ [] = Nothing

consM :: a -> Maybe [a] -> Maybe [a]
consM x Nothing = Nothing
consM x (Just xs) = Just (x:xs)

takeM :: Int -> [a] -> Maybe [a]
takeM 0 _ = Just []
takeM n (x:xs) = consM x (takeM (n-1) xs)
takeM _ [] = Nothing

lastM :: [a] -> Maybe a
lastM [] = Nothing
lastM [x] = Just x
lastM (_:xs) = lastM xs