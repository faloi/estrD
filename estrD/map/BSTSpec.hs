module BSTSpec where

import BST
import Test.Hspec
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "agregar" $ do
    it "cuando el arbol esta vacio, devuelve un arbol con el elemento dado en la raiz" $ do
      agregar EmptyT (2, "Fede") `shouldBe` leaf (2, "Fede")

    it "cuando el arbol no esta vacio y el elemento es menor que la raiz, lo agrega en el subarbol izquierdo" $ do
      agregar (leaf (2, "Carlos")) (1, "Fede") `shouldBe` NodeT (2, "Carlos") (leaf (1, "Fede")) EmptyT

    it "cuando el arbol no esta vacio y el elemento es mayor que la raiz, lo agrega en el subarbol derecho" $ do
      agregar (
        NodeT (2, "Carlos")
          (leaf (1, "Juan"))
          (leaf (3, "Pepito"))
        ) (4, "Luisa") `shouldBe` NodeT (2, "Carlos")
          (leaf (1, "Juan"))
          (NodeT (3, "Pepito")
            EmptyT
            (leaf (4, "Luisa"))) 

  describe "list2bst" $ do
    it "dada una lista vacia, crea un EmptyT" $ do
      list2bst ([] :: [(Int, String)]) `shouldBe` EmptyT

    it "dada una lista con elementos, crea un BST" $ do
      list2bst [(1, "1"), (5, "5"), (3, "3")] `shouldBe` NodeT (3, "3") (leaf (1, "1")) (leaf (5, "5"))
