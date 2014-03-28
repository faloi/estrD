module TreeSpec where

import Tree
import Test.Hspec
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "heightT" $ do
    it "dado un arbol vacio, devuelve 0" $
      heightT EmptyT `shouldBe` 0

    it "dado un arbol con un solo elemento, devuelve 1" $
      heightT (leaf 2) `shouldBe` 1

    it "dado un arbol de nivel 2, devuelve 2" $
      heightT (NodeT 2 (leaf 3) EmptyT) `shouldBe` 2

  describe "minT" $ do
    it "dado un arbol vacio, explota" $
      evaluate (minT EmptyT) `shouldThrow` anyException

    it "dado un arbol lleno, devuelve el menor numero" $
      minT (NodeT 2 (leaf 3) (leaf 1)) `shouldBe` 1

    it "dado un arbol no lleno, devuelve el menor numero" $
      minT  (NodeT 1 
              (NodeT 2 
                (leaf 4) 
                (leaf 7)
              ) 
              (NodeT 1 
                (NodeT 6
                  (leaf 0) 
                  EmptyT
                )
                EmptyT
              )
            ) `shouldBe` 0
