module DnD.Skill
    ( check
    , modifier
    ) where

import Random

import DnD.Data exposing (Character, Skill(..), Ability(..))
import DnD.Dice exposing (d20)
import DnD.Ability as Ability

check : Character -> Skill -> Random.Generator Int
check character skill =
    let
        skillModifier = modifier character skill
    in
        Random.map ((+) skillModifier) d20

modifier : Character -> Skill -> Int
modifier character skill =
    let
        ability = skillAbility skill
        abilityModifier = character `Ability.modifier` ability
    in
        if character `hasSkill` skill then
            abilityModifier + proficiencyBonus character
        else
            abilityModifier

proficiencyBonus : Character -> Int
proficiencyBonus character =
    (character.level // 4) + 2

hasSkill : Character -> Skill -> Bool
hasSkill character skill =
    character.skills |> case skill of
        Athletics      -> .athletics
        Acrobatics     -> .acrobatics
        SleightOfHand  -> .sleightOfHand
        Stealth        -> .stealth
        Arcana         -> .arcana
        History        -> .history
        Investigation  -> .investigation
        Nature         -> .nature
        Religion       -> .religion
        AnimalHandling -> .animalHandling
        Insight        -> .insight
        Medicine       -> .medicine
        Perception     -> .perception
        Survival       -> .survival
        Deception      -> .deception
        Intimidation   -> .intimidation
        Performance    -> .performance
        Persuasion     -> .persuasion

skillAbility : Skill -> Ability
skillAbility skill =
    case skill of
        Athletics      -> Strength
        Acrobatics     -> Dexterity
        SleightOfHand  -> Dexterity
        Stealth        -> Dexterity
        Arcana         -> Intelligence
        History        -> Intelligence
        Investigation  -> Intelligence
        Nature         -> Intelligence
        Religion       -> Intelligence
        AnimalHandling -> Wisdom
        Insight        -> Wisdom
        Medicine       -> Wisdom
        Perception     -> Wisdom
        Survival       -> Wisdom
        Deception      -> Charisma
        Intimidation   -> Charisma
        Performance    -> Charisma
        Persuasion     -> Charisma

