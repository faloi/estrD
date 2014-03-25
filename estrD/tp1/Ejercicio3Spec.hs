module Ejercicio3Spec where

import Test.Hspec
import Ejercicio3
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "init'" $ do
    it "dada una lista, devuelve una copia de esta sin su ultimo elemento" $
      init' [1, 2, 3] `shouldBe` [1, 2]

  describe "last'" $ do
    it "dada una lista, devuelve su ultimo elemento" $
      last' [1, 2, 4] `shouldBe` 4

  describe "lookUp" $ do 
    it "dada una lista de strings y un string s devuelve la posicion de la lista recibida en que se encuentra s" $
      lookUp ["hola", "que", "onda"] "que" `shouldBe` 2