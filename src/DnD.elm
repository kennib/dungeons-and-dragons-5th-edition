module DnD where

import Random
import Graphics.Element exposing (show)

import DnD.Data as DnD
import DnD.Ability as Ability
import DnD.Skill as Skill

import DnD.UI.Ability
import DnD.UI.Player

import StartApp.Simple exposing (start)

main = start <| DnD.UI.Player.widget character

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
