module ExpAritmeticasSpec where

import ExpAritmeticas
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "simplificar" $ do
    it "un numero, devuelve el mismo numero" $
      simplificar (Nro 2) `shouldBe` Nro 2

    it "una suma de un numero y 0, devuelve el numero" $
      simplificar (suma (Nro 2) (Nro 0)) `shouldBe` Nro 2

    it "una suma de 0 y un numero, devuelve el numero" $
      simplificar (suma (Nro 0) (Nro 2)) `shouldBe` Nro 2

    it "una suma de 0 y una expresion, devuelve la expresion" $
      simplificar (suma (Nro 0) (mult (Nro 3) (Nro 2))) `shouldBe` mult (Nro 3) (Nro 2)

    it "una multiplicacion con una suma de 0 adentro, devuelve la multiplicacion sin la suma" $
      simplificar (mult (suma (Nro 0) (Nro 5)) (Nro 2)) `shouldBe` mult (Nro 5) (Nro 2)

    it "una suma de 2 numeros distintos de 0, devuelve la misma suma" $
      simplificar (suma (Nro 3) (Nro 2)) `shouldBe` (suma (Nro 3) (Nro 2))

    it "una expresion compleja con sumas de 0 adentro, devuelve la expresion sin las sumas de 0" $
      simplificar (mult (suma (Nro 0) (Nro 2)) (suma (Nro 3) (suma (Nro 0) (Nro 0)))) `shouldBe` mult (Nro 2) (Nro 3)

    it "una multiplicacion donde uno de los factores es 1, devuelve la otra expresion" $
      simplificar (mult (Nro 1) (suma (Nro 3) (Nro 2))) `shouldBe` suma (Nro 3) (Nro 2)
