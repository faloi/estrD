module SetListNoReps (SetListNoReps, SLNR(..)) where

import SetInterface

data SetListNoReps = SLNR [Int]

instance Set SetListNoReps where
  empty = SLNR []

  
