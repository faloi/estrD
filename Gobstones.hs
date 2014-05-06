import qualified Data.Map as Map

data Color = Rojo | Azul | Verde | Negro deriving (Ord, Eq, Show)

type Celda = Map.Map Color Int
type Fila = [Celda]

celdaVacia :: Celda
celdaVacia = Map.fromList [(Azul, 0), (Rojo, 0), (Verde, 0), (Negro, 0)]

poner :: Celda -> Color -> Celda
poner celda color = Map.insert color 1 celda

filaVacia :: Int -> Fila
filaVacia 0 = []
filaVacia n = celdaVacia : filaVacia (n-1)

ponerRoja :: Celda -> Celda
ponerRoja celda = poner celda Rojo

ponerRojaEnCadaUna :: Fila -> Fila
ponerRojaEnCadaUna [] = []
ponerRojaEnCadaUna (c:cs) = ponerRoja c : ponerRojaEnCadaUna cs