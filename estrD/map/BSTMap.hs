module BSTMap where

import MapInterface
import BST

data BSTMap k v = MkMap (BST (k, v)) deriving (Show, Eq)

instance Map BSTMap where
  emptyM = MkMap EmptyT
  lookupM (MkMap tree) x = lookupT tree x
  addM (MkMap tree) k v = MkMap (addT tree (k, v))
