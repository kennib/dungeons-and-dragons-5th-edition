module DnD.Data
    ( Character
    , Ability(..)
    , Abilities
    , Skill(..)
    , Skills
    ) where

type alias Character =
    { level : Int
    , abilities : Abilities
    , skills : Skills
    }

type Ability =
      Strength
    | Dexterity
    | Constitution
    | Intelligence
    | Wisdom
    | Charisma

type alias Abilities =
    { strength : Int
    , dexterity : Int
    , constitution : Int
    , intelligence : Int
    , wisdom : Int
    , charisma : Int
    }

type Skill =
      Athletics
    | Acrobatics
    | SleightOfHand
    | Stealth
    | Arcana
    | History
    | Investigation
    | Nature
    | Religion
    | AnimalHandling
    | Insight
    | Medicine
    | Perception
    | Survival
    | Deception
    | Intimidation
    | Performance
    | Persuasion

type alias Skills =
    { athletics : Bool
    , acrobatics : Bool
    , sleightOfHand : Bool
    , stealth : Bool
    , arcana : Bool
    , history : Bool
    , investigation : Bool
    , nature : Bool
    , religion : Bool
    , animalHandling : Bool
    , insight : Bool
    , medicine : Bool
    , perception : Bool
    , survival : Bool
    , deception : Bool
    , intimidation : Bool
    , performance : Bool
    , persuasion : Bool
    }
