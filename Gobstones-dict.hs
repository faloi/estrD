data Color = Rojo | Azul | Verde | Negro deriving (Ord, Eq, Show)
data Dir = Norte | Sur | Este | Oeste deriving (Show)

data Celda = Celda {
	azules :: Int,
	rojas :: Int,
	verdes :: Int,
	negras :: Int
} deriving (Show)

type Fila = [Celda]

celdaVacia :: Celda
celdaVacia = Celda 0 0 0 0

filaVacia :: Int -> Fila
filaVacia 0 = []
filaVacia n = celdaVacia : filaVacia (n-1)

ponerRoja :: Celda -> Celda
ponerRoja (Celda azul roja verde negra) = Celda azul (roja + 1) verde negra

ponerRojaEnCadaUna :: Fila -> Fila
ponerRojaEnCadaUna [] = []
ponerRojaEnCadaUna (c:cs) = ponerRoja c : ponerRojaEnCadaUna cs