Priority queue
--------------

### Interface

```haskell
class PriorityQueue pq where
  emptyPQ     :: pq
  isEmptyPQ   :: pq -> Bool
  findMinPQ   :: pq -> a
  deleteMinPQ :: pq -> pq
  insertPQ    :: pq -> a -> pq
```

### Implementaciones posibles

#### Con una lista ordenada
- **O(n)** insert
- **O(1)** el resto

#### Con un binary heap

```haskell
data PQueue a = PQ (BT a) Ocurrencia

data Dir = Izq | Der
type Ocurrencia = [Dir]

{- 
  INVARIANTE DE REPRESENTACION:
  PQ t oc

  - t = NT x t1 t2 tiene que ser un arbol heap, es decir que:
    - x es el minimo de t
    - t1 y t2 son heaps

  - t es completo

  - (reverse oc) indica el lugar donde poner el proximo elemento, de manera de que t
  siga siendo completo
-}

instance PriorityQueue PQueue where
  emptyPQ               = PQ ET []
  isEmptyPQ (PQ t _)    = isEmptyT t
  findMinPQ (PQ t _)    = findMinT t

  deleteMinPQ (PQ ET _) = error "No se puede borrar del vacio"
  deleteMinPQ (PQ t oc) = 
    let oc' = reverse (prevPos oc)
    in PQ (deleteIn oc' t) oc'

  insertPQ (PQ t oc) x  = PQ (insertIn (reverse oc) t x) (nextPos oc)

nextPos :: Ocurrencia -> Ocurrencia
nextPos [] = [Izq]
nextPos (Izq:dirs) = Der : dirs
nextPos (Der:dirs) = Izq : (nextPos dirs)

prevPos :: Ocurrencia -> Ocurrencia
prevPos [Izq]       = []
prevPos (Der:dirs)  = Izq : dirs
prevPos (Izq:dirs)  = Der : (prevPos dirs)
```

```haskell
data BT = ET | NT x t1 t2

isEmptyT :: BT a -> Bool
isEmptyT ET = True
isEmptyT _  = False

findMinT :: BT a -> a
findMinT (NT x _ _) = x

insertIn :: Ocurrencia -> BT a -> a -> BT a
insertIn [] ET x = leafT x
insertIn [Izq:dirs] (NT y ti td) x = percolateUpIzq (NT y (insertIn dirs ti x) td)
insertIn [Der:dirs] (NT y ti td) x = percolateUpDer (NT y ti (insertIn dirs td x))

deleteIn :: Ocurrencia -> BT a -> BT a
deleteIn oc t = 
  let (x, NT _ ti td) = splitAt oc t 
  in percolateDown (NT x ti td)

splitAt :: Ocurrencia -> BT a -> (a, BT a)
splitAt [] (NT x ET ET) = (x, ET)

splitAt (Izq:dirs) (NT y ti td) = 
  let (x, ti') = splitAt dirs ti
  in (x, NT y ti' td)

splitAt (Der:dirs) (NT y ti td) = 
  let (x, td') = splitAt dirs td
  in (x, NT y ti td')  

percolateDown :: BT a -> BT a
percolateDown t@(NT x ET ET) = t

percolateDown t@(NT x ti@(NT yi tii tid) td@(NT yd tdi tdd))
  | x < yi && x < yd  = t
  | yi < yd           = NT yi (percolateDown (NT x tii tid)) td
  | otherwise         = NT yd ti (percolateDown (NT x tdi tdd))

percolateDown t@(NT x (NT yi ET ET) ET)
  | x < yi    = t
  | otherwise = NT yi (NT x ET ET) ET
```
