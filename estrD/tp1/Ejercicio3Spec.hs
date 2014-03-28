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

  describe "takeN" $ do
    it "dada una lista y un numero n, devuelve los primeros n elementos" $
      takeN [1, 2, 3, 4] 3 `shouldBe` [1, 2, 3]

    it "dada una lista de longitud menor a n y un numero n, devuelve toda la lista" $
      takeN [1, 2, 3] 4 `shouldBe` [1, 2, 3]

  describe "dropN" $ do
    it "dada una lista y un numero n, devuelve una lista sin los primeros n elementos" $
      dropN [1, 2, 3, 4] 3 `shouldBe` [4]

    it "dada una lista de longitud menor a n y un numero n, devuelve una lista vacia" $
      dropN [1, 2, 3] 4 `shouldBe` []

  describe "valorParaClave" $ do
    it "dada una lista de pares clave-valor y una clave, devuelve el valor asociado" $
      valorParaClave [(1, "uno"), (2, "dos")] 2 `shouldBe` "dos"

  describe "maximo" $ do
    it "dada una lista de un elemento, devuelve ese elemento" $
      maximo [2] `shouldBe` 2

    it "dada una lista de 2 o mas numeros, devuelve el mayor" $
      maximo [4, 6, 1] `shouldBe` 6