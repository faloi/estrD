module ExpAritmeticasSpec where

import ExpAritmeticas
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "simplificar" $ do
    it "un numero, devuelve el mismo numero" $
      simplificar (Nro 2) `shouldBe` Nro 2

    it "una suma de un numero y 0, devuelve el numero" $
      simplificar (Suma (Nro 2) (Nro 0)) `shouldBe` Nro 2

    it "una suma de 0 y un numero, devuelve el numero" $
      simplificar (Suma (Nro 0) (Nro 2)) `shouldBe` Nro 2

    it "una suma de 0 y una expresion, devuelve la expresion" $
      simplificar (Suma (Nro 0) (Mult (Nro 3) (Nro 2))) `shouldBe` Mult (Nro 3) (Nro 2)

    it "una multiplicacion con una suma de 0 adentro, devuelve la multiplicacion sin la suma" $
      simplificar (Mult (Suma (Nro 0) (Nro 5)) (Nro 2)) `shouldBe` Mult (Nro 5) (Nro 2)

    it "una suma de 2 numeros distintos de 0, devuelve la misma suma" $
      simplificar (Suma (Nro 3) (Nro 2)) `shouldBe` (Suma (Nro 3) (Nro 2))

    it "una expresion compleja con sumas de 0 adentro, devuelve la expresion sin las sumas de 0" $
      simplificar (Mult (Suma (Nro 0) (Nro 2)) (Suma (Nro 3) (Suma (Nro 0) (Nro 0)))) `shouldBe` Mult (Nro 2) (Nro 3)