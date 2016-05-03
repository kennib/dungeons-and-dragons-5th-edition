module DnD.Dice
    ( d20
    ) where

import Random

d20 : Random.Generator Int
d20 = Random.int 1 20
