module TreeSpec where

import Tree
import Test.Hspec
import Control.Exception (evaluate)

shouldBeEmpty xs = xs `shouldBe` ([] :: [Int])

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
    it "dado un arbol vacio, devuelve una lista vacia" $
      levels EmptyT `shouldBe` ([] :: [[Int]])

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

  describe "inorder" $ do
    it "dado un arbol vacio, devuelve una lista vacia" $
      shouldBeEmpty $ inorder EmptyT

    it "dado un arbol, devuelve una lista con los elementos recorridos en inorden" $
      inorder (NodeT 3
                (NodeT 2
                  (EmptyT)
                  (NodeT 1
                    (leaf 42)
                    EmptyT
                  )
                )
                (leaf 4)
              ) `shouldBe` [2, 42, 1, 3, 4]

  describe "isBalanced" $ do
    it "dado un arbol vacio, devuelve True" $
      isBalanced EmptyT `shouldBe` True

    it "dado un arbol no balanceado, devuelve False" $
      isBalanced  (NodeT 3
                    (NodeT 2
                      (EmptyT)
                      (NodeT 1
                        (leaf 42)
                        EmptyT
                      )
                    )
                    (leaf 4)
                  ) `shouldBe` False

    it "dado un arbol balanceado, devuelve True" $
      isBalanced  (NodeT 3
                    (leaf 42)
                    (leaf 13)
                  ) `shouldBe` True

  describe "zipConcat" $ do
    it "dada una lista vacia y otra lista, devuelve la segunda" $
      zipConcat [] [[1, 2], [3]] `shouldBe` [[1, 2], [3]]

    it "dada una lista y una lista vacia, devuelve la primera" $
      zipConcat [[1, 2], [3]] [] `shouldBe` [[1, 2], [3]]

    it "dadas dos listas con igual cantidad de elementos, devuelve una lista con el concat de cada elemento" $
      zipConcat [[1, 2], [5]] [[3, 4], [6, 7, 8]] `shouldBe` [[1, 2, 3, 4], [5, 6, 7, 8]]

    it "dadas dos listas con distinta cantidad de elementos, devuelve una lista con el concat de cada elemento" $
      zipConcat [[1, 2], [5]] [[3, 4]] `shouldBe` [[1, 2, 3, 4], [5]]

  describe "tree2listPerLevel" $ do
    it "dado un arbol vacio, devuelve una lista vacia" $
      tree2listPerLevel EmptyT `shouldBe` ([] :: [[Int]])

    it "dado un arbol no vacio, devuelve la lista con la lista de cadda nivel" $
      tree2listPerLevel (NodeT 1 
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
