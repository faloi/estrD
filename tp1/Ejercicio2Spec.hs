module Ejercicio2Spec where

import Test.Hspec
import Ejercicio2
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "append" $ do
    it "dadas dos listas devuelve la lista con todos los elementos de la primer lista y todos los elementos de la segunda a continuacion" $
      append [1, 2, 3] [4, 5, 6] `shouldBe` [1, 2, 3, 4, 5, 6]

  describe "snocAlt" $ do
    it "dada una lista de enteros xs y un entero i, devuelve la lista resultante de agregar i al final de xs" $
      snocAlt [4, 6, 8] 9 `shouldBe` [4, 6, 8, 9]

  describe "digs2Num10" $ do
    it "dada una lista de digitos, devuelve el numero que representa en base 10" $
      digs2Num10 [2, 3, 4] `shouldBe` 234
