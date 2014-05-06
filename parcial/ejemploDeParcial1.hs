data BST a = EmptyT | NodeT a (BST a) (BST a)

-- Ejercicio 1
subset :: BST Int -> Int -> Int -> BST Int
subset EmptyT _ _ = EmptyT
subset (NodeT x ti td) min max
    | x < min = subset td min max
    | x > max = subset ti min max
    | otherwise = NodeT x (subset ti min max) (subset td min max)
    
-- Ejercicio 2
data Lista a = L [a] Bool

headL :: Lista a -> a
headL (L xs isReverted) = if isReverted then last xs else head xs

tailL :: Lista a -> Lista a
tailL (L xs isReverted) = 
    let elementos = if isReverted then init xs else tail xs
    in L elementos isReverted

consL :: a -> Lista a -> Lista a
consL x (L xs isReverted) =
    let elementos = if isReverted then xs ++ [x] else x:xs
    in L elementos isReverted

reverseL :: Lista a -> Lista a
reverseL (L xs isReverted) = L xs (not isReverted)

concatL :: Lista a -> Lista a -> Lista a
concatL (L [] _) l2 = l2
concatL l1 l2 = consL (headL l1) (concatL (tailL l1) l2)

-- Ejercicio 3 
type Alumno = (Nombre, Edad, Email)
type ListadoAlumnos = Map String Alumno

nombre (n, _, _) = n
edad (_, e, _) = e


menores20EstrD :: ListadoAlumnos -> [String]
menores20EstrD alumnosTpi dnisAlumnosEstrD = nombres (menores (alumnosEstrD alumnosTpi dnisAlumnosEstrD))

alumnosEstrD :: ListadoAlumnos -> [Alumno] 
alumnosEstrD alumnosTpi dnis 
    | isEmptyS dnis = []
    | otherwise = lookup alumnosTpi (headS dnis) : alumnosEstrD alumnosTpi (tailS ds)

menores :: [Alumno] -> [Alumno]
menores [] = []
menores (a:as) = 
    let resto = menores as 
    in if edad a < 20 then a : resto else resto

nombres :: [Alumno] -> [String]    
nombres [] = []
nombres (a:as) = nombre a : (nombres as)
