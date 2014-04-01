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

  describe "tree2list" $ do
    it "dado un arbol vacio, devuelve una lista vacia" $
      tree2list EmptyT `shouldBe` ([] :: [Int])

    it "dado un arbol no vacio, devuelve una lista con todos sus elementos" $
      tree2list (NodeT 2 (NodeT 3 (leaf 4) (leaf 5)) (NodeT 6 (leaf 7) (leaf 8))) `shouldBe` [2, 3, 4, 5, 6, 7, 8]

  describe "levelT" $ do
    it "dado un arbol vacio y cualquier n, devuelve una lista vacia" $
      levelT EmptyT 8 `shouldBe` ([] :: [Int])

    it "dado un arbol y 0, devuelve una lista vacia" $
      levelT EmptyT 0 `shouldBe` ([] :: [Int])

    it "dado un arbol y 1, devuelve una lista con su raiz" $
      levelT (leaf 5) 1 `shouldBe` [5]

    it "dado un arbol y 2, devuelve una lista los elementos del nivel 2" $
      levelT (NodeT 1 (leaf 2) (leaf 3)) 2 `shouldBe` [2, 3]

    it "dado un arbol y cualquier n, devuelve una lista los elementos del nivel n" $
      levelT (NodeT 1 
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
            ) 3 `shouldBe` [4, 7, 6]

  describe "levels" $ do
    it "dado un arbol vacio, devuelve una lista de listas vacia" $
      levels EmptyT `shouldBe` ([[]] :: [[Int]])

    it "dado un arbol no vacio, devuelve la lista con la lista de cadda nivel" $
      levels (NodeT 1 
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
            ) `shouldBe` [[1], [2, 1], [4, 7, 6], [0]]
