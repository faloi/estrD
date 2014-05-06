module Polinomios where

data Poli = Cte Int | Var | Add Poli Poli | Mul Poli Poli deriving (Eq)

instance Show Poli where
  show (Cte k)                      = show k
  show Var                          = "x"
  show (Add p q)                    = show p ++ " + " ++ show q
  
  show (Mul k1@(Cte _) k2@(Cte _))  = show k1 ++ " * " ++ show k2
  show (Mul Var Var)                = show Var ++ "^2"
  
  show (Mul (Cte k) p)              = show k ++ show p
  show (Mul Var (Cte k))            = show (Mul (Cte k) Var)
  
  show (Mul p q)                    = show p ++ " * " ++ show q

eval :: Poli -> Int -> Int
eval (Cte k) _    = k
eval Var n        = n
eval (Add p q) n  = eval p n + eval q n
eval (Mul p q) n  = eval p n * eval q n

add :: Poli -> Poli -> Poli
add p q = Add p q

adds :: Poli -> Int
adds (Add p q)  = 1 + adds p + adds q
adds (Mul p q) = adds p + adds q
adds _ = 0

distribute :: Poli -> Poli
distribute (Add p q)  = Add (distribute p) (distribute q)
distribute (Mul p q)  = distributeMul p q
distribute p          = p

distributeMul :: Poli -> Poli -> Poli
distributeMul p (Add q r)     = Add (distribute (Mul p q)) (distribute (Mul p r))
distributeMul p@(Add _ _) q   = distributeMul q p
distributeMul p q
  | adds p == 0 && adds q == 0  = Mul p q
  | otherwise                   = distribute (Mul (distribute p) (distribute q))
