module DnD where

import Graphics.Element exposing (show)

import DnD.Data as DnD

main = show abilities

abilities : DnD.Abilities
abilities = DnD.Abilities
    { strength = 15
    , dexterity = 14
    , constitution = 12
    , intelligence = 10
    , wisdom = 13
    , charisma = 8
    }
