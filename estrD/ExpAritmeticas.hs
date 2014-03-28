module ExpAritmeticas where

data Operador = Mas | Por deriving (Eq)
data ExpA = OperacionBinaria Operador ExpA ExpA | Nro Int deriving (Eq)

suma = OperacionBinaria Mas
mult = OperacionBinaria Por

isOperacion :: ExpA -> Bool
isOperacion (OperacionBinaria _ _ _) = True
isOperacion _ = False

showOperando :: ExpA -> String
showOperando e
  | isOperacion e = "(" ++ show e ++ ")"
  | otherwise   = show e

showOperacion :: ExpA -> ExpA -> String -> String
showOperacion e1 e2 operador = showOperando e1 ++ " " ++ operador ++ " " ++ showOperando e2

showOperador :: Operador -> String
showOperador Mas = "+"
showOperador Por = "*"

instance Show ExpA where
  show (OperacionBinaria op e1 e2) = showOperacion e1 e2 (showOperador op)
  show (Nro n) = show n

simplificarOpBinaria :: Operador -> ExpA -> ExpA -> ExpA
simplificarOpBinaria Mas e (Nro 0) = e
simplificarOpBinaria Mas (Nro 0) e = e

simplificarOpBinaria Por e (Nro 1) = e
simplificarOpBinaria Por (Nro 1) e = e

simplificarOpBinaria operador e1 e2 = OperacionBinaria operador e1 e2

simplificar :: ExpA -> ExpA
simplificar (OperacionBinaria operador e1 e2) = simplificarOpBinaria operador (simplificar e1) (simplificar e2)
simplificar e = e
