module DnD.Ability
    ( check
    , modifier
    ) where

import Random

import DnD.Data exposing (Character, Ability(..))
import DnD.Dice exposing (d20)

check : Character -> Ability -> Random.Generator Int
check character ability =
    let
        abilityModifier = modifier character ability
    in
        Random.map ((+) abilityModifier) d20

modifier : Character -> Ability -> Int
modifier character ability =
    let
        score = abilityScore character ability - 10
    in
        (score // 2) + (rem score 2)

abilityScore : Character -> Ability -> Int
abilityScore character ability =
    character.abilities |> case ability of
        Strength     -> .strength
        Dexterity    -> .dexterity
        Constitution -> .constitution
        Intelligence -> .intelligence
        Wisdom       -> .wisdom
        Charisma     -> .charisma
