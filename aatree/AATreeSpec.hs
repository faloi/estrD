module AATreeSpec where

import AATree
import Test.Hspec
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "level" $ do
    it "dado un AATree vacio, devuelve 0" $ do
      level Nil `shouldBe` 0

    it "dado un AATree no vacio, devuelve n" $ do
      level (Node 1 12 12 Nil Nil) `shouldBe` 1

  describe "nil" $ do
    it "dado un AATree vacio, devuelve True" $ do
      nil Nil `shouldBe` True

    it "dado un AATree no vacio, devuelve False" $ do
      nil (Node 3 12 12 Nil Nil) `shouldBe` False

  describe "maximumT" $ do
    it "dado un AATree, devuelve su maximo elemento" $ do
      maximumT (Node 3 3 3
          Nil
          (Node 2 4 4 
            Nil
            (Node 1 5 5 Nil Nil)
            )
        ) `shouldBe` (5, 5)

  describe "lookupT" $ do
    --it "dado un AATree vacio, devuelve Nothing" $ do
      --lookupT Nil `shouldBe` Nothing

    it "dado un AATree no vacio y una clave que se encuentra en el, devuelve su valor" $ do
      lookupT (Node 3 3 3
          Nil
          (Node 2 4 4 
            Nil
            (Node 1 5 5 Nil Nil)
            )
        ) 5 `shouldBe` Just 5

  describe "insert" $ do
    it "dado un arbol vacio y una clave-valor, retorna una hoja con ese clave-valor" $ do
      insert Nil 2 3 `shouldBe` Node 1 2 3 Nil Nil    
