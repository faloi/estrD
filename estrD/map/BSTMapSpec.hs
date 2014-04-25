module BSTMapSpec where

import MapInterface
import BSTMap
import BST
import Test.Hspec
import Control.Exception (evaluate)

mapVacio = (emptyM :: BSTMap Int String)

main :: IO ()
main = hspec $ do
  describe "emptyM" $ do
    it "devuelve un map vacio" $
      mapVacio `shouldBe` MkMap EmptyT

  describe "lookup" $ do
    it "cuando el mapa esta vacio, devuelve Nothing" $ do
      lookupM mapVacio 3 `shouldBe` Nothing

    it "cuando la clave esta en la raiz, devuelve su valor" $ do
      lookupM (MkMap (leaf (2, "Pedro"))) 2 `shouldBe` Just "Pedro"

    it "cuando la clave no esta en la raiz y los subarboles son vacios, devuelve Nothing" $ do
      lookupM (MkMap (leaf (2, "Pedro"))) 19 `shouldBe` Nothing

    it "cuando la clave esta en el subarbol izquierdo, devuelve su valor" $ do
      lookupM (MkMap (list2bst [(5, "Pedro"), (2, "Juan")])) 2 `shouldBe` Just "Juan"

    it "cuando la clave esta en el subarbol derecho, devuelve su valor" $ do
      lookupM (MkMap (list2bst [(5, "Pedro"), (8, "Pepe"), (6, "Jose"), (9, "Jesica")])) 9 `shouldBe` Just "Jesica"
