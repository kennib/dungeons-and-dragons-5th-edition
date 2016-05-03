module DnD where

import Graphics.Element exposing (show)

import DnD.Data as DnD

main = show character

character : DnD.Character
character =
    { level = 1
    , abilities = abilities
    , skills = skills
    }

abilities : DnD.Abilities
abilities =
    { strength = 15
    , dexterity = 14
    , constitution = 12
    , intelligence = 10
    , wisdom = 13
    , charisma = 8
    }

skills : DnD.Skills
skills =
    { athletics = True
    , acrobatics = True
    , sleightOfHand = False
    , stealth = True
    , arcana = False
    , history = False
    , investigation = False
    , nature = False
    , religion = False
    , animalHandling = False
    , insight = True
    , medicine = False
    , perception = False
    , survival = True
    , deception = False
    , intimidation = False
    , performance = False
    , persuasion = False
    }
