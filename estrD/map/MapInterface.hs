module MapInterface where

class Map m where
  emptyM    :: m k v
  lookupM   :: Ord k => m k v -> k -> Maybe v
  addM      :: Ord k => m k v -> k -> v -> m k v
  removeM   :: Ord k => m k v -> k -> m k v
  domainM   :: m k v -> [k]
