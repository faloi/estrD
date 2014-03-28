module Ejercicio4Spec where

import Data.Maybe
import Test.Hspec
import Ejercicio4
import Control.Exception (evaluate)

shouldBeJust mValue value = evaluate (mValue) `shouldReturn` Just value
shouldBeNothing mValue = isNothing (mValue) `shouldBe` True

main :: IO ()
main = hspec $ do
  describe "mLookUp" $ do 
    it "dada una lista de strings y un string s devuelve la posicion de la lista recibida en que se encuentra s" $
      mLookUp ["hola", "que", "onda"] "que" `shouldBeJust` 2

    it "dada una lista de strings y un string s que no se encuentra en la lista, devuelve Nothing" $
      shouldBeNothing $ mLookUp ["hola", "que", "onda"] "juan"

  describe "mInit" $ do
    it "dada una lista no vacia, devuelve una copia de esta sin su ultimo elemento" $
      mInit [1, 2, 3] `shouldBeJust` [1, 2]

    it "dada una lista vacia, devuelve Nothing" $
      shouldBeNothing $ mInit []

  describe "mLast" $ do
    it "dada una lista, devuelve su ultimo elemento" $
      mLast [1, 2, 4] `shouldBeJust` 4

    it "dada una lista vacia, devuelve Nothing" $
      shouldBeNothing $ mLast []

  --describe "takeN" $ do
  --  it "dada una lista y un numero n, devuelve los primeros n elementos" $
  --    takeN [1, 2, 3, 4] 3 `shouldBe` [1, 2, 3]

  --  it "dada una lista de longitud menor a n y un numero n, devuelve toda la lista" $
  --    takeN [1, 2, 3] 4 `shouldBe` [1, 2, 3]

  describe "dropExactlyN" $ do
    it "dada una lista y un numero n, devuelve una lista sin los primeros n elementos" $
      dropExactlyN [1, 2, 3, 4] 3 `shouldBeJust` [4]

    it "dada una lista de longitud menor a n y un numero n, devuelve Nothing" $
      shouldBeNothing $ dropExactlyN [1, 2, 3] 4

  describe "mValorParaClave" $ do
    it "dada una lista de pares clave-valor y una clave que no se encuentra, devuelve Nothing" $
      shouldBeNothing $ mValorParaClave [(1, "uno"), (2, "dos")] 7

    it "dada una lista de pares clave-valor y una clave, devuelve el valor asociado" $
      mValorParaClave [(1, "uno"), (2, "dos")] 2 `shouldBeJust` "dos"

  describe "mMaximo" $ do
    it "dada una lista vacia, devuelve Nothing" $
      shouldBeNothing $ mMaximo []

    it "dada una lista de un elemento, devuelve ese elemento" $
      mMaximo [2] `shouldBeJust` 2

    it "dada una lista de 2 o mas numeros, devuelve el mayor" $
      mMaximo [4, 6, 1] `shouldBeJust` 6