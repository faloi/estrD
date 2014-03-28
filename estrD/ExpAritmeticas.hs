module ExpAritmeticas where

data ExpA = Suma ExpA ExpA | Mult ExpA ExpA | Nro Int deriving (Eq)

isOperacion :: ExpA -> Bool
isOperacion (Nro _) = False
isOperacion e = True

showOperando :: ExpA -> String
showOperando e
  | isOperacion e = "(" ++ show e ++ ")"
  | otherwise   = show e

showOperacion :: ExpA -> ExpA -> String -> String
showOperacion e1 e2 operador = showOperando e1 ++ " " ++ operador ++ " " ++ showOperando e2

instance Show ExpA where
  show (Suma e1 e2) = showOperacion e1 e2 "+"
  show (Mult e1 e2) = showOperacion e1 e2 "*"
  show (Nro n) = show n

simplificarSuma :: ExpA -> ExpA
simplificarSuma (Suma e (Nro 0)) = e
simplificarSuma (Suma (Nro 0) e) = e
simplificarSuma e = e

simplificar :: ExpA -> ExpA
simplificar (Nro n) = Nro n
simplificar (Mult e1 e2) = Mult (simplificar e1) (simplificar e2)
simplificar (Suma e1 e2) = simplificarSuma (Suma (simplificar e1) (simplificar e2))
