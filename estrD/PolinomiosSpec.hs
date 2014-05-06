module PolinomiosSpec where

import Polinomios  
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "show" $ do
    it "de Var, devuelve x" $
      show Var `shouldBe` "x"

    it "de una Cte, devuelve la constante" $
      show (Cte 4) `shouldBe` "4"

    it "de un Add, devuelve la suma de los polinomios" $
      show (Add Var Var) `shouldBe` "x + x"

    it "de una Mul, devuelve el producto de los polinomios" $
      show (Mul (Cte 2) (Cte 3)) `shouldBe` "2 * 3"

    it "de una Mul de dos Var, devuelve x^2" $
      show (Mul Var Var) `shouldBe` "x^2"

    it "de una Mul de una Cte y una Var, devuelve la constante seguida de x" $
      show (Mul (Cte 3) Var) `shouldBe` "3x"

    it "de una Mul de una Var y una Cte, devuelve la constante seguida de x" $
      show (Mul Var (Cte 3)) `shouldBe` "3x"

    it "de una Mul de Cte con Var^2, devuelve {Cte}x^2" $
      show (Mul (Cte 3) (Mul Var Var)) `shouldBe` "3x^2"

  describe "distribute" $ do
    it "dado un producto, distribuye la multiplicacion" $
      distribute (Mul (Cte 3) (Add (Cte 2) (Cte 4))) `shouldBe` Add (Mul (Cte 3) (Cte 2)) (Mul (Cte 3) (Cte 4))
