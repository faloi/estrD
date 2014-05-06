data Palo = Diamante | Pique | Trebol | Corazon

data Numero = As | N2 | N3 | N4
            | N5 | N6 | N7 | N8
            | N9 | N10 | J | Q | K

-- Ejercicio 1
mover :: Spider -> Move -> Spider
mover sp Repartir = repartir s
mover sp (MoverNDeA origen destino k) = moverDeA origen destino k sp

jugar :: Spider -> [Move] -> Spider
jugar sp [] = sp
jugar sp (m:ms) = jugar (mover sp m) ms

-- Ejercicio 2
siguientes :: Spider -> [Move] -> [Spider]
siguientes sp [] = [sp]
siguientes sp (m:ms) = mover sp m : siguientes sp ms

leaf x = NodeT x [EmptyT]

arbolSpider :: Int -> Spider -> GenTree Spider
arbolSpider h sp = armarArboles (siguientes (jugadasPosibles sp)) h

armarArboles [] _ = EmptyT
armarArboles _ 0 = EmptyT  
armarArboles [sp:sps] h = NodeT sp (armarArboles (siguientes (jugadasPosibles sp)) (h-1)) : armarArboles sps h
