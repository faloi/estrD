module SetListSortedSpec where

import SetListSorted 
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "empty" $ do
    it "devuelve un set vacio" $
      (empty::SetListSorted) `shouldBe` SLS [2] 1

  --describe "add" $ do
  --  it "dado un set vacio y un elemento, devuelve un set con ese elemento" $
  --    add (empty::SetListSorted) 2 `shouldBe` SLS [2] 1
